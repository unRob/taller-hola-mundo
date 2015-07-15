# foobar | aprender | 0x01

## Estructuras de datos

Cómo sabemos, programar se trata de procesar datos, pero ¿cómo son estos datos? ¿Qué características tienen?

```ruby
"Hola" # String
42 # Integer
3.141592 # Float
(0..10) # Range
/([a-z]*ol[a-z]*)/
```

Estos son los tipos más básicos, y poco a poco los van a ir reconociendo de manera intuitiva por cómo se pueden usar:

```ruby
"Hola" + " mundo"
# => "Hola mundo"

"BUROCRACIA".downcase
# => "burocracia"

1 / 2
# => 0

1.odd?

# => true

1.0 / 2.0
# => 0.5

(3.141593).round(2)
# => 3.14
```

Un tipo de dato muy interesante son las EXPresiones REGulares, una manera de encontrar patrones en un String.

```ruby
str = "Se cayó a la olla por la golosina de una cebolla"
exp = /([a-z]*ol[a-z]*)/

puts str.scan(exp).flatten
["olla", "golosina", "cebolla"]
```

Lo que sucede aquí, es que le indicamos a ruby que nos entregue una lista de todos los caracteres que cumplan con el patrón —expresión regular— que le indicamos, en este caso: "todos los caracteres de la A a la Z, repetidos 0 o mas veces, seguidos de la secuencia «ol», seguidos del todos los caracteres de la A a la Z, repetidos 0 o mas veces".

El resultado de esto es una lista, o en términos de ruby, un _Array_.

Otro ejemplo de una lista, sería el de las asistentes a este curso:

```ruby
asistentes = [
  "Darinka",
  "Liliana",
  "Ana Paula",
  "Erandi",
  "Fer"
]
```

Estas `asistentes` son una lista ordenada, y se delimita por los corchetes cuadrados. La lista va del índice `0` correspondiente a _Darinka_, al `4` correspondiente a _Fer_.

Las listas nos sirven para agrupar datos, muchas veces datos similares. ¿Qué podemos hacer con ellas?

```ruby
asistentes[0]
# => "Darinka"

asistentes << "Maru"
# => ["Darinka", "Liliana", "Ana Paula", "Erandi", "Fer", "Maru"]

asistentes.count
# => 6

asistentes.include? "Grace Hopper"
# => false
```

Las listas son muy útiles cuándo deseas usar los datos contenidos de manera secuencial, ya que sólo podemos obtener los valores contenidos mediante sus índices. Esto no siempre es adecuado, y muchas veces vamos a querer almacenar estos datos "etiquetados de alguna manera". En estos casos podemos usar un diccionario, en términos de ruby, un _Hash_

```ruby
persona = {
    nombre: "Grace Hopper",
    ocupacion: "Programadora",
    fecha_nacimiento: Date.new(1906, 12, 9)
}
```

Los diccionarios relacionan una _propiedad_ a un _valor_. En nuestro ejemplo, la _variable_ asistente, tiene una _propiedad_ `:nombre`, qué corresponde a "Grace Hopper". A diferencia de las listas, no usamos índices para obtener los valores, sino las propiedades mismas del diccionario.

```ruby
persona[:nombre]
# => "Grace Hopper"

persona.delete(:fecha_nacimiento)
# => #<Date: 1906-12-09 ((2417554j,0s,0n),+0s,2299161j)>

persona.has_key? :fecha_nacimiento
# => false

persona[:ocupacion] = "Científica de la computación"
# => "Científica de la computación"
```

¿Cual es el _tipo_ de las propiedades de este diccionario? No son `Strings` ya que no están delimitadas por comillas dobles ("), pero son muy parecidas, y por ahora sólo es necesario saber que son _Símbolos_. Nos hacen la vida fácil cuando trabajamos con diccionarios, facilitándonos la enumeración de propiedades.

¿Qué pasaría si intentamos obtener una propiedad inexistente de un diccionario?

```ruby
persona[:que_tan_cool_es]
# => nil
```

Ruby nos indica con `nil` que no esa propiedad no tiene valor. La ausencia de valor es un tipo de dato también. No existe en nuestro diccionario de `persona`, pero no quita que Grace Hopper haya sido extremadamente cool. 

---
> A human must turn information into intelligence or knowledge. We've tended to forget that no computer will ever ask a new question.
> 
> Grace Hopper

Extracto de "[The Wit and Wisdom of Grace Hopper](http://www.cs.yale.edu/homes/tap/Files/hopper-wit.html)", From The OCLC Newsletter, March/April, 1987, No. 167 (Editor and article author is Philip Schieber.)
---

Estos son sólo algunos de los tipos y estructuras de datos que tenemos en ruby, y hay muchas mas. Como programadores incluso podemos crear las que nosotros queramos, pero eso es para otra ocasión.

## Estructuras de control

> Nota: Esto no lo vamos a ver porque nomás es ñoñería y no creo que aclare nada sobre nada que queramos saber ahora. Lo dejo, por si luego me gusta para algo, y porqué no es como si estuviera usando una herramienta de SCM...
> La lógica de las computadoras es, hasta ahora, binaria. Eso quiere decir que toda la información en la "era de la información" existe como un uno o un cero, flujo de electrones o no.
> 
> Es un viaje entender cómo es que esto resulta en fotos de gatitos, pero por ahora sólo basta saber que una esta pieza de información se llama bit, y una secuencia de 8 bits se llama byte.
> 
> Este byte, interpretado como un número en base 10, resulta ser cuarenta y dos. Si lo interpretamos como una posición en la tabla de letras ASCII, resulta ser la letra "B" mayúscula.
> 
> Lo importante, por ahora, es pensar en el estado binario de la información, y como enseñarle a la computadora a tomar decisiones al respecto.

Programando, intentamos mecanizar tanto la toma de decisiones como la tarea de llevarlas a cabo; lo hacemos a través del uso de "estructuras de control". Zafémonos de las observaciones posmodernistas, aprender a programar con Foucault es mucho mas dificil.

En el ejercicio anterior, se toparon con un pedazo nuevo de código:

```ruby
if es_impar(entero)
  # ...
end
```

Este código al ejecutarse podría expresar algo como:
```ruby
if 1 / 2 == 0.5
  # ...
end
```

Este es el momento adecuado para decirles que la instrucción anterior no es *verdadera*, y esto se debe a que las computadoras son muy brutas. Cuándo le pedimos a ruby que divida [uno] entre [dos], éste interpreta la operación como una entre dos _enteros_, y por lo mismo va a regresarnos un entero, en este caso [cero].

Por otro lado, no sólo podemos pedirle a la computadora que evalúe si una *expresión* es *verdadera*, también podemos pedirle evaluar lo contrario.

```ruby
if 1 / 2 != 0.5
  # ...
end
```

---

Los programadores, eso sí, debemos ser activamente flojos. Tenemos una herramienta que nos ayuda a mecanizar procesos, evaluar "la *falsedad*" es muy sencillo:

```ruby
if respuesta == 42
  puts "Douglas Adams, tiene razón!"    
else
  puts "La respuesta no es 42"
end
```

Podemos incluso programar más de una evaluación de *verdad*:

1. Por ejemplo, Si la variable `numero` equivale a `1`, el resultado de la evaluación será `puts "Güan"`
2. Si `numero` en realidad equivale a `3`, entonces ruby diría: "Tri"
3. De otro modo, si no es `1`, `2`, ó `3`, en este caso `0`, ruby dirá "Cuarenta y dos"

```ruby
if numero == 1
  puts "Güan"
elsif numero == 2
  puts "Tu"
elsif numero == 3
  puts "Tri"
else
  puts "Cuarenta y dos"
end
```

Para estos casos, ruby tiene una mejor manera de hacer las cosas; está "diseñado para hacer feliz a loas programadoreas" [[cita](http://www.artima.com/intv/rubyP.html)], después de todo. 

```ruby
puts case numero
  when 1 then "Güan"
  when 2 then "Tu"
  when 3 then "Tri"
  when (4..41) then "Tu meni"
  else "forti tu"
end
```

---

Hay estructuras mas interesantes que no sólo evalúan verdades:

```ruby
el_futuro = Time.now + 5
until Time.now > el_futuro do
  puts "Esperando a que llegue el futuro…"
  sleep 1
end
puts "JETPACKS PARA TODOAS!"

# => Esperando a que llegue el futuro…
# => Esperando a que llegue el futuro…
# => Esperando a que llegue el futuro…
# => Esperando a que llegue el futuro…
# => Esperando a que llegue el futuro…
# => Jetpacks para TODOAS!
```

Otras, en las que iteramos por una lista:

```ruby
for a in asistentes
  puts "Jetpack para #{a}"
end
puts "Jetpacks para TODOAS!"
```

Claro, que loas que escribimos ruby sabemos que hay mas de una manera para operar sobre un `array`:

```ruby
asistentes.each do |a|
  puts "Jetpack para #{a}"
end
```

```ruby
puts asistentes.map {|a| "Jetpack para "+a }.join("\n")
```

---

## Algoritmoñol

Con estos conceptos en mente, hablemos de Algoritmoñol, una palabra inventada que probablemente haga llorar a científicos de la computación como linguistas por igual. 

En Algoritmoñol, las estructuras de datos son los *sustantivos* y las estructuras de control son los verbos.

```ruby
puts asistentes.map {|a| "Jetpack para "+a }.join("\n")
```

Eso diría:

> Imprime el resultado de la siguientes expresiones:
> 
> 1. Toma la lista “asistentes” y:
>   1. Convierte cada elemento:
>     1. Sumando el elemento a “Jetpack para “
> 2. Junta los elementos de la lista, poniendo el caracter “salto de línea” de pormedio.

Bien, ahora que han visto un ejemplo de algoritmoñol, se pueden declarar expertoas en leerlo. Es muy parecido al español, si mas ñoño. La idea es aprender a escribirlo.

Para hacerlo, tenemos que definir claramente las preguntas que nos estamos haciendo, por ejemplo "Tengo una lista de nombres, ¿a quiénes les toca un jetpack?".

Con esto, ya sabemos qué entra: una lista de nombres. Sabemos qué va a resolver nuestro programa, y es momento de pensar brevemente en qué queremos que regrese.

Podríamos especificar: "Mi programa debe entregar a la terminal texto que responda a la pregunta."

Es así de obvio, que lo único que debemos decidir, es qué estructuras de control nos sirven para acercarnos a la respuesta.

```ruby
# Evalúa si persona merece un jetpack
def merece_jetpack? persona
  # Todoas merecemos uno!
  return true
end

# El usuario en la terminal nos
# va a dar la lista de asistentes
asistentes = ARGV

# Iteramos por la lista
asistentes.each do |a|
  if merece_jetpack? a
    # Imprimimos los resultados
    puts "Jetpack para #{a}!"
  end
end
```

Si le indicamos a ruby que interprete nuestro archivo, obtenemos la respuesta:

```bash
ruby jetpacks.rb Darinka Liliana "Ana Paula" Erandi Fer Maru
```

## Ejercicio

### Archivos:
* [Aca empezamos](ejercicio.rb)
* [Usaremos este código](lib.rb)

¿A qué hora tuiteo mas?

Hints:
```ruby
a = [5, 7, 11, 13]
a[2] += 1 # => 12

h = {}
h[24] = 1
h[24] += 1
h[6] = 42
puts h
# => {0 => 2, 6 => 42}

a.each do |item|
  # ?
end

h[a[0]] += 1
# => NoMethodError: undefined method `+' for nil:NilClass

if h.has_key?(a[0])
  h[a[0]] = 0
end
h[a[0]] += 1 #=> 1
```
---

## quote
> **Data dominates** . If you've chosen the **right data structures** and organized things well, the algorithms will almost always be self-evident. **Data structures, not algorithms**, are central to programming.
> 
> Rob Pike

Extracto de "[The Art of Unix Programming](http://www.faqs.org/docs/artu/index.html)", Eric S. Raymond, 2003.