
void setup() {
  size(600, 600);
  background(168,133,245);
}
void draw() {
  line(mouseX, mouseY,50,50);
  stroke(133,181,245);
  ellipse(mouseY, mouseX,20, 30);
  fill(133,245,244);
  line(height-mouseY, width-mouseX,50, 50);
  stroke(133,181,245);
  ellipse(width-mouseX,height-mouseY,80, 15);
  fill(65,178,177);
}
void mouseReleased() { 
  line(height-mouseY, mouseX,50, 50);
  stroke(137,227,153);
  ellipse(mouseX,height-mouseY,50, 50);
  fill(142,13,127);
  line(mouseY, width-mouseX,50, 50);
  stroke(98,165,110);
  ellipse(width-mouseX,mouseY,50, 50);
  fill(76,23,175);
}
