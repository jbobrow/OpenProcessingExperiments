
//alan c Bouncing ball 14/15

ball Bobby;
void setup()
{
  Bobby = new ball();
  size(500,300);
}
 
void draw()
{
  background(155);
  Bobby.move();
  Bobby.bounce();
  Bobby.show();
}
 
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(500));
    y=int(random(300));
    up=false;
    right=false;
  }
 
 
  void move()
  {
    if (right == true)
    {
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
  }
 
  void bounce()
  {
    if (x<35)
    {
      right = true;
    }
    if (x>465)
    {
      right = false;
    }
    if (y<35)
    {
      up = false;
    }
    if (y>265)
    {
      up = true;
    }
  }
 
  void show()
  {
    noStroke();
    fill(25,155,200);
    strokeWeight(2);
    stroke(20,255,20);
    ellipse(x, y, 70, 70);
    fill(205,21,150);
    ellipse(x,y,35,35);
    fill(220,15,156);
    
  }
}
