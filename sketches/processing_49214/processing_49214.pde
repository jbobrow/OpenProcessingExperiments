
float a = 0;
float b = 0;
float col = 0;

void setup() {
  background(255);
  colorMode(HSB, 122);
  size(500, 400);
  smooth();
  strokeWeight(3);
}

void draw() {
  int i = 0;
  
  stroke(col, 80, 80, 20);

  float x0 = map(sin(a), -1, 1, 20, width-20);
  float y0 = map(cos(a), -1, 1, 20, height-20);

  float x1 = map(sin(b), -1, 1, 20, width-20);
  float y1 = map(cos(b), -1, 1, 20, height-20);

  

    rect(x0, y0, x1, y1);
    line(x1, y1, x0, y0);
  
    ellipse(x1, y1, x0, y0);
    ellipse(x0, y0, x1, y1);
   
  
  a = a + 0.03;
  b = b + 0.05;
  
  col = col + 1;
  if (col > 100) {
    col = 0;
  }
}

