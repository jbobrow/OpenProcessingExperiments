
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  background(0);
  fill(255);
  noStroke();
  
  ellipse(62, 62, 50, 50);
  ellipse(187, 62, 50, 50);
  
  ellipse(62, 187, 50, 50);
  ellipse(187, 187, 50, 50);

  ellipse(62, 312, 50, 50);
  ellipse(187, 312, 50, 50);
  ellipse(312, 312, 50, 50);
  ellipse(438, 312, 50, 50);
  
  ellipse(62, 438, 50, 50);
  ellipse(187, 438, 50, 50);
  ellipse(312, 438, 50, 50);
  ellipse(438, 438, 50, 50);
  
  fill(50, 0, 250);
  translate(mouseX/15, 0);
  pushMatrix();
  ellipse(312, 62, 50, 50);
  ellipse(438, 62, 50, 50);
  ellipse(312, 187, 50, 50);
  ellipse(438, 187, 50, 50);
  popMatrix();
}
