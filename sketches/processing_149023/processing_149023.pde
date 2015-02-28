
void setup()
{
  size(600, 600);
  background(0, 0, 0);
}

void draw()
{
  stroke(255);
  strokeWeight(1);
  
  if (mousePressed)
  {
    for (int i=0; i < mouseX; i+=5)
    {
      point(i, ((float)mouseY/mouseX) * i);
    }
  }
}

