
// Ejercicio: Simular el movimiento circular (w vueltas/seg) 
// de una punto que gira a una distancia r del centro
 
float x;
float v = 0.09;
float r = 50;

void setup() {
  size(640, 360);
  noStroke();
  smooth();
}

void draw() {
  background(160);
  
  translate(r*cos(x), r*sin(x));
  fill(255);
  ellipse(width/2, height/2, 20, 20);
 
  x += v;
}


