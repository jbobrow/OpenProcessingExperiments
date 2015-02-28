
float a = 0;
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;
float g = 0;
float h = 0;
float i = 0;
float j = 0;
 
void setup() {
  background(239,234,186);
  colorMode(HSB, 150);
  size(700, 700);
  frameRate(500000);
  noSmooth();
}
 
void draw() {
  stroke(c, 170, 100, 20);
   
  float x0 = map(sin(a), -10, 10, 1, width - 300);
  float y0 = map(cos(a), -10, 10, 1, height - 50);
   
  float x1 = map(sin(b), -5, 5, 1, width - 500);
  float y1 = map(cos(b), -5, 5, 1, height - 500);
   
   
  float x2 = map(sin(d), -10, 10, 1, width - 5000);
  float y2 = map(cos(d), -10, 10, 1, height - 520);
   
  float x3 = map(sin(e), -5, 5, 1, width - 200);
  float y3 = map(cos(e), -5, 5, 1, height - 100);
   
   
  float x4 = map(sin(f), -10, 10, 1, width - 300);
  float y4 = map(cos(f), -10, 10, 1, height - 2220);
   
  float x5 = map(sin(g), -5, 5, 1, width - 400);
  float y5 = map(cos(g), -5, 5, 1, height - 10);
  
  float x6 = map(sin(h), -5, 5, 1, width - 500);
  float y6 = map(sin(h), -10, 10, 1, height- 10);
  
    float x7 = map(sin(i), -5, 5, 1, width - 200);
  float y7 = map(sin(i), -10, 10, 1, height- 500);
  
   float x8 = map(sin(j), -5, 5, 1, width - 500);
  float y8 = map(sin(j), -10, 10, 1, height- 100);
   
  line(x0, y0, y5, x3);
   


   
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
    d = e + 5;
  if (d > 100) {
    d = 0;
  }
   a = c + 35;
  if (c > 500) {
    c = 0;
  }
   h = e + 5;
  if (e > 100) {
    e = 0;
  }
}


