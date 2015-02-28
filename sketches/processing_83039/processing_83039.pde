
//Laura R., Pong, Computer Programming 1, 14-15
Ball kylie = new Ball();
Paddle Jessie = new Paddle();
void setup()
{
 size(600,600);
}
void draw()
{
  background(137, 17, 17);
  Jessie.show();
  Jessie.move();
  kylie.show();
  kylie.move();
  kylie.bounce();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = 100;
    y = 300;
    up = true;
    right = true;
  }
  void move ()
  {
    if (up == true)
    {
      y = y - 3;
    }
    if (up == false)
    {
      y= y + 3;
    }
    if (right == true)
    {
      x= x+ 3;
    }
    if (right == false)
    {
      x = x - 3;
    }
  }
  void bounce()
  { 
    if (y >= 590)
    {
      up = true;
    }
    else if ( y <= 10)
    {
      up = false;
    }
    else if (x >= 590 )
    {
      right = false;
    }
    else if ( x <= 10 )
    { 
      right = true;
    }
    else if (get(x + 26 , y + 26) != color(137, 17, 17)) 
    {
      up = true;
    }
    else if (get(x - 26 , y - 26) != color(137, 17, 17)) 
    {
      up = false;
    }
    else if (get(x + 26 , y + 26) != color(137, 17, 17)) 
    {
      right = true;
    }
    else if (get(x - 26 , y - 26) != color(137, 17, 17)) 
    {
      right = false;
    }
  }
  void show()
  {
    noStroke();    
    fill(250, 234, 177);
    ellipse(x, y, 50, 50);
  }
}
class Paddle
{
  int x1, y1;
  Paddle()
  {
    x1 = 200;
    y1 = 500;
  }

  void move()
  {
    if (mousePressed == true)
    {
      x1 = mouseX;
      y1 = mouseY;
    }
  }
  void show()
  {
    rect(x1, y1, 100, 40);
  }
}
