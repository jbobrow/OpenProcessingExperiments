
void setup(){
  size(400, 400);
  fill(0, 102);
}

void draw(){
  background(0);
  noStroke();
  fill(193);
  ellipse(0, 0, 150, 150);
  ellipse(400, 0, 150, 150);
  ellipse(0, 400, 150, 150);
  ellipse(400, 400, 150, 150);
  fill(255, 0, 0, 160);
  ellipse(0, 0, 130, 130);
  ellipse(400, 0, 130, 130);
  ellipse(0, 400, 130, 130);
  ellipse(400, 400, 130, 130);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 50, 50);
}

