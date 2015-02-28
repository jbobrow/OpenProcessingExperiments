
//Di Tang, Pong, CP1, 14-15
PImage table;
Paddle Stick;
Ball Alpha;
float x;
void setup()
{
  Alpha=new Ball();
  Stick=new Paddle();
  table = loadImage("http://th01.deviantart.net/fs71/PRE/f/2010/215/6/9/TABLE_FLIP_by_robogeek43.jpg");
  size(500,500);
  frameRate(100);
}
  
void draw()
{
  background(0);
  Stick.shows();
  Alpha.move();
  Alpha.bounce();
  Alpha.show();
}
class Paddle
{
  int x,y;
  boolean left, right;
  Paddle()
  {
    
    y=480;
    left=false;
    right=false;
  }
  
  void shows()
  {
    noStroke();
    fill(0,150,255);
    rect(mouseX,y,80,10);
  }
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(100));
    y=int(random(100));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x=x+ 20;
    }
    else
    {
      x=x-5;
    }
    if (up == true)
    {
      y=y-8;
    }
    else
    {
      y=y+5;
    }
    if(get(x,y+20)==color(0,150,255))
    {
      up=true;
    }   
  }
  
  void bounce()
  {
    if (x<20)
    {
      right = true;
    }
    if (x>480)
    {
      right = false;
    }
    if (y<20)
    {
      up = false;
    }
    if (y>480)
    {
      image (table, 0, 0, width, height);
    }
  }
  void show()
  {
    noStroke();
    fill(random(255),random(255),random(255));
    ellipse(x, y, 40, 40);
  }
}
