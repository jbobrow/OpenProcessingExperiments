
float r;
float b;
float g;
float a;

float diam;
float x;
float y;

void setup() {
  size(400,400);
  background(0);
  smooth();
}

void draw() {
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(5,50);
  x=random(width);
  y=random(height);

  fill(r,g,b,a);
  rect(x,y,diam,diam);
}               
