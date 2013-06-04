---
kind: article
title: ¿Que estoy escribiendo? Elementos de Programación - Unidad 2
tags: ['unl']
created_at: 20/05/2013 13:12:21
description: Explicando un poco el codigo de la Unidad 2
---

Este es el primer artículo que escribo para los compañeros de la Tecnicatura en Informática orientada al diseño multimedial y desarrollo web.

La idea es ayudar a aquellos que nunca en su vida programaron y pueden necesitar un poco de explicación extra para empezar, la idea de estos artículos va a ser responder la pregunta "¿Que estoy escribiendo?", una pregunta que les puede surgir cuando están escribiendo el código presentado en el material propuesto.

Por ejemplo, en esta unidad se les pueden surgir estas preguntas: ¿Que es "String"? ¿Que son los puntos y comas después de cada linea? ¿ Y los llaves? etc.

En la Unidad 2 de Elementos de Programación se comenzó con un poco de Java, con el clásico ["Hello World! (Hola Mundo)"](https://es.wikipedia.org/wiki/Hola_mundo) que se encuentre siempre en los instructivos de lenguajes de programación.

**Indice**

1. [Comentarios](#comentarios)
2. [Paquetes](#paquetes)
3. [Librerias](#librerias)
4. [Clases](#clases)
5. [Métodos](#metodos)
6. [Variables](#variables)
7. [¿Y las llaves?](#llaves)

¿Que estoy escribiendo?
-----------------------

Vamos a analizar el código de fuente siguiente, que se encuentra en la página 10 de la Unidad 2.

    /*
     *To change this template, choose Tools | Templates
     *and open the template editor
    */

    package u2_ejemplo2;

    /**
     *
     *@author FICH
     */

    import javax.swing.JOptionPane;
    public class Main {
    /**
     *@param args the command line arguments
    */
        public static void main(String[] args) {
            //TODO code application logic here
            String nom;
            nom = JOptionPane.showInputDialog("Ingrese su nombre");
            JOptionPane.showMessageDialog(null, "Bienvenido "+nom);
        }
    }

###<a class="internal-anchor" name="comentarios">Comentarios</a>

Para empezar, el código comienza con un comentario. Los comentarios en Java se pueden escribir de dos maneras:

1. Comentarios de una linea: Se escriben comenzando la linea con //

2. Comentarios de múltiples lineas: Se comienzan con /* y finalizan con */

"comentarios" en programación se le dice a texto contenido en el código de fuente, que es ignorado por el interprete, en este caso, por ejemplo, para el interprete es lo mismo el código anterior que el siguiente:


    package u2_ejemplo2;

    import javax.swing.JOptionPane;
    public class Main {
        public static void main(String[] args) {
            String nom;
            nom = JOptionPane.showInputDialog("Ingrese su nombre");
            JOptionPane.showMessageDialog(null, "Bienvenido "+nom);
        }
    }

Los comentarios sirven para documentar nuestro código, explicar la lógica de lo que estamos haciendo, se considera buena practica hacerlo.
Ya que ayuda a entender el código a otra gente con la que podemos compartirlo, o incluso a nosotros mismos cuando dias o semanas después revisamos código propio y no nos acordamos para que escribimos ciertas cosas.

###<a class="internal-anchor" name="paquetes">Paquetes</a>

Luego, vemos ***package u2_ejemplo2;***, la palabra package le indica a java que estamos a punto de definir un paquete, y el nombre de ese paquete es "u2_ejemplo2", un paquete es una manera de agrupar clases por sus funciones o categorías.

Por ahora explicar paquetes en profundidad no serviría ya que hay otras cuestiones a entender primero.

Así que sigamos con ***import javax.swing.JOptionPane;***.

###<a class="internal-anchor" name="librerias">Importación de librerias.</a>

import, ya esta explicado, simplemente importa otras clases, en este caso estamos importando el objeto ***JOptionPane***, que se encuentra dentro del paquete [***javax.swing***](http://docs.oracle.com/javase/6/docs/api/javax/swing/package-summary.html).
Este es uno de los tantos objetos que vienen includio en las librerias de JDK.

###¿Y los puntos y coma?

Los punto y coma le hacen saber al interprete que ahí termina una expresión.

Una expresión es una linea de código que es luego interpretada y realiza cierta acción.

    int ocho = 4+4;
    String unl = "Universidad Nacional del Litoral";

ambas son expresiones, la primera es una expresión que inicializa una variable (ocho) y le asigna un valor (8), la segunda inicializa la variable "unl" y le asigna "Universidad Nacional del Litoral".

###<a class="internal-anchor" name="clases">Declarando una clase</a>

Siguiendo, ***public class Main {*** indica que estamos declarando una nueva **clase**, y esa clase es publica (public), con el nombre Main.

public es un modificador de acceso, hay cuatro modificadores de acceso en java:

1. public (publico)
2. private (privado)
3. protected (protegido)
4. no-modifier (sin modificador)


Las clases solo pueden usar 2 de estos modificadores: public o no-modifier.
no-modifier simplemente indica que no se aplico un modificador, ejemplo:

    class MiClase {
        // Codigo
    }

Una clase publica puede ser accedida desde **cualquier** lugar (osea, cualquier otra clase puede utilizar esta clase), mientras que una clase sin modificador solo puede ser accedida desde clases contenidas en el mismo paquete.

En este caso la clase ***Main*** es la clase principal del programa por lo tanto debe ser publica -- después vemos que quiere decir que sea la clase principal.

Acá también hay que tener en cuenta el nombre de esta clase, comienza en mayúsculas, es una convención de programación que los nombres de clases comiencen en mayúsculas, a diferencia de nombres de variables o métodos que comienzan en minúsculas.

Además la convención de Java para nombrar clases, variables y métodos es la de camelCasing, por lo tanto es normal ver variables donde los nombres son por ejemplo: nombreDeMiVariable, nombreDeMiFuncion, etc.

Otras convenciones nombran las variables con guiones bajos para separar palabras (nombre_de_mi_variable, nombre_de_mi_funcion).

NO se pueden usar espacios para identificar clase, variables o métodos y de aquí salen estas diferentes convenciones.


###<a class="internal-anchor" name="metodos">Declarando un método</a>

Seguimos con ***public static void main(String[] args) {***.

Acá estamos declarando un **método**, osea una función de la clase ***Main***.

Primero observamos el modificador de acceso public, en las declaraciones de métodos se pueden utilizar cualquiera de los 4 modificadores de acceso:

- Un método publico y un método sin modificador tiene las mismas características que cuando los utilizamos al declarar una clase.

- Un método privado solo puede ser accedido por esta misma clase.

- Un método protegido puede ser accedido por clases del mismo paquete y por sub-clases (sub-clases es un tema de herencia, algo para mas adelante).

Por ahora no importa si no entendés el tema de acceso, ya que estamos trabajando solo con una clase por ahora.

Luego esta el modificador ***static***, que no es un modificador de acceso.

Por ahora no hace falta que se preocupen por estos tipos de modificadores, ya que para explicarlos primero tienen que entender otros conceptos.

Pero de manera básica, un método estático funciona sin depender de objetos de la clase donde están definidos, seria como definir un método fuera de la clase (algo que se puede hacer en otros lenguajes de programación, pero no en Java, sin embargo este modificador nos provee de algo similar), ya que no dependen directamente de ella.

seguimos con ***void***, con esto le decimos al interprete que el método ***main*** no devuelve ningún valor.
Ya que métodos pueden devolver valores, por ejemplo si definiríamos un método de esta manera:

    public static String deciHola() {
        return "Hola!";
    }

El método ***deciHola*** devuelve un valor de la clase ***String*** con el valor "Hola!"


por ejemplo, podemos re-hacer nuestro código original por el siguiente:

    package U2_Ejemplo2;
    import javax.swing.JOptionPane;
    public class Main {
        public static void main(String[] args) {
            String nom;
            nom = JOptionPane.showInputDialog("Ingrese su Nombre");
            JOptionPane.showMessageDialog(null, deciHola(nom));
        }

        private static String deciHola(String nombre) {
            return "Bienvenido "+nombre;
        }
    }

Y vamos a obtener el mismo resultado, ya que estamos obteniendo el valor de ***"Bienvenido "+nom*** con el método ***deciHola***

seguimos con nuestro código de fuente:

Sigue ***main(String[] args) {***

main como ya sabemos, es el nombre del método, luego, entre paréntesis esta el argumento que lleva el método.

En este caso el método main tiene una función especial, todo programa de Java debe tener un método publico, dentro de una clase publica, con el nombre main, que es el método que se ejecuta primero, al iniciar el programa, y todo método main debe llevar un argumento que acepte un Arreglo de Strings (String[])

Los argumentos son simplemente variables que toma el método, por ejemplo, en la modificación que presente anteriormente, el método ***deciHola*** necesita el argumento ***nombre***, que debe ser proporcionado al llamar este método, por ejemplo, si lo llamaríamos de esta manera:

    deciHola("Guillermo");

El método en la expresión de ***return*** lee este argumento, y asigna a la variable ***nombre*** el valor "Guillermo".

###<a class="internal-anchor" name="variables">¿Que es una variable, y que quiere decir lo que se antepone a su nombre?</a>

Claro, acabo de explicar un poco adelantado, así que sigamos con la siguiente linea, donde estamos declarando una variable de la clase String y te explico un poco mas de que va la mano:

***String nom***

La variable ***nom*** es del tipo ***String***, String es una clase ya definida por Java, Strings son conjuntos de caracteres, el valor siempre se delimita por comillas: "Hola!" es un String, "Bienvenido Guillermo!" es un String, etc.

Cuando definimos una variable siempre hay que indicar de que tipo es, hay muchas de diferentes clasificaciones, algunos ejemplos:

    int numero = 12
    boolean b = true
    String[] saludos = ["hola", "buenos dias", "buenas tardes"]

***int*** es un numero natural, la variable ***numero*** contiene un valor de 12, del tipo int (integer).

***boolean*** es un valor que puede ser falso o verdadero (false o true).

***String[]*** es un Arreglo (Array) de Strings, básicamente es una variable que contiene muchos Strings, en este caso 3 valores diferentes.

Luego vemos ***nom = JOptionPane.showINputDialog("Ingrese su nombre");***

Acá estamos asignando un valor a la variable ***nom*** que declaramos previamente, el valor asignado es el que devuelve el método ***showMessageDialog*** del Objeto ***JOptionPane***.

Se podría poner todo eso en una misma linea, por ejemplo:

    String nom = JOptionPane.showInputDialog("Ingrese su nombre");

Acá estamos declarando y asignando una variable en un mismo paso.

el punto (".") que se utiliza antes de ***showInputDialog*** es la manera de indicar al objeto ***JOptionPane*** que llame a este método, y luego indicamos los argumentos que necesita, como vimos antes!, en este caso el método ***showInputDialog*** pide por lo menos un argumento, que es el valor con el que va a utilizar como titulo el dialogo donde escribimos nuestro nombre.

Finalmente ***JOptionPane.showMessageDialog(null, "Bienvenido "+nom);*** llama al método ***showMessageDialog*** del objeto ***JOptionPane*** con 2 argumentos.

El primer argumento le indica al método en que "frame" debe dibujarse el dialogo, ***null*** le indica que se dibuje en el frame por defecto, no te preocupes por esto todavia.

En el segundo argumento estamos proporcionando ***"Bienvenido "+nom***, acá estamos viendo algo que se llama concatenación, en este caso, estamos concatenando dos Strings:
El String "Bienvenido " y el String contenido en nuestra variable ***nom***.

Al usar el operador "+" con strings, las concatenamos, por lo tanto, si ***nom*** contiene el valor "Guillermo", el String resultante va a ser "Bienvenido Guillermo".

###<a class="internal-anchor" name="llaves">¿Y las llaves?</a>

Las llaves delimitan **bloques**, todo lo que este entre los llaves de ***public static void main***, por ejemplo, son expresiones que corresponden a ese método.

Siempre hay que acordarse de delimitar los bloques debidamente.
Hay mucho mas que decir sobre bloques, pero no me quiero salir de las ramas, ya que esta unidad es solo una pequeña introducción.

Por ahora simplemente sepan que al definir una clase o método, hay que delimitar sus expresiones con llaves.

¡Esto es todo por ahora, espero les haya sido útil!
