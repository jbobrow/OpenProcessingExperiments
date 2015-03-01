
void setup() {
  size(600, 600);
}
void draw() {
 fill(245,5,37);
  ellipse(mouseX, mouseY,50, 50);
  fill(138,13,146);
  ellipse(mouseY, mouseX,50, 50);
  fill(94,13,183);
  ellipse(height-mouseY, width-mouseX,50, 50);
  fill(13,91,183);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,50, 50);
  fill(13,183,159);
  ellipse(mouseX,height-mouseY,50, 50);
  fill(13,183,39);
  ellipse(mouseY, width-mouseX,50, 50);
  fill(234,234,45);
  ellipse(width-mouseX,mouseY,50, 50);
}

