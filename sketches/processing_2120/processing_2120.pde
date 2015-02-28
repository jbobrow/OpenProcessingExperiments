
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: Mala-Vich
 Autor: Albert Castro
 Fecha:  19/5/2009
 Objetivo: Copiar la composición original de Malevich mediante processing
 http://www.fiae.org/Malevich%20-%20Suprematism.JPG
 //
 

 */


//Fondo (dimension)
size(500,694);
smooth();
println("Malevich");

//Fondo (ruta)
PImage fondo = loadImage("Malevich.JPG");
background(fondo);
noStroke();

//Redonda roja
fill(#b23201);
ellipse(100,110,160,160);

//Rectangulo rojo izquierda inferior
fill(#88220d);
quad(196,387,241,397,162,575,132,575);

//Trapezoide rojo abajo derecha
quad(280,584,401,518,401,546,293,604);

//Trapezoide amarillo horizontal
fill(#e8b009);
quad(35,260,351,229,382,284,39,290);

//Trapezoide amarillo abajo izquierda
quad(157,399,179,399,103,625,81,625);

//Trapezoide amarillo abajo derecha
quad(340,586,437,537,437,558,340,604);

//Trapezoide gris abajo
fill(#dbdbe1);
quad(243,402,292,402,243,549,189,549);

//Cruz azul
fill(#151d73);
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
translate(264,109);
rotate(PI/6.1); 
fill(#100e25);
rect(10,0,160,154);
popMatrix();

//empezo bien,la redonda la clave pero luego...churro patatero.



