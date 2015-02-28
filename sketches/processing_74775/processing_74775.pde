
int x = 0;
int y = 0;
int i = 5;
int c = 1;
int d = 1;
int e = 1;

void setup() {
  size(400, 400, P2D);
  smooth(4);
  colorMode(HSB);
}


void draw() {
  background(0, 0, 255);

  if (mousePressed && mouseButton==LEFT) {
    ellipse(x, y, i, i); 
    i = i+2; 
    c = c+10; 
    d = d+10;
    e = e+10;
  }
  
  if (mousePressed && mouseButton==RIGHT) {
    ellipse(x, y, i, i); 
    i = i-2; 
    c = c-10; 
    d = d-10;
    e = e-10;
  }
  

  noStroke();
  fill(c, d, e);
  for (int y = 0; y <= height; y = y + 80) {
    for (int x = 0; x <= width; x = x + 80) {
      ellipse(x, y, i, i);
    }
  }
}
