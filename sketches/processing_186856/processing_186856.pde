

float x = height/2;
float y = width/2;
float a = 100;
float b = 100;

void setup() {
  size(800, 800);
  x = height/2;
  y = width/2;
  a = 300;
  b = 300;
  
  noFill();
  stroke(0, 0, 0, 15);
}

void draw() {
  ellipse(x, y, a, b);
  a += random(-3, 3);
  b += random(-3, 3);
  x += random(-3, 3);
  y += random(-3, 3);
}



