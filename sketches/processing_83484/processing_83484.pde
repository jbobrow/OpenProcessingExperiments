
Ball bob;
Paddle jeff;
boolean gameover = false;
int points = 0;


void setup()
{
  size(900, 500);
  fill(255);
  bob = new Ball();
  jeff = new Paddle();
}
void draw()
{
  if (gameover==false)
  {
    background(0);
    jeff.show();
    jeff.keyPressed();
    bob.show();
    bob.move();
    bob.bounce();
    textSize(40);
    fill(255);
    text("Points:" + points, 50, 50);
  }
  else
  {
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 300, 200);
    if (keyPressed==true & (key =='r'||key== 'R'))
    {

      text("Points:" + points, 50, 50);
      gameover=false;
      points=0;
    }
  }
}

class Ball
{
  int x, y;
  boolean up, left;
  Ball()
  {
    x=int(400);
    y=int(250);
    up=random(1)<.5;
    left=random(1)<.5;
  }
  void move()
  {
    if (up==true)
    {
      y=y-4;
    }
    else
    {
      y=y+4;
    }
    if (left==true)
    {
      x=x-4;
    }
    else
    {
      x=x+4;
    }
  }
  void bounce()
  {

    if (x<0)
    {

      left=false;
      gameover=true;
    }
    if (x>width)
    {
      left=true;
      gameover=true;
    }
    if (y<=0)
    {
      up=false;
    }
    if (y>=height)
    {
      up=true;
    }
    if (get(x-17, y)==color(193,72,76))
    {
      left=false;
      points=points+1;
    }
    if (get(x+17, y)==color(72, 182, 193))
    {
      left=true;
      points=points+1;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 30, 30);
  }
}
class Paddle
{
  int a;
  void keyPressed()
  {
    if (keyPressed==true & (key =='x'||key== 'X'))
    {
      a=a-7;
    }
    if (keyPressed==true & (key == 's'||key== 'S'))
    {
      a=a+7;
    }
    if (a>=500)
    {
      a=500;
    }
  }  
  void show()
  {
    fill(193,72,76);
    rect (50, 125-a, 20, 100);
    fill(72, 182, 193);
    rect(840, 125-a, 20, 100);
  }
}



