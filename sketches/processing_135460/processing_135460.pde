
void setup() {
  size(600, 600);
  colorMode(HSB);
  
}
void draw() {
background(random(200),255,255);
  fill(mouseX/2,255,255,100);
  rect(0,0,width,height);
  fill(mouseX/2,255,100,100);
  ellipse(mouseX,height/2,mouseX,mouseX);
  ellipse(mouseY,height/2,mouseY,mouseY);
  ellipse(mouseX, mouseY,50, 50);
  ellipse(mouseY, mouseX,70, 70);
  ellipse(mouseY, mouseX,20, 20);
  ellipse(height-mouseY, width-mouseX,70, 70);
  ellipse(height-mouseY, width-mouseX,20, 20);
  ellipse(width-mouseX,height-mouseY,50, 50);
  ellipse(height-mouseY, mouseX,70, 70);
  ellipse(height-mouseY, mouseX,20, 20);
  ellipse(mouseX,height-mouseY,50, 50);
  ellipse(mouseY, width-mouseX,70, 70);
  ellipse(mouseY, width-mouseX,20, 20);
  ellipse(width-mouseX,mouseY,50, 50);
}
