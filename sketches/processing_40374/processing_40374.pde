
balls a;

void setup()
{
  size(700, 700);
  noStroke();
  smooth();

  a = new balls();
  a.x=250;
  a.y=250;
  a.r=random(10, 50);
  background(0);
}

void draw()
{
  background(0);
  a.show();
}

class balls
{
  float x, y, r, a;
  void show()
  {
    for (int i=0; i<200; i++)
    {
      a = 100;
      fill(random(0, 255), random(0, 255), random(0, 255),a);
      ellipse(x+random(-250, 500), y+random(-250, 500), r, r);
    }
    if (mouseButton == LEFT)
    {
      x=mouseX;
      y=mouseY;
    }
    if (mouseButton == RIGHT)
    {
      a=a+random(-10,10);
    }
  }
}


