
int x = 0, speedX = 1;

void setup()
{
  size(400, 400);
  background(0);
}

void draw()
{
  if((mouseX < 190 || mouseX > 210) || (mouseY < 190 || mouseY > 210))
  {
    ellipseMode(CENTER);
    fill(0, 255, 0);
    ellipse(x, height/2, 70, 70);
    fill(0);
    ellipse(x - 15, height/2, 10, 10);
    ellipse(x + 15, height/2, 10, 10);
    ellipse(x, height/2 + 15, 20, 20);
    rectMode(CENTER);
    fill(0);
    rect(x - 15, height/2 - 10,15, 3);
    rect(x + 15, height/2 - 10, 15, 3);
    x = x + speedX;
    if(x > width || x < 0)
    {
      speedX = speedX * -1;
    }
  }
  else
  {
    background(0);
  }
}
