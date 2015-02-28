
void setup() {
  size(200, 200);
  mouseX = mouseX = 100;
  mouseY = mouseY = 100;
}
void draw() {
  background(255);
  stroke(0);
  fill(0);
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  if (mouseX < 100 && mouseX != 0 && mouseY < 100 && mouseY != 0) {
    //if (mouseX < 100 && mouseY < 100){
    rect(0, 0, 100, 100);
  }
  if (mouseX > 100 && mouseX != 199 && mouseY < 100 && mouseY != 0) {
    //if (mouseX > 100 && mouseY < 100) {
    rect(101, 0, 100, 100);
  }
  if (mouseX < 100  && mouseX != 0 && mouseY > 100 && mouseY != 199) {
    //if (mouseX < 100 && mouseY > 100) {
    rect(0, 101, 100, 100);
  }
  if (mouseX > 100 && mouseX != 199 && mouseY > 100 && mouseY != 199) {
    //if (mouseX > 100 && mouseY > 100) {
    rect(101, 101, 100, 100);
  }
}


