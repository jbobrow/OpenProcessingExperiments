
//Tina L., CP1 14/15 Pong
Paddle human;
Ball bob;
int dir = 0;
void setup()
{
  size(300,300);
  bob = new Ball();
  human = new Paddle();
}
void draw()
{
  background(0);
  human.showhuman();
  human.keyPressed();
  bob.move();
  bob.bounce();
  bob.show();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x = int(random(200));
    y = int(random(200));
    up = true;
    right = false;
  }
  void move()
  {
    if(up == true)
    {
      y=y-3;
    }
    else
    {
      y=y+3;
    }
    if(right == true)
    {
      x=x+3;
    }
    else
    {
      x=x-3;
    }
  }
  void bounce()
  {
    if(y < 5)
    {
      up = false;
    }
    if(x > 295)
    {
      right = false;
    }
    if(x < 5)
    {
      right = true;
    }
    if(get(x,y+5) != color(0))
    {
      up =! up;
    }
    if(y>280)
    {
      up = false;
      fill(0);
      rect(0,0,300,300);
      fill(255);
      textAlign(CENTER);
      text("Game Over", 150, 150);
    }
  }
  void show()
  {
    noStroke();
    fill(0,200,255);
    ellipse(x,y,10,10);
  }
}
class Paddle
{
  void keyPressed()
  {
    if (keyPressed == true & key == 'a')
    {
      dir=dir-2;
    }
    if (keyPressed == true & key == 'd')
    {
      dir=dir+2;
    }
    if (dir<=0)
    {
      dir=0;
    }
    if (dir>=250)
    {
      dir=250;
    }
  }
  void showhuman()
  {
    stroke(255);
    fill(255);
    rect(dir, 280, 50, 10);
  }
}
