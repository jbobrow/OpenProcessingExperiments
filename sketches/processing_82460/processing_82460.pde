
//Dominique A., Bouncing Ball, CP1, Mod 16-17

Ball joe;
void setup()
{
  smooth();
  size(250,250);
  joe = new Ball();
}
void draw()
{
  background(0,0,0);
  fill(0,random(255),0);
  joe.move();
  joe.bounce();
  joe.show();
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
}
void show()
{
  stroke(255);
  ellipse(x,y,35,y);
  }
}
