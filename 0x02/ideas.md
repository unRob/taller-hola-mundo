# rftm | no entender | 0x02

Es dificil escribir código libre de errores a la primera; memorizar ayuda, pero dista de ser el único recurso de la programadora. Hoy nos vamos a preparar para enfrentar los posibles errores, aprendiendo a usar métodos sencillos para des-trabarnos.

A través del uso cotidiano de los mismos, podemos identificar, entender y corregir problemas en nuestro código, tanto funcionales como de estructura.

Ya sabemos de primera mano que la curva de aprendizaje que supone programar es bastante inclinada, y usaremos estos métodos como primera línea de defensa.

### Estructuras de datos
De la sesión pasada sabemos que podemos almacenar distintos _tipos_ de información en _estructuras de datos_ como

`String`, 

```ruby
"Patito"
```

 `Float`,

```ruby
2.5
```

 `Hash`,

```ruby
{nombre: "Patito", cantidad: 2.5}
```

y `Array`

```ruby
[
  {nombre: "Patito", cantidad: 2.5},
  {nombre: "Patito", cantidad: 2.5},
  {nombre: "Patito", cantidad: 2.5},
  {nombre: "Patito", cantidad: 2.5},
]
```

### Estructuras de control

Hacemos uso de los datos mediante estructuras de control, como: 

`Condicionales`

```ruby
if 2 + 2 == 5
  puts "Hail to the Thief"
elsif 5/4 == :take_five
  puts "Time Out"
else
  puts "Untitled"
end
```


`Iterativas`

```ruby
["paul", "john", "ringo", "george"].each do |beatle|
  puts "¡#{beatle}!"
end
```

### Algoritmoñol

La sesión pasada nos enfrentamos a un problema monumental: ¿A qué hora tuiteo mas?

Nos dimos cuenta que programar una solución a esta pregunta implica coordinar varias herramientas. Tuvimos que instalar un editor de texto, y después usar la consola de comandos para ejecutar el programa que guardamos.

Hablamos algo de "algoritmoñol", a pesar de los problemas técnicos. Tengo algunos patitos conmigo para que practiquemos un poco mas, esta vez haciéndola nosotros de `ruby`.

```ruby
patitos = ["patito_1", "patito_2", "patito_3", "patito_4", "patito_5"]

while patitos.count > 0

  patito = patitos.first

  asistentes.each do |asistente|
    if asistente[:patito] == nil
      asistente[:patito] = patito
      puts "Le dimos el patito #{patito} a #{asistente[:nombre]}"
      break # para este ciclo y salta a lo que sigue
    end
  end

  # despues de parar, continua acá
  patitos.delete_at(0)
  if patitos.count > 0
    puts "Nos quedan #{patitos.count} patitos"
  else
    puts "¡Ya no tenemos patitos!"
  end

end
```

Leer código traduciéndolo al _algoritmoñol_ es una buena manera de empezar a sentirnos comodoas con las estructuras de control y estructuras de datos de ruby.

## Métodos para resolver problemas

En la sesión anterior nos dimos cuenta lo frustrante que puede ser comenzar a programar sin ayuda. Lo bueno, es que a partir de hoy tendremos a nuestra disposición algunos métodos para corregir los problemas que sin duda nos toparemos.

### El "Feynman"

Richard Feynman fue un físico que —según su colega Murray Gell-Man— resolvía problemas de la siguiente manera:

> 1. Anota el problema
> 2. Piensa detenidamente
> 3. Anota la respuesta

Por ejemplo:

```ruby
# ¿Cómo invierto el órden de las letras de esta palabra?
"patito"

# pensando...

"patito".reverse
```

Éste, aunque es un acercamiento válido, resulta muy difícil de hacer bien.

### El "Patito"

Este es mi método favorito para des-trabarme cuándo algo no funciona, y lo hé [leido](http://www.rubberduckdebugging.com) resumido de la siguiente manera:

> 1. Consigue un patito de hule
> 2. Ponlo en tu escritorio e infórmale que le vas a explicar algo de código
> 3. Dile qué debería hacer tu código, y explícale línea por línea que va pasando
> 4. En algún punto vas a decirle al patito qué sigue y te darás cuenta que lo que está escrito no corresponde a lo que quieres hacer. El patito se va a quedar bien quietecito, feliz de saber que te acaba de ayudar a continuar.

Por ejemplo:

```ruby
pizza_en = Time.now + (30*60)
until Time.now == pizza_en
  puts "Esperando a que llegue la pizza..."
  sleep 55
end

puts "¡YAY, PIZZA!"
```

> Este programa nos avisará cuándo esté por llegar la pizza, pero se queda esperando infinitamente
> 
> En la primer línea asignamos la fecha y hora actual, sumándole treinta minutos, a `pizza_en`.
> Luego, esperamos a que el tiempo actual sea igual a `pizza_en`,
> en cada ciclo escribimos "Esperando a que llegue la pizza..." a la pantalla, y
> paramos cada minuto...

En este punto es obvio que `55 != 60`. Por otro lado, podríamos hacer nuestro ciclo más permisivo si en vez de revisar que `Time.now` sea igual a `pizza_en`, evaluamos que sea mayor o igual qué (`>=`) a `Time.now`, no habrá gran problema si dormimos más del tiempo necesario:

```ruby
pizza_en = Time.now + (30*60)
until Time.now >= pizza_en
  puts "Esperando a que llegue la pizza..."
  sleep 60
end

puts "¡YAY, PIZZA!"
```

Es tan útil este método, que me he convencido de tener —no uno— sino un *comité* formado por cinco patitos, por si las moscas. Tan simple como contarle a un objeto inanimado que esperas de tu programa y qué está pasando en cada línea de código.


### El "Google"

9 de cada 10 programadores usan el internet para resolver dudas, y ¡tú también puedes hacerlo!

> 1. Entras a google.com
> 2. Escribes tu pregunta
> 3. Lees todos los resultados hasta que alguno de éstos te resuelva tu problema

Por ejemplo: 

```ruby
puts Date.today
# => hoy.rb:1:in `<main>': uninitialized constant Date (NameError)
```

El error parece una computadora vomitando, y de alguna manera menos que poética, lo es. Eso sí, dentro de ese desbarajuste de error tenemos datos importantes para averiguar qué falló.

`hoy.rb` se refiere al archivo que estabamos leyendo en el momento del error. Al ejecutar la línea `1`, mientras ruby estaba dentro del bloque `main`, en este caso, el bloque principal de todo programa, sucedió un error de tipo `NameError`. Este error nos indica que el problema es `uninitialized constant Date`.

Interpretando esto, podemos entrar a google y escribir "uninitialized constant date". El primer resultado suena bien documentado.

[StackOverflow](http://stackoverflow.com/questions/3023628/ruby-nameerror-when-referring-to-date), un sitio de preguntas y respuestas de programación, nos da la solución: "Try `require 'date'`"

```ruby
require 'date'
puts Date.today
```

### Problemitas de Problemotas

A través de estos métodos podemos ir derivando los problemas monumentales en problemas fáciles de resolver, casi sólo buscando en google.

Cada que subdividimos una tarea en tareas más pequeñas, estas últimas se vuelven mas fáciles de resolver, al punto que podamos ver que sólo hay dos tipos de problemas:

Problemas lo suficientemente sencillos que de antemano sabemos resolver, o problemas que no hemos subdividido lo suficiente.

## Ejercicio

## quote 

> If debugging is the process of removing software bugs, then programming must be the process of putting them in.
> 
> Atribuida a EWD