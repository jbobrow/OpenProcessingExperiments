
/*Ejercicio: Simular el movimiento circular (w vueltas/seg) de
una punto que gira a una distancia r del centro.*/

float posX, posY;
float delta_t = 0.1;
float t = 0.0;
float radio = 70;

void setup() {
  size(438, 500);
  smooth();
}

void draw() {
  background(255,222,173,0);
  
  translate(radio*cos(t), radio*sin(t));
  
  fill(0,255,255,255);
  ellipse(width/2, height/2, 30, 30);
  
  t = t + delta_t;
}


