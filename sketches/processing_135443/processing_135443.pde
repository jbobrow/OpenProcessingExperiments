
void setup() {
  size (600, 600);
  colorMode (HSB);
 
 
  }
void draw () {
  fill (400, 255, 200, 200);
  ellipse (mouseX, mouseY, 8, 8);
  ellipse (mouseY, mouseY, 20, 20);
  ellipse (mouseY, width-mouseX, 50, 50);
  ellipse (mouseX, height-mouseX, 80, 80);
 
}

