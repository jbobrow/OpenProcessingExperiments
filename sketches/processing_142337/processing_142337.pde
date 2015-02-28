
int a;
int b;

size(1000,800);
a= (width/100);
b= (width/50);
background(7,18,85);


textSize(2*b);
fill(255,125);
text("Good night", 5*b-a, 30*b-a);
fill(255);
text("Sweet dreams", 6*b, 31*b);

noStroke ();
fill(72,39,4);
rect(7*b,19*b+a,23*b,b+a,5); // Árbol rama 1
rect(15*b,20*b+a,16*b,2*b-a,5); // Árbol rama 2
rect(25*b,15*b,8*b,height,2); // Tronco
strokeWeight(2);
stroke(0,40);
fill(0,35);
ellipse(29*b,29*b,3*b,6*b); // Agujero negro 1
noStroke();
fill(0,22);
ellipse(29*b,29*b,6*b-a,8*b); // Agujero negro 2

noStroke();
fill(34,145,146);
ellipse(12*b,10*b,8*b,6*b); // Cabeza
ellipse(12*b,15*b,9*b,10*b); // Cuerpo
triangle(9*b,7*b,9*b,8*b,10*b,8*b); // Oreja 1
triangle(15*b,7*b,15*b,8*b,14*b,8*b); // Oreja 2

stroke(28,118,115);
fill(158,220,237,250);
ellipse(12*b,16*b,7*b,8*b); // Barriga

noStroke();
fill(28,118,115);
ellipse(8*b+a,15*b,2*b,6*b); // Ala 1
ellipse(15*b+a,15*b,2*b,6*b); // Ala 2

noStroke();
fill(165,83,15);
triangle(12*b, 10*b+a, 11*b+a, 11*b, 13*b-a, 11*b); // Pico dalt
noStroke();
fill(255,122,13);
triangle(12*b,12*b,11*b+a,11*b,13*b-a,11*b); // Pico baix
rect(11*b-a,19*b+a,3*b,a+a/2,20); // Patas

stroke(113,79,15);
line(11*b+2*a,19*b+a,11*b+2*a,19*b+2*a+a/2); // Separación pies

stroke(0);
fill(255);
ellipse(10*b,10*b,2*b,2*b); // Ojo blanco 1
ellipse(14*b,10*b,2*b,2*b); // Ojo blanco 2

fill(0);
ellipse(20*a,20*a,b,b); // Pupila 1
ellipse(28*a,20*a,b,b); // Pupila 2

fill(255);
ellipse(19.8*a,19.8*a,a/2,a/2); // Brillante 1
ellipse(27.8*a,19.8*a,a/2,a/2); // Brillante 2

noStroke ();
fill(234,161,2);
ellipse(44*b,5*b,5*b,5*b); // Luna
fill(7,18,85,60);
ellipse(46*b-a,5*b,5*b,5*b); // Sombra luna

noStroke();
fill(25,77,3,180);
ellipse(29*b,9*b,12*b,22*b);// Hojas
ellipse(29*b,9*b,22*b,12*b);
ellipse(24*b+a,6*b-a,9*b,9*b);
ellipse(33*b,6*b-a,9*b,9*b);
ellipse(25*b-a,13*b+a,9*b,9*b);
ellipse(33*b,14*b-a,9*b,9*b);







