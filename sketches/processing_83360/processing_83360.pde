
int counter;

void setup() {
 size (640, 360);
 
  background(0);
}
 
void draw() {
 
  if (mousePressed) {
    fill(255);
    ellipse(mouseX, mouseY, 30, 30);
  }
  else {
    fill(0);
 
 
    //mouseX
    //mouseY
    ellipse(mouseX, mouseY, 30, 30);
  }
}


