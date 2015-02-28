
float r; 
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(512,512);
  background(0);
  smooth();
}

void draw() {
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(40);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
}

