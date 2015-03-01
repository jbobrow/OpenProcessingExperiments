
void setup() {
  size (300, 300);
  colorMode (HSB);
  
  
  }
void draw () {
  fill (150, 100, 300, 200);
  fill (140, 250, 300, 200);
  ellipse (mouseX, mouseY, 4,4);
  ellipse (mouseY, mouseY, 10, 5);
  ellipse (mouseX, mouseY, 10,10);
  ellipse (mouseY, mouseY, 20, 20);
  }
