
void setup() {
  size(1000, 1000);
}
  
void draw() {
  if (mousePressed) {
    fill(0,0,255);
  } else {
    fill(0);
  }
  ellipse(mouseX, mouseY, 20,20,20);
  ellipse(mouseY,mouseX,20,20,20);
  ellipse(mouseX, mouseX+mouseY, 20,20,20);
  ellipse(mouseY+mouseX,mouseX,40,20,20);
}
