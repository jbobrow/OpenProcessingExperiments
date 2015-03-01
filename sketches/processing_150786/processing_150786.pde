
// Implementar una rutina que simule el movimiento de una partícula
// a lo largo de la espiral 2D de la figura. 

//Variables para el movimiento de la particula
float x;
float v = 0.1;
float r = 200;

void setup() {
  size(700,600);
  stroke(190,190,0);
  strokeWeight(2);
  fill(127,80,200);
  smooth();
}

void draw() {
  background(80);
  
  // Se dibuja la particula
  translate(r*cos(x), r*sin(x));
  ellipse(width/2, height/2, 20, 20);
  
  // Rutina para el siguiente movimiento
  if ( r > 0 ) {
    x += v;
    r -= 1;
  }
  else {
    v = 0;
  }
}


