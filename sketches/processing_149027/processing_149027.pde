
float angle = 0;
float scale = 1;

void setup()
{
  size(600, 600);
  background(255, 255, 255);
  rectMode(CENTER);
}

void draw()
{
  translate(mouseX, mouseY);
  scale(scale);

  if (mousePressed)
  {
    angle = angle + 10;
    rotate(angle);
    rect(0, 0, 50, 50);
  }

  if (keyPressed)
  {
    if (key=='-')
    {
      scale = scale - 0.01;
    }
    if (key=='+')
    {
      scale = scale + 0.01;
    }
  }
}

