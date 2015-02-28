
void setup() {
  size(640, 360);
  noSmooth();
  fill(0);
  background(55, 8, 250);
}
 
void draw() {
  if (mousePressed) {
    stroke(0);
    fill(250, 141, 8);
  } else {
    stroke(0);
    fill(249, 250, 8);
} 
ellipse(mouseX-10, mouseY, mouseX+10, mouseY);
}


