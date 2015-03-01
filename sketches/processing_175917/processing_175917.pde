
void setup() {
  size(1000, 1000);
}
 
void draw() {
  if (mousePressed) {
    fill(0,0,120);
  } else {
    fill(0,0,250);
  }
  ellipse(mouseX, mouseY, 20,20,20);
  ellipse(mouseY,mouseX,20,20,20);
  ellipse(mouseX, mouseX-mouseY, 20,20,20);
  ellipse(mouseX-mouseY,mouseX,20,20,20);
}
