
void setup() {
  size(700, 500);
  noSmooth();
  fill(126);
  background(0);
}
 
 
void draw() {
  if (mousePressed) {
    stroke(255);
  } else {
    stroke(30);
  }
  line(mouseX-70, mouseY, mouseX+70, mouseY);
  line(mouseX, mouseY-120, mouseX, mouseY+120);
}
