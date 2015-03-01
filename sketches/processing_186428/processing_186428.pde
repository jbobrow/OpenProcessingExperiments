
void setup() {
  size(600, 600);
}
void draw() {
  stroke(237,76,12);
  strokeWeight(5);
  line(mouseX, mouseY,300,300);
  line(mouseY, mouseX,300,300);
  stroke(242,185,39);
  strokeWeight(10); 
  line(height-mouseY, width-mouseX,300,300);
  line(width-mouseX,height-mouseY,300,300);
  stroke(250,232,23);
  strokeWeight(3); 
  line(height-mouseY, mouseX,300,300);
  line(mouseX,height-mouseY,300,300);
  stroke(250,34,23);
  strokeWeight(7); 
  line(mouseY, width-mouseX,300,300);
  line(width-mouseX,mouseY,300,300);
}
