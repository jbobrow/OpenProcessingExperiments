
float x0, y0, x1, y1, x2, y2, t;
float r;

void setup() {
  size(500, 500);
  smooth();
  background(0);
  r = width / 2;
  x0 = r;
  y0 = r;
  fill(255);
  ellipse(x0, y0, width, width);
}

void draw() {  
  t = random(0, TWO_PI);  
  x1 = x0 + r * cos(t);
  y1 = y0 + r * sin(t);
  t = random(0, TWO_PI);  
  x2 = x0 + r * cos(t);
  y2 = y0 + r * sin(t);
  line(x1, y1, x2, y2);  
}



