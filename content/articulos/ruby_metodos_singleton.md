---
title: Clases "singleton" en Ruby
kind: article
tags: ['ruby']
created_at: 15/05/2013 14:00:00
---

Las clases singleton en Ruby pueden ser un poco confusos la primera vez que los vemos, pero en realidad es algo bastante sencillo.

Primero vamos a repasar unas características claves de Ruby:

1- Todas los objetos tienen clase, y todas las clases son objetos.

    class MiClase
        def algo
            "algo"
        end
    end

    mi_objeto = MiClase.new

    mi_objeto.class         # => MiClase
    mi_objeto.class.class   # => Class

    #Osea que MiClase, es un también un objeto, un objeto de la clase Class.

2- En Ruby podemos agregar métodos a clases ya definidas.

<?snippet?>

    #Siguiendo con el codigo previo
    mi_objeto.algo      # => "algo"
    mi_objeto.otra_cosa # => Undefined Method

    class MiClase
        def otra_cosa
            "otra cosa"
        end
    end

    mi_objeto.otra_cosa # => "otra cosa"
    mi_objeto.algo      # => "algo"

    #La clase no es sobre-escrita, sino que es extendida.

Bueno, ahora si ¿Que es una clase singleton entonces?
Simplemente esto:

    #Esta sintaxis abre la clase singleton de mi_objeto
    class << mi_objeto
        def algo_mas
            "algo mas"
        end
    end

    mi_objeto.algo_mas # => "algo mas"

    #Si hacemos otro objeto de MiClase
    mi_otro_objeto = MiClase.new

    mi_otro_objeto.algo_mas # Undefined Method

¿Qué es lo que esta pasando acá?
-------------------------------

Con ***class << mi_objeto*** estamos abriendo la clase singleton de mi_objeto, que es una clase anónima, una clase sin nombre, a la cual le estamos agregando el método ***otra_cosa***, esta clase se esta definiendo como sub-clase de ***MiClase***, y ***mi_objeto*** es el único objeto de esta sub-clase, por eso cuando llamamos ***mi_otro_objeto.algo_mas*** recibimos método sin definir.


¿Para qué me sirve esto?
------------------------

Esta técnica es usualmente utilizada para definir Métodos de Clases, a diferencia de Métodos de Instancias.

***otra_cosa*** y ***algo*** son métodos de una instancia; osea, pueden solo ser utilizadas por instancias de MiClase (***mi_objeto*** y ***mi_otro_objeto***), no puedo invocar estos métodos directamente desde MiClase (***MiClase.otra_cosa***), para eso debemos definir un método de la clase.


    mi_objeto.algo # => "algo"
    MiClase.algo   # => Indefinido
    class MiClase
        class << self
            def algo
                "algo de la clase"
            end
        end

        def algo
            "algo de la instancia"
        end
    end

    mi_objeto.algo # => "algo de la instancia"
    MiClase.algo   # => "algo de la clase"


Otra manera de definir Métodos de Clases es:

    class MiClase
        self.otra_cosa
            "otra cosa de la clase"
        end

        otra_cosa
            "otra cosa de la instancia"
        end
    end

    mi_objeto.otra_cosa # => "otra cosa de la instancia"
    MiClase.otra_cosa   # => "otra cosa de la clase"


En el [siguiente artículo](/articulos/variables_de_clases_y_de_instancias.html) vamos a ver otro uso para estas clases.
