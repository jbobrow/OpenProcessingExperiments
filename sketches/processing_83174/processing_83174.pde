
//Di Tang, Bouncing Ball, CP1, 14-15
Ball Alpha;
Ball Beta;
Ball Charlie;
Ball Delta;
Ball Echo;
Ball Foxtrot;

void setup()
{
  size(500, 500);
  Alpha=new Ball();
  Beta=new Ball();
  Charlie=new Ball();
  Delta=new Ball();
  Echo=new Ball();
  Foxtrot=new Ball();
}
 
void draw()
{
  background(0);
  Alpha.move();
  Alpha.bounce();
  Alpha.show();
  Beta.move();
  Beta.bounce();
  Beta.show();
  Charlie.move();
  Charlie.bounce();
  Charlie.show();
  Delta.move();
  Delta.bounce();
  Delta.show();
  Echo.move();
  Echo.bounce();
  Echo.show();
  Foxtrot.move();
  Foxtrot.bounce();
  Foxtrot.show();
}
 
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=false;
    right=false;
  }
 
void move()
{
  if (right==true)
  {
    x=x+2;
  }
  if (right==false)
  {
    x=x-2;
  }
  if (up==true)
  {
    y=y-1;
  }
  if (up==false)
  {
    y=y+1;
  }
}
void bounce()
{
  if (x<0)
  {
    right=true;
  }
  if (x>500)
  {
    right=false;
  }
  if (y<0)
  {
    up=false;
  }
  if (y>500)
  {
    up=true;
  }
}
void show()
{
  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(x,y, 75, 75);
}
}
