
float x=0;
float v = 0.0;

int r,g,b;

void setup() {
  size(400,400);
  smooth();
  setRGB();
}

void draw() {
  noStroke();
  rectMode(CENTER);
  fill(r+noise(v)*50,g+noise(v)*50,b+noise(v)*50, 15+noise(v)*25);
  rect(x,125,100,50+noise(v)*150);
  v+=0.01;
  x+=100;
  if(x > width) x=0;
}

void mousePressed() {
  setRGB();
}

void setRGB() {
  r=int(random(255));
  g=int(random(255));
  b=int(random(255));
  background(r,g,b);
}

float rC(float a,float m) {
  return a+noise(v)*m;
}

