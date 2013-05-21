---
title: "Markdown"
kind: article
tags: ['markdown', 'desarrollo_web']
created_at: 04/04/2013 18:50:50
---


[Markdown](http://daringfireball.net/projects/markdown/) es un lenguaje de marcado muy útil a la hora de escribir el *contenido* de nuestro sitio, con una simple sintaxis para escribir rápidamente el contenido y luego convertirlo a HTML.

Resulta muy engorroso escribir los tags de HTML cada vez que estamos escribiendo el contenido para nuestros sitios, como en este mismo blog, cada vez que escribo una nueva entrada, con HTML escribir los tags para párrafos, énfasis, listas, links, suma todo al tiempo que lleva hacerlo.

En cambio con Markdown simplemente escribo lo que quiero que se vea de manera mucho mas rápida.
<?snippet?>

    Es tan sencillo
    ---------------

    Simplemente escribís **tu contenido**

    Y no tener que preocuparte por el HTML.

    Simplemente escribir tu contenido de manera *eficiente*.

    *Sencillo
    *Rápido
    *Útil

Y la compilación a HTML quedaría así:

    <h2>Es tan sencillo</h2>
    
    <p>Simplemente escribís <strong>tu contenido</strong>
    
    <p>Y no tener que preocuparte por el HTML.</p>
    
    <p>Simplemente escribir tu contenido de manera <em>eficiente</em>.</p>
    
    <ul>
    <li>Sencillo</li>
    <li>Rápido</li>
    <li>Útil</li>
    </ul>
