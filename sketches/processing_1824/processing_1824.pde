
size(400, 400);
smooth();

int ancho = height/2;
int largo = 3*height/4;
int anchoLinea = height/50;

background(0);

translate(width/2, height/2);

// Campo
fill(#2EAD05);
stroke(255);
rectMode(CENTER);
strokeWeight(anchoLinea);
rect(0, 0, ancho, largo);

// Circulo central
ellipse(0, 0, ancho/4, ancho/4);

// Linea central
pushMatrix();
translate(-ancho/2, 0);
line(0, 0, ancho, 0);
popMatrix();

// Area abajo
pushMatrix();
translate(-ancho/3/2, largo/2);
rectMode(CORNER);
rect(0, 0, ancho/3, -largo/8);
popMatrix();


// Area abajo
pushMatrix();
translate(-ancho/3/2, -largo/2);
rectMode(CORNER);
rect(0, 0, ancho/3, largo/8);
popMatrix();

//saveFrame("screen.png");




