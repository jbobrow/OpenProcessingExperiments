
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(23);
  stroke(180);
  
  for(int x=0; x<width; x+=100) {
    for(int y=0; y<height; y+=100) {
      pushMatrix();
        translate(x, y);
        drawPattern();
      popMatrix();
    }
  }
}

void drawPattern() {
  for(int i=0; i<100; i+=10) {
    line (0, i, i, 100);  
    line (i, 0, 100, i);
  }
}

