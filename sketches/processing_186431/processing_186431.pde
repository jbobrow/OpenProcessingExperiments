
void setup() {
  size(600, 600);
  background(0);
  }
void draw() {
  float aleatorio=random(100,255);
  fill(aleatorio);
  rect(mouseX, mouseY,20,20);
  rect(mouseX, mouseY,20,20);
  rect(height-mouseY, width-mouseX,20,20);
  rect(width-mouseX,height-mouseY,20,20);
  rect(height-mouseY, mouseX,20,20);
  rect(mouseX,height-mouseY,20,20);
  rect(mouseY, width-mouseX,20,20);
  rect(width-mouseX,mouseY,20,20);
}
