
/*Alina Honhala
-Ejercicio: Simular el movimiento circular (w vueltas/seg) de
una punto que gira a una distancia r del centro*/

float x=0;
float y=0;
float dt=0.1; //incremento
float ang=0; //angulo
float r=70; //distancia
float c=40; //tamaño elipse

void setup() {
  size(400,400);
  smooth();
}
void draw() {
  background(#000000);
  fill(#27EBE4);

  ellipse(x,y,c,c);
  x=width/2 + r*cos(ang);
  y=height/2 + r*sin(ang);
  ang=ang+dt;
}


