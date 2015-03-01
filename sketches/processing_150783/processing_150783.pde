
// Ejercicio: Simular el movimiento lineal de un coche en 2 tramos 
// con pendientes 0 y PI/4 y velocidades v,v/2 en cada tramo.

float x, y;
float v = 100;
float dt = 0.04;
float dx;

void setup() {
  size(640, 360);
  noStroke();
}

void draw() {
  background(160);
  
  if (x > width/2) {
    // Tramo con pendiente
    dx = v/2 * dt;
    x += dx;
    y -= PI/4;
  }
  else {
    //Tramo sin pendiente
    dx = v * dt;
    x += dx;
    y = 0;
  }
 
  translate(x, y);
  fill(255);
  rect(0, height/2, 30, 15);
  ellipse(5, (height/2)+20, 10, 10);
  ellipse(25, (height/2)+20, 10, 10);
 
}


