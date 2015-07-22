#
#
#
#
#
#
#
#
#

str = "electrodoméstico"

(str.length).downto(-str.length).each do |caracteres|
  next if caracteres == 0 || caracteres == -1
  puts str[0, caracteres.abs]
end