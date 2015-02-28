
void setup() {
  size(500, 500);
}

void draw() {
  background(255, 255, 255);
  stroke(0);
  fill(250, 198, 141);
  ellipseMode(CENTER);
  ellipse(mouseX+37, mouseY-38, 75, 75);

  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX+28, mouseY-48, 15, 15);

  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX+47, mouseY-48, 15, 15);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX+47, mouseY-48, 5, 5);

  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX+27, mouseY-48, 5, 5);

  stroke(0);
  fill(252, 216, 3);
  ellipseMode(CENTER);
  rect(mouseX, mouseY, 75, 75);

  stroke(0);
  fill(3, 42, 252);
  ellipseMode(CENTER);
  rect(mouseX, mouseY+47, 75, 15);

  stroke(0);
  fill(252, 216, 3);
  ellipseMode(CENTER);
  rect(mouseX-75, mouseY+7, 75, 25);

  stroke(0);
  fill(252, 216, 3);
  ellipseMode(CENTER);
  rect(mouseX+75, mouseY+7, 75, 25);

  stroke(0);
  fill(250, 198, 141);
  ellipseMode(CENTER);
  rect(mouseX+127, mouseY+7, 25, 25);

  stroke(0);
  fill(250, 198, 141);
  ellipseMode(CENTER);
  rect(mouseX-75, mouseY+7, 25, 25);

  stroke(0);
  fill(252, 216, 3);
  ellipseMode(CENTER);
  rect(mouseX+7, mouseY+75, 25, 75);

  stroke(0);
  fill(252, 216, 3);
  ellipseMode(CENTER);
  rect(mouseX+44, mouseY+75, 25, 75);

  stroke(0);
  fill(3, 42, 252);
  ellipseMode(CENTER);
  rect(mouseX+44, mouseY+97, 25, 20);

  stroke(0);
  fill(3, 42, 252);
  ellipseMode(CENTER);
  rect(mouseX+7, mouseY+97, 25, 20);

  stroke(0);
  fill(50);
  ellipseMode(CENTER);
  rect(mouseX+7, mouseY+140, 25, 10);

  stroke(0);
  fill(50);
  ellipseMode(CENTER);
  rect(mouseX+44, mouseY+140, 25, 10);
}

