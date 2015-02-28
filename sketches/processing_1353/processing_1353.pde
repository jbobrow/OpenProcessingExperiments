
void setup () {
  size(800, 600);
  background(255);
  smooth();
  loop();
}

void draw () {
  stroke(255);
  fill(150);
  ellipse(width/2, height/2, mouseX, mouseY);
  fill(125);
  ellipse(width/2, height/2, mouseY, mouseX);
  fill(mouseY, mouseX);
  stroke(250, 0);
  rectMode(CENTER);
  rect(0, 0, mouseX, mouseY);
  rect(width, 0, mouseX, mouseY);
  rect(0, height, mouseX, mouseY);
  rect(width, height, mouseX, mouseY);
}

void keyPressed () {
  noLoop();
  if (keyCode == BACKSPACE) {
    background(255);
  }
}

void mousePressed () {
  loop();
}

