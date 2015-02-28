
Ball tim;
Ball hi;
Ball jamesbond;
void setup()
{
  tim= new Ball();
  hi= new Ball();
  jamesbond= new Ball();
  size(500, 500);
  frameRate(150);
  smooth();
}

void draw()
{
  background(0);
  tim.show();
  tim.bounce();
  tim.move();
  hi.show();
  hi.bounce();
  hi.move();
  jamesbond.show();
  jamesbond.move();
  jamesbond.bounce();
}

class Ball
{
  int siz;
  float placeX;
  float placeY;
  float x;
  float y;

  Ball()
  {
    placeX=random(0, 500);
    placeY=random(0, 500);
    siz=50;
    x=y=1;
  }

  void show()
  {
    ellipse(placeX, placeY, siz, siz);
  }

  void move()
  {
    placeX=placeX+x;
    placeY=placeY+y;
  }

  void bounce()
  {
    if (placeX > 480)
    {
      x=random(-1.8, -1.0);
      fill(random(0, 256), random(0, 256), random(0, 256));
    }
    if (placeY > 480)
    {
      y=random(-1.8, -1.0);
      fill(random(100, 256), random(100, 256), random(100, 256));
    }
    if (placeX<20)
    {
      x=random(1.8, 1.0);
      fill(random(100, 256), random(100, 256), random(100, 256));
    }
    if (placeY<20)
    {
      y=random(1.8, 1.0);
      fill(random(100, 256), random(100, 256), random(100, 256));
    }
  }
}
