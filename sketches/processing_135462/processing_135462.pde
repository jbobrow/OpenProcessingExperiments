
void setup() {
  size(600, 600);
  colorMode(HSB);
  background(random(100),805,855);
}
void draw() {
   
  fill(mouseX/2,204,505,100);
  quad(mouseX, mouseY, 116, 60, 99, 93, 60, 106);
  ellipse(mouseX, mouseY,50, 50);
  ellipse(mouseY, mouseX,50, 50);
  ellipse(height-mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,50, 50);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,50, 50);
  ellipse(width-mouseX,mouseY,50, 50);
  quad(mouseY, mouseX, 106, 60, 93, 99, 60, 116);
}


