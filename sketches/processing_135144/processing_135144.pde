
void setup() {
  size(600, 600);
}
void draw() {
  stroke(160,6,9);
  ellipse(mouseX, mouseY,50, 50);
  stroke(51,138,180);
  ellipse(mouseY, mouseX,50, 50);
  ellipse(height-mouseY, width-mouseX,50, 50);
  stroke(160,6,9);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,50, 50);
  stroke(8,70,100);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,mouseY,50, 50);
}
