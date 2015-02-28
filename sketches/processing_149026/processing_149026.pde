
int dotCount = 100;

void setup()
{
  size(600, 600);
  background(255, 255, 255);
}

void draw()
{
  strokeWeight(3);
  if (mousePressed)
  {
    makeSplot();
  }

  if (keyPressed)
  {
    stroke(random(255), random(255), random(255));
  }
}


void makeSplot()
{
  for (int i=0; i < dotCount; i++)
  {
    point(mouseX + random(-i, i), mouseY + random(-i, i));
  }
}

