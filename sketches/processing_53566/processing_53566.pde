
//KESHIA.KINGSLEY_QUESTION 2. PS2
//-----------------------------------------------------------
// Right click on the image to see a pattern
void setup() {
  size(300, 500);
  background(255);
 stroke(1);
  
}
void draw() {
  if (mousePressed && (mouseButton==RIGHT)) {
    brush(mouseX,mouseY);
  }
}
  
  
  void brush(int x, int y) {
    fill(200, 45, 24, 45);
    rect(mouseX, mouseY, 100, 50);
    rect(mouseX, mouseY, 50, 100);
  }

