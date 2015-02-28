
//Dominique A., Pong, CP1, Mod 16-17

Ball joe;
paddle bee;
void setup()
{
  smooth();
  size(250,250);
  frameRate(100);
  joe = new Ball();
  bee = new paddle();
}
void draw()
{
  background(0,0,0);
  fill(random(255), random(255), random(255));
  joe.move();
  joe.bounce();
  joe.show();
  bee.show();
  bee.keyPressed();
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
  x = int(random(245));
  y = int(random(245));
  right = true;
  up = true;
  }
void move()
{
  if(right == true)
  {
   x++;
   }
   else
   {
   x--;
   }
   if(up == true)
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
 if(x > 245)
 {
  right = false;
   }
  else if(x < 1)
   {
   right = true;
   }
   if (y < 1)
   {
    up = false;
   }
   else if(y > 245)
   {
   up = true;
   }
   if(get(x,y + 5) != color(0,0,0))
   {
    up = true;
   }
}
void show()
{
  stroke(100,100,100);
  ellipse(x,y,20,20);
  }
}
class paddle
{
  int x;
  void show()
  {
    smooth();
    stroke(0);
    fill(151,224,250);
    rect(x,245,60,25);
  }
  void keyPressed()
  {
    if (keyPressed == true & (key =='6'))
    {
      x++;
    }
    if (keyPressed == true & (key == '4'))
    {
      x--;
    }
    if (x >= 250)
    {
      x = 250;
    }
    if (x <= 0)
    {
      x = 0;
    }
  }
}
