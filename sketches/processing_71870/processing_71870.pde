
//Iam B
//user input project
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  if (mousePressed)
  {
    stroke(255-mouseX, 0+mouseY, 0+mouseX);
    strokeWeight(3);
    fill(0, 0, 0, 6);
    rect(0, 0, 500, 500);
    fill(178-mouseX, 255-mouseY, 253);
    rect(mouseX-20, mouseY-20, 0.5*mouseY, 0.5*mouseX);
  }
  else
  {
    stroke(255-mouseX, 0+mouseY, 0+mouseX);
    strokeWeight(3);
    fill(0, 0, 0, 6);
    rect(0, 0, 500, 500);
    fill(178-mouseX, 255-mouseY, 253);
    ellipse(mouseX, mouseY, 0.5*mouseY, 0.5*mouseX);
  }
}
