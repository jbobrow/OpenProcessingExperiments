
void setup() {
  background(254,255,8);
  size(800, 800);
}
void draw() {
fill(120,100,150,70);
  ellipse(mouseX, mouseY,100,100);
  ellipse(mouseY, mouseX,100, 100);
  ellipse(height-mouseY, width-mouseX,100, 100);
  ellipse(width-mouseX,height-mouseY,100, 100);
  ellipse(height-mouseY, mouseX,100, 100);
  ellipse(mouseX,height-mouseY,100, 100);
  ellipse(mouseY, width-mouseX,100,100);
  ellipse(width-mouseX,mouseY,100,100);
}
