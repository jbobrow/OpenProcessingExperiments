
float dt = 1/60.0;

// Radio
float r = 100.0;

// Frecuencia
float f = 1.0;

// Velocidad angular
float w = 0.0;

// Tiempo
float t = 0.0 - dt;

PVector pos = new PVector(0, 0);

void setup() {
  size(600, 600);
}

void draw() {
  background(200);
  
  translate(width/2, height/2);
  
  fill(200);
  ellipse(0, 0, r*2, r*2);
  
  w = TWO_PI * f;
  
  t += dt;
  
  pos.x = r * cos(w * t);
  pos.y = r * sin(w * t);
  
  fill(255);
  ellipse(pos.x, pos.y, 10, 10);
}


