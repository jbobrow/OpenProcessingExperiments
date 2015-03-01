
// Ejercicio: Animar el movimiento de una particula a velocidad v 
// sobre las 2 funciones osciladoras.

float x, y, y2;
float v = 5;
float dt = 0.02; // 1 / 60
float dx;

// Amplitud
float A = 30;

void setup() {
  size(640, 360);
  noStroke();
  smooth();
}

void draw() {
  background(160);
  
  int currentTimmer = millis();
  
  dx = v * dt;
  x += dx;
  
  
  //Funcion osciladora 1
  pushMatrix();
  y = A*sin(x) * exp(-0.002*x);
  
  translate(x, y);
  fill(255);
  ellipse(0, (height/2)-100, 5, 5);
  popMatrix();
  
  
  //Funcion osciladora 2
  pushMatrix();
  y2 = A*sin(3*x) + A*sin(3.5*x);
  
  translate(x, y2);
  fill(255);
  ellipse(0, (height/2)+100, 5, 5);
  popMatrix();
  
  println("X = " + x);
  println("CurrentTimmer = " + currentTimmer);
}

void keyPressed() {
  // Al pulsar la tecla "m" se aumenta la velocidad
  if (key == 'm') {
    v += 5;
  }
  // Al pulsar la tecla "n" se reduce la velocidad
  
  if (key == 'n') {
    v -= 5;
  }
}


