
void setup()
{
  size(500, 380);
  noFill();
  smooth();
}

void draw()
{
  background(255, 255, 255);

  stroke(0, 0, 255);
  strokeWeight(5);
  ellipse(40, 50, 40, 40);


  stroke(0, 0, 0);
  strokeWeight(5);
  ellipse(90, 50, 40, 40);


  stroke(255, 0, 0);
  strokeWeight(5);
  ellipse(mouseX, mouseY, 40, 40);

  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(65, 70, 40, 40);

  stroke(0, 255, 0);
  strokeWeight(5);
  ellipse(115, 70, 40, 40);
}


