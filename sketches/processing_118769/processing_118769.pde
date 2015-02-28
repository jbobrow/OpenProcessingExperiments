
float a = 0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;
float g = 0;

void setup() {
  background(239,234,186);
  colorMode(HSB, 100);
  size(700, 700);
  frameRate(60);
  smooth();
}

void draw() {
  stroke(c, 170, 100, 20);
  
  float x0 = map(sin(a), -10, 10, 1, width - 10);
  float y0 = map(cos(a), -10, 10, 1, height - 10);
  
  float x1 = map(sin(b), -5, 5, 1, width - 10);
  float y1 = map(cos(b), -5, 5, 1, height - 10);
  
  
  float x2 = map(sin(d), -10, 10, 1, width - 10);
  float y2 = map(cos(d), -10, 10, 1, height - 10);
  
  float x3 = map(sin(e), -5, 5, 1, width - 10);
  float y3 = map(cos(e), -5, 5, 1, height - 10);
  
  
  float x4 = map(sin(f), -10, 10, 1, width - 10);
  float y4 = map(cos(f), -10, 10, 1, height - 10);
  
  float x5 = map(sin(g), -5, 5, 1, width - 10);
  float y5 = map(cos(g), -5, 5, 1, height - 10);
  
  
  line(x0, y0, y1, x1);
  
  translate(110, 130);
  line(x2, y2, y3, x3);
  
  translate(-220, -260);
  line(x4, x4, y5, x5);
  
  a = a + 0.05;
  b = b + 0.09;
  
  d = d + 0.07;
  e = e + 0.04;
  
  f = f + 0.09;
  g = g + 0.02;
  
  c = c + 5;
  if (c > 100) {
    c = 0;
  }
  
}


