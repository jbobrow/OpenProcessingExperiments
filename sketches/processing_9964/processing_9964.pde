
/*
PROYECTO 01 SESION 2 : ESTATICO
 
 Título: Miro
 Nombre: Gerardo Borges
 Fecha:  26/05/2010
 Lugar: Barcelona
*/
//fondo
smooth();
size(543,391);


//color del fondo, un rectangulo
noStroke();
fill(229,222,216);
rect(0,0,543,391);

//cuadrado en la mitad
stroke(0);
strokeWeight(30);
fill(50);
//translate(-60, height/2);
//rotate(PI/-100);
rect(-30,216,width*2,height*2);




//verdesombra circulo
noStroke();
fill(63,77,68,70);
ellipse (120,22,50,50);
//verde circulo
noStroke();
fill(63,77,68);
ellipse (120,22,50,50);

//azulsombra circulo
noStroke();
fill(61,07,175,70);
ellipse (70,159,50,50);
//azul circulo
noStroke();
fill(61,07,175);
ellipse (70,159,30,30);

//rojo circulo
noStroke();
fill(143,54,46);
ellipse (396,129,30,30);

//gris1 circulo
noStroke();
fill(51,55,56);
ellipse (451,56,30,30);

//marron1 circulo
noStroke();
fill(69,66,56);
ellipse (500,146,30,30);

//marron2 circulo
noStroke();
fill(103,50,40);
ellipse (124,326,30,30);

//naranjasombra circulo
noStroke();
fill(170,71,28,70);
ellipse (366,288,73,73);
//naranja circulo
noStroke();
fill(170,71,28);
ellipse (366,288,43,43);

//blur
filter(BLUR, 2);

//ROJOBIG circulo
noStroke();
fill(200,0,0);
ellipse (264,96,252,168);

//brochazos
PImage a;  // Declare variable "a" of type PImage
a = loadImage("brocha.png");  // Load the image into the program  
image(a, 0, 0); 

//mancha
PShape s;
s = loadShape("mancha.svg");
smooth();
shape(s, 390, 70, 160,160);
//borde blanco
stroke(255);
strokeWeight(8);
noFill();
rect(0,0,width,height);

