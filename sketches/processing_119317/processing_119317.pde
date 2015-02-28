
void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  noStroke();
  fill(255);
    
  //Static ellipses
  translate(40, 40);
  ellipse(36, 36, 90, 90);
  ellipse(149.813, 36, 90, 90);
  ellipse(374, 36, 90, 90);
  ellipse(36.279, 205, 90, 90);
  ellipse(150.091, 205, 90, 90);
  ellipse(374.279, 205, 90, 90);
  ellipse(36.279, 374, 90, 90);
  ellipse(150.091, 374, 90, 90);
  ellipse(374.279, 374, 90, 90);

  //Mouse controlled ellipses
  translate(150, 0);
  ellipse(mouseX/2.22, 36, 90, 90);
  ellipse(mouseX/2.22, 205, 90, 90);
  ellipse(mouseX/2.22, 374, 90, 90);
}
