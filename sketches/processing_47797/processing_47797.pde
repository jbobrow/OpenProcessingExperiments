
int hw;
int hh;

float r;
float a = 1.5;
float t = 1.0;

int es = 20;
int n = 170;

float x;
float y;

void setup() {
  size(400, 400);
  background(0);

  smooth();

  hw = width/2;
  hh = height/2;
}

void draw() {
  r = sin(a*t); 

  x = r * cos(t);
  y = r * sin(t);

  noStroke();
  fill(random(255), random(255), 255, 80);
  ellipse(n*x+hw, n*y+hh, es, es);

  t++;
  
  if (mousePressed == true) {
    background(0);
    t = 0.0;
  }
}

