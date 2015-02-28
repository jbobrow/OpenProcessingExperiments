
ball kite = new ball();
paddle etik = new paddle();

void setup() 
{
  size(500, 500);
}
void draw()
{
  background(50);
  etik.move();
  etik.show();
  kite.move();
  kite.bounce();
  kite.show();

}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=100;
    y=300;
    up=true;
    right=true;
  }
  void move()
  {
    if (up == true)
    {
      y=y-5;
    }
    else if (up == false)
    {
      y=y+5;
    }
    if (right == true)
    {
      x=x+5;
    }
    else if (right == false)
    {
      x=x-5;
    }
  }
  void bounce()
  {
    
    if (x >= 490)
    {
      right = false;
    }
    else if (x <= 0)
    { 
      right = true;
    }
    else if (y >= 490)
    {
      up = true;
    }
    else if (y <= 0)
    { 
      up = false;
    }
    else if (get(x,y+26) != color(50))
    {
      up = true;
    }
  }
  void show()
  {
    noStroke();
    smooth();
    fill(195, 125, 23);
    ellipse(x, y, 50, 50);
  }
}

class paddle
{
      int x2=200;
  void move()
  {

    if (keyPressed == true && key=='a')
    {
      x2=x2-15;
    }
    if (keyPressed == true && key=='d')
    {
      x2=x2+15;
    }
  }
  void show()
  {
    fill(255, 50, 70);
    rect(x2, 450, 100, 20);
  }
}
