
class Ball
{
  int x, y;
  boolean up, right;

  Ball()
  {
    x=int(random(250));
    y=int(random(250));
    up=true;
    right=false;
  }

  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    else y=y+5;
    if (right==true)
    {
      x=x+5;
    }
    else x=x-5;
  }

  void bounce()
  {
    if (x>=500)
    {
      right=false;
    }
    if (x<=0)
    {
      right=true;
    }
    if (y>=500)
    {
      up=true;
    }
    if (y<=0)
    {
      up=false;
    }
}
void show()
{
  fill(0, 255, 0);
  ellipse(x, y, 20, 20);
}
}

Ball pelota= new Ball();
Ball bjarg= new Ball();
Ball boing= new Ball();
Ball peter= new Ball();


void setup()
{
  size(500, 500);
  frameRate(60);
  noStroke();
}

void draw()
{
  fill(0, 0, 0, 90);
  rect(0, 0, 500, 500);
  pelota.move();
  pelota.bounce();
  pelota.show();

  bjarg.move();
  bjarg.bounce();
  bjarg.show();

  boing.move();
  boing.bounce();
  boing.show();

  peter.move();
  peter.bounce();
  peter.show();
}
