
void setup() {
colorMode(HSB);
  size(600, 600);
  co=90;
  background(58,63,48);
}
void draw() {

fill(co++*0.2,co*0.8,co*1);

  ellipse(mouseX, mouseY,25, 25);
  ellipse(mouseY, mouseX,50, 50);
  ellipse(height-mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,height-mouseY,25, 25);
  ellipse(height-mouseY, mouseX,50, 50);
  ellipse(mouseX,height-mouseY,25, 25);
  ellipse(mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,mouseY,25, 25);
}
