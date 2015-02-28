
Star s;
int R, Y, A, N;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  R = 30;
  Y = 90;
  A = 90;

  s = new Star ();
  s.x= width/2;
  s.y= height/2;
}

void draw()
{
  background (0);
  s.show();
}

void mouseDragged()
{
  s.x=mouseX;
  s.y=mouseY;
}

class Star
{
  float x, y;

  void show()
  {
    fill(random (60, 64), random (75, 85), random (255), 100);

    for (int i=0;i<100; i=i+20)
    {
      ellipse(x+random(-Y, Y), y+random(-A, A), R, R);
    }

    if (mousePressed == true)
    {
      ellipse (mouseX, mouseY, R, R);
      }
else
{
  fill (255, 255, 0,200);
  for (int i=0;i<100;i=i+1);
  {
    ellipse(x, y, R, R);
    ellipse(x+random(-A, A), y+random(-Y, Y), R, R);
  }
    ellipse(x+random(-Y, Y), y+random(-A, A), R, R);
    }
  }
}


