
void setup(){
  size(800,600);
  smooth();
  noCursor();
}
void draw() {
  if (mousePressed) {
    fill(100,150,255);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 300,300);
}
