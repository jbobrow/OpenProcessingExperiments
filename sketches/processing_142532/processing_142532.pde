
void setup ()
{
  size(500, 500);
  background(255, 255, 255);
}

void draw ()
{
  rectMode(CORNER);
  noStroke();
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  //background(255, 255, 255);
  noFill();
  stroke(100, 100, 100);

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/700.0);
  rect(0, 0, 100, 100);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(4);
  rotate(millis()/-700.0);
  rect(0, 0, 100, 100);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/-700.0);
  rect(0, 0, 142, 142);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(4);
  rotate(millis()/700.0);
  rect(0, 0, 142, 142);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/700.0);
  rect(0, 0, 201, 201);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(4);
  rotate(-millis()/700.0);
  rect(0, 0, 201, 201);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/-700.0);
  rect(0, 0, 284, 284);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(4);
  rotate(millis()/700.0);
  rect(0, 0, 284, 284);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(millis()/700.0);
  rect(0, 0, 402, 402);
  popMatrix();

  pushMatrix();
  rectMode(CENTER);
  translate(mouseX, mouseY);
  rotate(4);
  rotate(-millis()/700.0);
  rect(0, 0, 402, 402);
  popMatrix();
}
void mousePressed() {
  noLoop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  loop();  // Releasing the mouse stops looping draw()
}

