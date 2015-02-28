
void setup()
{
  size(640,480);
  background(255);
}

void draw()
{
  fill(0);
  noStroke();
  if(mousePressed)
  {
    ellipse(mouseX,mouseY,10,10);
  }
}


