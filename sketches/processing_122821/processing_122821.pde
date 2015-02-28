
void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0, 255, 0);
  fill(250, 100, 150);
  rect(mouseX, mouseY, 100, 100);
  rectMode(CENTER);
  fill(0, 255, 0);
  ellipse(mouseX-2, mouseY-20, 40, 40);
  rect(mouseX-32, mouseY+70, 25, 40);
  rect(mouseX+33, mouseY+70, 25, 40);
  rect(mouseX-40, mouseY+80, 20, 20);
  rect(mouseX+40, mouseY+80, 20, 20);
  fill(255);
  ellipse(mouseX-2, mouseY-20, 20, 20);
  fill(0);
  stroke(0);
  ellipse(mouseX, mouseY-20, 6, 6);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY+30, 60, 20);
  fill(255);
  rect(mouseX, mouseY+25, 10, 10);
  fill(0, 255, 0);
  stroke(0, 255, 0);
  rect(mouseX-60, mouseY+20, 20, 20);
  rect(mouseX-60, mouseY+6, 7, 7);
  rect(mouseX+60, mouseY+20, 20, 20);
  rect(mouseX+60, mouseY+6, 7, 7);
  rect(mouseX, mouseY-63, 1, 25);
  ellipse(mouseX, mouseY-80, 10, 10);
}


