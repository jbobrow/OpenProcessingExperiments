
void setup() {
  
  size(500,500);
  frameRate(24);
  background(0);
  stroke(255);
}

float a = 0.0;
float inc = TWO_PI/120.0;

void draw() {
  translate(width, 0);
  rotate(HALF_PI);

  int xo = 200;
  int yo = int(height/2);
  background(0);
  float ex = 20.0;
  for (int i = 0; i < width; i=i+4) {
    stroke(0,255,255);
    line(i+xo, yo, i+xo-120, yo+sin(a)-cos(x);
    stroke(255,0,255);
    line(i+xo, yo, i+xo-120, yo+cos(a)+sin(x));
    stroke(255,255,0);
    line(i+xo, yo, i+xo-120, yo+cos(a*ex*1.4);
    a = a + inc;
    ex += 1;
  }
  a = a + inc;
}
