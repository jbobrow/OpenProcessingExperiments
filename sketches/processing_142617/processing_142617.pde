
void setup() {
  size (500, 500);
  background(255);
  noFill();
}

void draw()
{
  pushMatrix();
  translate(height/3, width/3);
  rotate(mouseY*2.0);
  ellipseMode(CENTER);
  noFill();
  stroke(0, 0, 0);
  ellipse(mouseY, 0, 50, 50);
  popMatrix();
  resetMatrix();

  pushMatrix();
  translate(height/6, width/6);
  rotate(mouseX*4.0);
  rectMode(CENTER);
  noFill();
  stroke(0, 153, 0);
  rect(mouseX, 0, 50, 50);
  popMatrix();
  resetMatrix();

  pushMatrix();
  translate(height/9, width/9);
  rotate(mouseX*8.0);
  rectMode(CENTER);
  noFill();
  stroke(255, 255, 0);
  rect(mouseX, 0, 50, 50);
  popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate(height/12, width/12);
  rotate(mouseY*16.0);
  ellipseMode(CENTER);
  noFill();
  stroke(255, 0, 0);
  ellipse(mouseY, 0, 50, 50);
  popMatrix();
  resetMatrix();
}



