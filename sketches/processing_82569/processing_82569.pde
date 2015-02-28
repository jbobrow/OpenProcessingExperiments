
//Keana M., CP1, mods 4-5, Bouncing Ball

Ball bob; 
Ball joe;
void setup()
{
  size(500, 500);
  frameRate(150);
  bob = new Ball();
  joe = new Ball();
}
void draw()
{
  background(0, 0, 0);
  bob.move();
  bob.bounce();
  bob.show();
  joe.move();
  joe.bounce();
  joe.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  color col;
  Ball()
  {
    x = int(random(0, 500));
    y = int(random(0, 500));
    up = random (1) < 0.5;
    right = random (1) < 0.5;
    col = color (255);
  }
  void move()
  {
    if (right == false)
    {
      x= x-2;
    }
    else
    {
      x++;
    }
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
  }
  void bounce()
  {
    if (x < 0)
    {
      right = true;
      col = color (random(256), random(256), random(256));
    }
    if (x>500)
    {
      right = false;
      col = color (random(256), random(256), random(256));
    }
    if (y<0)
    {
      up = false;
      col = color (random(256), random(256), random(256));
    }
    if (y>500)
    {
      up = true;
      col = color (random(256), random(256), random(256));
    }
  }
  void show()
  {
    fill (col);
    ellipse (x, y, 20, 20);
  }
}
