---
kind: article_pending
title: Practicando- Mas variables, mas métodos.
tags: ['unl_pending']
created_at: 25/05/2013 12:12:31
description: Para entender un poco mejor las variables, y aclimatarze con escribir codigo simple.
---

Despues de publicar el articulo anterior sobre Java, muchos me empezaron a preguntar diferentes cosas, queda claro que hay que explicar un poco más ciertas cosas.

Para aprender un lenguaje de programación no queda otra que ESCRIBIR Y ESCRIBIR! Y si no entendes algo, lo buscas, lo analizas y buscas mas ejemplos. 

En este articulo vamos a hacer un programa sencillo, donde vas a poder ingresar muchos numeros, y el programa te va a decir cual es el menor y cual es el mayor.
Para hacer esto vamos a ver algunas cosas nuevas:

+ Arrays (arreglos), son conjuntos de valores; algo como muchas variables en una, como los vectores que vimos en matematica.

+ loops (bucles), para repetición controlada de ciertas operaciones.

+ ints, otro tipo de variables. Que son numeros enteros.

Si tenes interes genuino en aprender a programar (¡Y si estas en esta carrera tengo que asumir que es asi!), mientras leas este articulo te recomiendo lo siguiente:

+ Cuando veas codigo de fuente que yo presento, antes de leer la explicación que doy, trata de analizarlo, anota lo que PENSAS que hace.

+ ¡Probalo! Probalo antes de ver mi explicación y volve a analizar que es lo que esta haciendo.

+ ¡Escribilo! Es sumamente importante que escribas el codigo presentado, no copies y pegues! Al escribirlo tu mente va a recolcetar mejor lo presentado, y mientras lo escribas trata de ir pensando que es lo que estas haciendo.


Para hacer este programa, vamos a usar javax.swing.JOption, como en la Unidad 2, si bien preferiria usar System.out, que seria mas sencillo, pero con JOption pane es mas facil de visualizar para los que usan Windows (que creo que son la mayoria, sino todos, de ustedes)

Otra cosa, yo no uso NetBeans para escribir mi codigo, asi que no voy a estar dando datos sobre eso. 
No uso IDEs (NetBeans es un IDE), IDE significa "Integradted development environment", osea, un programa para editar codigo, viene con ciertas cosas que puede dar cierta automatización al proceso de programar, pero en mi opinion es una mala practica usar IDEs, y es mejor usar algún editor de texto bueno, en Windows esta [Notepad++](http://notepad-plus-plus.org), yo personalmente uso VIM.

Lo principal es que el editor de texto coloreé automaticamente el codigo que escriben para poder visualizarlo mas facil, de todas maneras, esta bien que usen NetBeans para empezar, mi punto es que con eso no voy a poder ayudar, ya que no lo conozco, pero no creo sea algo muy complicado:

1- Crean un nuevo proyecto, le dan el nombre que quieran.

2- Cuando escriben codigo, con F9 lo compilan.

3- Y con F6 lo ejecutan.

###Analizando nuestro objetivo

Bueno, suficiente de introducción, el primer paso a escribir un programa es entender lo que queremos hacer, pensandolo como programador.

Basicamente, que procesos va a necesitar nuestro programa?

Primero tiene que recibir los numeros que va a analizar. Osea que necesitamos crear una ventana de dialogo donde el usuario pueda ingresar datos.

Segundo, el programa tiene que archivar todos esos numeros y luego analizarlos.

Finalmente, el programa nos va a mostrar el numero menor y el mayor en una ventana de dialogo.

Vamos a empezar con un poco de pseudo-codigo:

(Pseudo-codigo se le dice a codigo que no es ningún lenguaje de programación, pero que sigue ciertas normas de ellos, se suele escribir pseudo-codigo para analizar sencillamente como podria funcionar un programa o una función.)

    Se ejecuta el programa:
      
      Usuario ingresa numeros

      variable numeros = numeros_ingresados // Una lista de los numeros ingresados

      variable numero_mayor = mayor(numeros_ingresados)

      variable numero_menor = menor(numeros_ingresados)

      mostrarVentanaDeDialogo(numero_menor + numero_mayor)

En la ultima linea pareceria como si estamos sumando los numeros, pero si recordamos lo que explique sobre concatenación de Strings, acá el operador "+" esta juntando los Strings, no sumando numeros!

###¿Porque pasa esto? si son numeros

Recordemos que cada variable tiene un tipo, ***String*** es uno, ***int*** es otro.

Int (Integer) significa **numero entero**, pero por mas que pongamos numeros en la ventana de dialogo, de ahi se devuelven ***Strings***, osea que el programa no va a poder ver cual numero es menor o mayor, si lo que le estamos dando son carácteres, no numeros.

Por lo tanto primero tenemos que pasar lo que ingresamos (Strings) a numeros enteros (Ints).

Para entender esto, hay que verlo en el codigo, vamos con Java nomas:
(Acuerdense que ***//*** significa comentario, el interprete de Java ignora eso, los comentarios son para nosotros).

  
    import javax.swing.JOptionPane;

    public class Main {
      
      public static void main(String[] args) {
        
        // Inicializamos la variable numeros, que es tipo String.

        String numeros;

        //Llamamos al método showInputDialog, y lo que se ingresa
        //se asigna a la variable numeros.
        numeros = javax.swing.JOptionPane.showInputDialog("Ingrese numeros:");

        //Por ahora vamos a mostrar todos los numeros que ingresamos,
        //Al programar siempre hay que ir de a poco, paso a paso.
        javax.swing.JOptionPane.showMessageDialog(null, numeros);
      }
    }

Compilamos y ejecutamos. El programa por ahora simplemente nos da para escribir algo, y despues nos muestra lo que escribimos.

Prueben cambiar ***String numeros*** a ***int numeros***, osea, cambiar el tipo de variable de Conjunto de carácteres a numero entero, y compilen.

Van a recibir un error de compilación, "incompatible types", tipos incompatibles, porque ***showInputDialog*** solo puede leer Strings, pero le estamos intentando de asignar al resultado un numero natural.

  int numero = 5
  String caracterDeUnNumero = "5"

Esas 2 variables son totalmente diferentes para el interprete, la primera es el **VALOR 5**, la segunda es el **CARÁCTER 5**.

[Carácter, link a wikipedia.](http://es.wikipedia.org/wiki/Car%C3%A1cter_(tipo_de_dato))

Por lo tanto nuestra variable ***numeros*** debe ser del tipo string, pero, el interprete no puede realizar operaciones matematicas sobre caracteres, tenemos que hacer que interprete ese caracter como el numero correspondiente, por suerte, Java tiene un método incluido para hacer esto.

Primero, confirmemos que Java no puede realizar operaciones matematicas con caracteres de numeros:
(toma nota que vas a tener que ingresar UN solo numero esta vez, o el programa te va a tirar un error, que luego correjiremos)

    //Importamos JOptionPane, que es el objeto que vamos a usar
    // para mostrar las ventanas de dialogo.
    import javax.swing.JOptionPane;
    public class Main {
      
      public static void main(String[] args) {
        
        // Inicializamos la variable numeros, que es tipo String.

        String numeros;

        //Llamamos al método showInputDialog, y lo que se ingresa
        //se asigna a la variable numeros.
        numeros = javax.swing.JOptionPane.showInputDialog("Ingrese numeros:");

        //Intentamos dividir nuestro numero en 2.
        numeros = numeros / 2;

        //Por ahora vamos a mostrar todos los numeros que ingresamos,
        //Al programar siempre hay que ir de a poco, paso a paso.
        javax.swing.JOptionPane.showMessageDialog(null, numeros);
      }
    }

Intenta compilar, y error, nos dice que el operador '/' no corresponde en este caso.

Ahora vamos a agregar dos lineas de codigo y ver que pasa.
(Y también modificamos la ultima linea!)

    //Importamos JOptionPane, que es el objeto que vamos a usar
    // para mostrar las ventanas de dialogo.
    import javax.swing.JOptionPane;
    public class Main {
      
      public static void main(String[] args) {
        
        // Inicializamos la variable numeros, que es tipo String.

        String numeros;

        //Llamamos al método showInputDialog, y lo que se ingresa
        //se asigna a la variable numeros.
        numeros = javax.swing.JOptionPane.showInputDialog("Ingrese numeros:");

        // LINEAS AGREGADAS:
        int numero_entero = Integer.parseInt(numeros);
        numero_entero = numeros / 2;
        //////////////////////////////

        //Por ahora vamos a mostrar todos los numeros que ingresamos,
        //Al programar siempre hay que ir de a poco, paso a paso.
        javax.swing.JOptionPane.showMessageDialog(null, numero_entero);
      }
    }

Ingresa algún numero y ahora la ventana de dialogo te va a dar el resultado de la division.

###¿Que hicimos?

Una nueva variable, del tipo ***int***, que le asignamos el valor que devuelve el método ***parseInt*** de la clase ***Integer***.
Este método simplemente devuelve el valor que corresponde a un carácter que representa algún numero. El argumento que lleva el método es ese caracter.

("Parsing" (de Parse Int) es un termino tecnico, que consiste en hacer un analisís sintactico de un conjunto de simbolos, y devolver algún valor según las reglas dada previamente.)

###¡Pero no podemos ingresar mas que un numero!

Claro, si intentamos ingresar mas de un solo numero vamos a obtener un error, ya que el método no puede analizar, por ejemplo:
"53 34", se confunde con el espacio.

Vamos a solucionar esto usando arreglos y bucles, el arreglo va a contener cada numero que ingresemos, vamos a generar el arreglo separando los datos ingresados entre los espacios, osea, por ejemplo:

Si ingresamos "53 34", el arreglo va a contener "53" y "34".

Luego con un bucle vamos a llamar ***parseInt*** en cada valor del arreglo.
