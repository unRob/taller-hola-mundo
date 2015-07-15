# En vez de copiar y pegar código, podemos "requerirlo"
# en este caso, ruby va a buscar en el mismo directorio en el
# que se encuentre este archivo un con nombre "lib.rb" y lo
# interpretará en este punto.
require_relative 'lib.rb'

# queremos el primer argumento del array `ARGV`
# `ARGV` se refiere a los argumentos que escribimos después
# de "ruby ejercicio.rb" en la terminal
# por ejemplo, "ruby ejercicio.rb sandimetz"
twitter_username = ARGV[0]

tuits = get_tweets(twitter_username)
# Esto asigna a la variable tuits
# un array de hashes, algo así:
# [
#   {
#     fecha: Time,
#     texto: String,
#     id: String,
#     menciones: [String]
#   }
# ]


# Ejecuta este programa y veamos un tweet de sandimetz
puts tuits.first[:texto]
puts "Sandi Metz, #{tuits.first[:fecha].year}"










# Hints:
# http://ruby-doc.org/core-2.2.0/Time.html