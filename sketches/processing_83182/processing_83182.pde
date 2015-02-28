
//Hayley G, CP1, 14-15

Paddle two = new Paddle();
Ball one = new Ball();
int x1;
boolean right = true;
boolean down = true;
void setup()
{
  size (500, 300);
}
void draw()
{
  frameRate(150);
  background(0);
  two.move();
  two.show();
  one.move();
  one.bounce();
  one.show();
  }
class Paddle
{
  void move()
  {
    if (mousePressed == true && mouseX < x1)
    {
      x1--;
    }
    else if (mousePressed == true && mouseX > x1)
    {
      x1++;
    }
  }
  void show()
  {
    fill(255);
    rect(x1, 285, 60, 15);
  }
}
class Ball
{
  int x, y;
  Ball()
  {
    x = int(random(500));
    y = int(random(300));
   }
   void move()
   {
     if (right == true)
     {
       x++;
     }
     else
     {
       x--;
     }
     if (down == true)
     {
       y++;
     }
     else
     {
       y--;
     }
   }
   void bounce()
   {
     if (x < 10)
     {
       right = true;
     }
     if (x > 490)
     {
       right = false;
     }
     if (y < 10)
     {
       down = true;
     }
     if (y > 290)
     {
       down = false;
     }
     if (get(x,y+10) != color(0))
     {
       down = false;
     }
   }
   void show()
   {
     ellipse(x, y, 20, 20);
   }
 }
