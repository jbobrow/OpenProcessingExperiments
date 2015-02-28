
//Alex Lim, CP1 mods 4/5, Pong
//www.dizbalex.webs.com
Ball boll = new ball();
Paddle poddle = new paddle();
void setup()
{
  size(600, 600);
}
void draw()
{
  background(0);
  boll.move();
  boll.bounce();
  boll.show();
  poddle.move();
  poddle.show();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=300;
    y=300;
    up=true;
    right=true;
  }
  void move()
  {
    if (up == true)
    {
      y = y - 6;
    }
    else if (up == false)
    {
      y = y + 6;
    }
    if (right == true)
    {
      x = x + 6;
    }
    else if (right == false)
    {
      x = x - 6;
    }
  }
  void bounce()
  {
     
    if (x >= 590)
    {
      right = false;
    }
    else if (x <= 0)
    {
      right = true;
    }
    else if (y >= 590)
    {
      up = true;
    }
    else if (y <= 0)
    {
      up = false;
    }
    else if (get(x, y+30) != color(0))
    {
      up = true;
    }
  }
  void show()
  {
    noStroke();
    smooth();
    fill(70, 205, 200);
    ellipse(x, y, 10, 10);
  }
}
class paddle
{
  int w = 300;
  void move()
  {
    if (keyPressed == true && key=='a')
    {
      w = w - 10;
    }
    if (keyPressed == true && key=='d')
    {
      w = w + 10;
    }
  }
  void show()
  {
    fill (50, 20, 102);
    rect(w, 550, 75, 10);
  }
}
