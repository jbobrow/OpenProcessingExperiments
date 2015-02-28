
//Justin L. CP1 Mods 16/17, Pong

Paddle JMZ;
Paddle Tyler;
Ball hanson;
void setup()
{
  frameRate(100);
  JMZ = new Paddle();
  Tyler = new Paddle();
  hanson = new Ball();  
  size(600,600);
}
void draw()
{  
  background(25,67,89);
  JMZ.move();
  JMZ.show();
  Tyler.move();
  Tyler.show();
  hanson.move();
  hanson.bounce();
  hanson.show();
  fill(25,25,25);
}
class Paddle
{
  int dude;
  Paddle()
  {
    int dude = 300;
  }
  void move()
  {
    if(keyPressed == true && key == '4')
    {
      dude--;
    }
    if(keyPressed == true && key == '6')
    {
      dude++;
    }
  }
  void show()
  {
    rect(dude, 580, 50, 20);
    rect(dude, 300, 50, 20);
  }
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(600));
    y = int(random(600));
    up = true;
    right = true;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x>=580)
    {
      right = false;
    }
    else if (x<=20)
    {
      right = true;
    }
    else if (y>=580)
    {
      up = true;
    }
    else if (y<=20)
    {
      up = false;
    }
    else if(get(x,y+21) != color(25,67,89))
    {
      up = true;
    }
  }
  void show()
  {
    ellipse(x, y, 40, 40);
  }
}
