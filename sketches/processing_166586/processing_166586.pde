
void setup() {
  size(500, 500);
  frameRate(15);
  fill(0);
  colorMode(HSB);
}
void draw() {
  float angle = atan2(mouseY, mouseX);
  float deg = degrees(angle);
  background(255);
  stroke(200);
  fill((mouseX+mouseY)/2,150,150);
  ellipse(mouseX, mouseY, 80, 80);
  ellipse(width-mouseX, mouseY, 40, 40);
  ellipse(width-mouseX*1.8, height-mouseY*1.8, 20, 20);
  line(mouseX,mouseY,width-mouseX,mouseY);
  line(mouseX,mouseY,width-mouseX*1.8,height-mouseY*1.8);
  line(width-mouseX*1.8,height-mouseY*1.8,width-mouseX,mouseY);
}



