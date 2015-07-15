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

```
persona = {
    nombre: "Grace Hopper",
    ocupacion: "Programadora",
    fecha_nacimiento: Date.new(1906, 12, 9)
}
```

Los diccionarios relacionan una _propiedad_ a un _valor_. En nuestro ejemplo, la _variable_ asistente, tiene una _propiedad_ `:nombre`, qué corresponde a "Grace Hopper". A diferencia de las listas, no usamos índices para obtener los valores, sino las propiedades mismas del diccionario.

```
persona[:nombre]
# => "Grace Hopper"

persona.delete(:fecha_nacimiento)
# => #<Date: 1906-12-09 ((2417554j,0s,0n),+0s,2299161j)>

persona.has_key? :fecha_nacimiento
# => false

persona[:ocupacion] = "Científica de la computación"
# => "Científica de la computación"
```

## Estructuras de control

La lógica de las computadoras es, hasta ahora, binaria. Eso quiere decir que toda la información en la "era de la información" existe como un uno o un cero, flujo de electrones o no.

Es un viaje entender cómo es que esto resulta en fotos de gatitos, pero por ahora sólo basta saber que una esta pieza de información se llama bit, y una secuencia de 8 bits se llama byte.

Este byte, interpretado como un número en base 10, resulta ser cuarenta y dos. Si lo interpretamos como una posición en la tabla de letras ASCII, resulta ser la letra "B" mayúscula.

Lo importante, por ahora, es pensar en el estado binario de la información, y como enseñarle a la computadora a tomar decisiones al respecto.

Estas decisiones, las conocemos como "estructuras de control"; Zafémonos de las observaciones posmodernistas, aprender a programar con Foucault es mucho mas dificil.

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

Este es el momento adecuado para decirles que la instrucción anterior no es *verdadera*, y esto se debe a que las computadoras son muy brutas. Cuándo le pedimos a ruby que divida [uno] entre [dos], éste interpreta la operación como una entre dos enteros, y por lo mismo va a regresarnos un entero, en este caso [cero].

Por otro lado, no sólo podemos pedirle a la computadora que evalúe si una *expresión* es *verdadera*, también podemos pedirle evaluar lo contrario.

```ruby
if 1 / 2 != 0.5
  # ...
end
```

---

Los programadores, eso sí, debemos ser activamente flojos. Tenemos una herramienta que nos ayuda a mecanizar procesos, y es por esto que no sólo podemos hacer que la computadora evalué "la *verdad*", sino también *falsedad* o distintos casos de *verdad*:

```ruby
if respuesta == 42
  puts "Douglas Adams, tiene razón!"    
else
  puts "La respuesta no es 42"
end
```

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


## Algoritmoñol

> A human must turn information into intelligence or knowledge. We've tended to forget that no computer will ever ask a new question.
> 
> Grace Hopper

Extracto de "[The Wit and Wisdom of Grace Hopper](http://www.cs.yale.edu/homes/tap/Files/hopper-wit.html)", From The OCLC Newsletter, March/April, 1987, No. 167 (Editor and article author is Philip Schieber.)

Para decirle a una computadora que hacer, 


## quote
> **Data dominates** . If you've chosen the **right data structures** and organized things well, the algorithms will almost always be self-evident. **Data structures, not algorithms**, are central to programming.
> 
> Rob Pike

Extracto de "[The Art of Unix Programming](http://www.faqs.org/docs/artu/index.html)", Eric S. Raymond, 2003.