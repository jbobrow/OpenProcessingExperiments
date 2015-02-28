
void setup() {
  background(5,1,65);
  noStroke();
  size(1920,1200);
}

void draw() {
  if (mousePressed) {
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  ellipse(mouseX,mouseY,100,10);
  ellipse(mouseX,mouseY,10,100);
  rect(mouseX,mouseY,100,2);
  rect(mouseX,mouseY,-100,2);
  rect(mouseX,mouseY,2,100);
  rect(mouseX,mouseY,2,-100);
}
}


