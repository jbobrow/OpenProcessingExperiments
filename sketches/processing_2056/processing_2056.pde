
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: Malevich
 Nombre: Rut Abradó
 Fecha:  Viernes, 15 de mayo de 2009
 Lugar: Blanes
 Objetivo: Creación de un dibujo en processing que se asemeje lo más posible a éste
 http://www.fiae.org/Malevich%20-%20Suprematism.JPG
 pistas: 
 para hacer formas mas complejas utilizar  beginShape http://processing.org/reference/beginShape_.html
 para hacer cuadrados utilizar rect http://processing.org/reference/rect_.html
 para hacer elipses utilizar ellipse http://processing.org/reference/ellipse_.html
 para poner una imagen de fondo mirar el ejemplo incluido en processing > Basic > image > background Image
 para quitar el color del borde : noStroke();
 para colorear fill(color);
 el orden de los comandos es importante. Lo que primero se escribe primero se ve.
 
 //
 
 Descripción: Primer ejercicio de processing... vamos allá!
 */
// NO SE TE OLVIDE COMENTAR TODO LO POSIBLE EL CÓDIGO! 

//Genericos
size(450,625);
smooth();
println("Malevich");

//Nombramos y cargamos la foto de fondo   _ Comentado para que se vea online
PImage fondo = loadImage("textura.jpg");
background(fondo);
noStroke();

//Ciculo rojo
fill(#ae2501);
ellipse(90,100,150,150);

//Rectangulo rojo abajo izquierda
fill(#7b1c0c);
quad(186,377,221,377,152,565,122,565);

//Rectangulo rojo abajo derecha
quad(280,584,401,518,401,546,293,604);

//Rectangulo amarillo horizontal
fill(#e8b009);
quad(25,260,351,229,352,254,29,290);

//Rectangulo amarillo abajo izquierda
quad(157,399,179,399,103,625,81,625);

//Rectangulo amarillo abajo derecha
quad(340,586,437,537,437,558,340,604);

//Rectangulo blanco abajo
fill(#d2d1d7);
quad(233,392,282,392,233,539,179,539);

//Cruz azul
fill(#131b8f);
beginShape(); //formas complejas
vertex(201, 113);
vertex(181, 118);
vertex(180, 109);
vertex(199, 103);
vertex(196, 84);
vertex(206, 82);
vertex(209, 100);
vertex(230, 94);
vertex(233, 102);
vertex(211, 110);
vertex(290, 549);
vertex(279, 556);
endShape(CLOSE);

pushMatrix(); //reservado
translate(244,98);
rotate(PI/5.8); 
fill(#100e25);
rect(0,0,146,140);
popMatrix();

//fin :D



