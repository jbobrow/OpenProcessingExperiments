
void setup() {
  size(700,400);
  background(0,255,0);
}
void draw() {
  smooth();
  fill(255,200,0);
  ellipse(mouseX-50,mouseY,20,20);
  fill(0,0,255);
  ellipse(mouseX+50,mouseY,20,20);
  fill(255,0,0);
  ellipse(mouseX,mouseY-50,20,20);
  fill(255,0,255);
  ellipse(mouseX-35,mouseY-35,20,20);
  fill(0,255,255);
  ellipse(mouseX+35,mouseY+35,20,20);
  fill(200,255,0);
  ellipse(mouseX,mouseY+50,20,20);
  fill(255,255,0);
  ellipse(mouseX+35,mouseY-35,20,20);
  fill(200,0,255);
  ellipse(mouseX-35,mouseY+35,20,20);
  fill(255);
  ellipse(mouseX,mouseY,20,20);
}

