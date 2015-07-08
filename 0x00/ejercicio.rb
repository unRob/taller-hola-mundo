# encoding: utf-8

# Este es otro bloque especial, denominado "función"
# Podemos ver en la línea 13, cómo se invoca/ejecuta
# implementa el cuerpo de este bloque regresando true, si es impar,
# y regresando false, si no lo es
def es_impar(numero)
  resultado = nil
  return resultado
end

(1..10).each do |entero|
  if es_impar(entero)
    puts "#{entero} es un número impar"
  else
    puts "#{entero} es un númer par"
  end
end


# Galletas extra:
# guarda tu código en un archivo y encuentra la manera de correr tu programa
#
# -----
#
# Hints:
# Las líneas que empiezan con un "hash" (#), son ignoradas por ruby
# las usamos para comentar nuestro código
# google: "ruby odd number"
