#!/usr/bin/env ruby
# encoding: utf-8

unless [].respond_to? :to_h
  class Array
    def to_h
      Hash[self]
    end
  end
end

require 'time'
require 'base64'
require 'cgi'
require 'openssl'
require 'uri'
require 'securerandom'
require 'net/http'
require 'json'

CONSUMER_KEY = 'A4VFQFmDUGOn3zZNmG0CBBShL'
CONSUMER_SECRET = '5Q0NvcwiR7xEe2pnvUhkP6ojgvLIA93upDwkaTE26w2yaplmcs'
TOKEN = '11287042-qLW62CjfAkO5fb4BoXS9WDlqISFaPDOOujIlHVIGD'
TOKEN_SECRET = 'vIeFfI5srKo6HGYD8eu7ODOuMFcSSd1mnw9R2m2wRkSAb'

ENDPOINT = "https://api.twitter.com/1.1/statuses/user_timeline.json"

def signature params
  signing = ["GET", CGI::escape(ENDPOINT)]

  lastcomp = []
  params.each do |k,v|
    lastcomp << CGI::escape(k.to_s)+'='+CGI::escape(v)
  end

  signing << CGI::escape(lastcomp.join('&'))
  signing.join("&")
end


def request query, oauth
  uri = URI.parse(ENDPOINT+'?'+query)
  req = Net::HTTP::Get.new(uri)

  req['Authorization'] = "OAuth "+oauth.sort_by {|k,_| k } .map {|k,v| %{#{k}="#{v}"} }.join(',')

  requester = Net::HTTP.new(uri.host, uri.port)
  requester.use_ssl = true

  # requester.set_debug_output $stderr
  begin
    res = requester.start do |http|
      http.request(req)
    end
  rescue OpenSSL::SSL::SSLError
    #porqué windows
    requester.verify_mode = OpenSSL::SSL::VERIFY_NONE
    retry
  end

  JSON.parse(res.body)
end


def get_tweets user
  if user.nil? || user.strip == ""
    raise "No especificaste un usuario :("
  end
  query = "screen_name=#{user}&count=200"
  oauth = {
    oauth_consumer_key: CONSUMER_KEY,
    oauth_nonce: SecureRandom.hex,
    oauth_signature_method: 'HMAC-SHA1',
    oauth_timestamp: Time.now.to_i.to_s,
    oauth_token: TOKEN,
    oauth_version: '1.0',
  }
  params = oauth.dup.merge({
    screen_name: user,
    count: '200'
  }).sort_by {|k,_| k }.to_h

  string_to_sign = signature(params)

  sign_key = [CONSUMER_SECRET, TOKEN_SECRET].map {|v| CGI::escape(v)}.join('&')
  signed = CGI::escape Base64.encode64(OpenSSL::HMAC.digest('sha1', sign_key, string_to_sign)).strip

  oauth[:oauth_signature] = signed;

  res = request(query, oauth)
  if res.is_a?(Hash) && res['errors']
    errs = res['errors'].map {|e| e['message']}.join("\n---\n")
    raise "Twitter no nos quiso: #{errs}"
  end
  res.map do |t|
    {
      fecha: Time.parse(t['created_at']),
      texto: t['text'],
      id: t['id_str'],
      menciones: t['text'].split(' ').select {|w| w.strip[0] == '@' }
    }
  end
end