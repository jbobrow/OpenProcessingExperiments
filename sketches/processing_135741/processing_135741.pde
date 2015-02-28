
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  frameRate(50);
  background(55);
  fill(255,169,79,170);
  noStroke();
  ellipse(mouseX,150,30+mouseX/2,30+mouseX/2);
  fill(255,110,80,170);
  ellipse(250,mouseY,70+mouseX/7,70+mouseX/7);
  noFill();
  stroke(255,255,255,180);
  ellipse(400-mouseX,400-mouseX,mouseX,mouseX);
}

