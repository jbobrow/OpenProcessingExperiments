
int hw;
int hh;

float r;
float r2;

float a = 1.5;
float b = 4;

float t = 1.0;

int es = 20;
int n = 100;//170;

float x;
float y;
float x2;
float y2;

void setup() {
  size(400, 400);
  background(255, 255, 170);

  smooth();

  hw = width/2;
  hh = height/2;
}

void draw() {
  r = sin(a*t);
  r2 = sin(b * t);

  x = r * cos(t);
  y = r * sin(t);


  x2 = r2 * cos(t);
  y2 = r2 * sin(t);

  noStroke();

  fill(random(150), random(150), 200, 80);
  ellipse(n*x*2+120, n*y*2+120, es, es);

  fill(random(255), random(255), 255, 80);
  ellipse(n*x2*2+hw+100, n*y2*2+hh+100, es*0.9, es*0.9);

  t++;

  if (mousePressed == true) {
    save("pict.png");
  }
}


