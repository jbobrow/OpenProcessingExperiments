
void setup() {
  size(600,600);
  colorMode(HSB);
  background(random(50), 255, 255);
}
void draw() {
  fill(mouseX/2,255,mouseY/2);
  
  line(mouseX,mouseY,pmouseY,pmouseX);
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseY,mouseX,50,50);
  ellipse(height-mouseY,width-mouseX,50,50);
  ellipse(width-mouseX,height-mouseY,50,50);
  ellipse(width+mouseX,height+mouseY,50,50);
  ellipse(height+mouseY,width+mouseX,50,50);
}
