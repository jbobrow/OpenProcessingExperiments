
//KESHIA.KINGSLEY_QUESTION 3. PS2
//-------------------------------------------
// Left click on the image to see the pattern alternate
void setup() {
  size(500, 500);
  background(255);
 stroke(1);
  
}
void draw() {
  if (mousePressed && (mouseButton==LEFT)) {
    brush(mouseX,mouseY);
  }
  }
  
void brush(int x, int y) {
  // altered colour and shape
    fill(mouseX, mouseY, 35, 65);
    rect(mouseX, mouseY, 100, 50);
    rect(mouseX, mouseY, pmouseX, pmouseY);
  }

