
void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  //fill(((mouseX+mouseY)/1200)*255);
  fill(mouseX * 0.425, mouseY*0.425, 0);
  ellipse(mouseX, mouseY, 10, 10);
}

