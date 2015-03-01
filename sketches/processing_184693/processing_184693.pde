
void setup() {
  size(600, 600);
 colorMode(HSB);
}
void draw() {
 background (random(255),255,255);
 fill(0);
  ellipse(mouseX, mouseY,50, 50);
  ellipse(mouseY, mouseX,50, 50);
  ellipse(height-mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,50, 50);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,mouseY,50, 50);
}
