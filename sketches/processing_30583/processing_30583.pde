
size(482,600);
background(#f4ead2);
PImage b;
b = loadImage("textura.jpg");
background(b);
 
//rectangulos de arriba a abajo
//rectangulo 1 azul
stroke(#373764, 100);
fill(#868397, 50);
rect(20, -1, 102, 650);
 
//rectangulo 2 marron
noStroke();
fill(#3c080c, 150);
rect(140, 0, 26, 600);
 
//rectangulo 3 naranja
stroke(#3c080c, 150);
fill(#ff8500, 150);
rect(166, -2, 53, 605);
 
//rectangulo 4 marron
noStroke();
fill(#3c080c, 150);
rect(400, 0, 13, 600);
 
//rectangulo 5 azul
stroke(#373764, 100);
fill(#868397, 50);
rect(424, -1, 59, 603);
 
//triangle
smooth();
noStroke();
fill(#6a4043);
triangle(0, 430, 45, 462, 0, 495);
 
//serie de rectangulos marrones de en medio, empezando de abajo a arriba
smooth();
noStroke();
fill(#3c080c, 150);
quad(300, 422, 327, 436, 331, 600, 300, 600);
 
smooth();
noStroke();
fill(#3c080c, 150);
quad(270, 266, 294, 280, 296, 415, 270, 403);
 
smooth();
noStroke();
fill(#3c080c, 150);
quad(312, 241, 336, 226, 336, 260, 312, 273);
 
smooth();
noStroke();
fill(#3c080c, 150);
quad(346, 196, 371, 182, 371, 217, 348, 228);
 
smooth();
noStroke();
fill(#3c080c, 150);
quad(265, 167, 290, 180, 289, 218, 265, 205);
 
 
smooth();
noStroke();
fill(#3c080c, 150);
quad(294, 112, 318, 126, 317, 165, 293, 151);
 
//cuadrilatero de abajo azul
stroke(#373764, 255);
fill(#868397, 255);
quad(0, 550, 112, 472, 392, 600, 0, 600);
 
//cuadrilatero mas estrecho y mas arriba  azul
stroke(#373764, 255);
fill(#868397, 255);
quad(183, 404, 573, 589, 448, 603, 185, 474);

