
void setup() {
  size(510, 510);
  background(#333333);
  noFill();
  stroke(#FFFFFF);
}
  
void draw() {
  if (mousePressed){
    ellipse(mouseX, mouseY, 100, 100);
  }
}
