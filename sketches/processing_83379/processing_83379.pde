
boolean up, right;
boolean gameOver;
int x;
int y;
int c;
Ball Angela;
Paddle Skylar;

void setup()
{
  size(500, 400);
  frameRate(200);
  Angela = new Ball();
  Skylar = new Paddle();

}
void draw()
{
  
  stroke(255);
  background(0);
  Skylar.show();
  Skylar.move();

  Angela.move();
  Angela.bounce();
  Angela.show();
 
}
class Ball
{


  Ball()
  {
    x=400;
    y=100;
  }

 void move()
  {
    if (right==true)
    {
      x++;
    }
    if (right==false)
    {
      x--;
    }
    if (up==true)
    {
      y++;
    }
    if (up==false)
    {
      y--;
    }
  }
  void bounce()
  {
    if (get(x-1,y) != color(0))
    {
      right = true;
    }
    if (get(x+1,y) != color(0))
    {
      right = false;
    }
    if (get(x,y-1) != color(0))
    {
      up=true;
    }
    if (get(x,y+1) != color(0))
    {
      up=false;
    }
     if (x<1)
    {
      gameOver = true;
      textAlign (CENTER);
      textSize(25);
      text("Game Over", 250,250);
      noLoop();
    }
  }
  void show()
  {
    stroke(255);
    fill(255);
    ellipse(x, y, 10, 10);
  }
}
class Paddle
{
  int a;
  int b;
  int w;
  int s;

  Paddle()
  {
    a=20;
    b= 100;
  }
  void show()
  {
    fill(255);
    rect(a, b, 10, 50);
  }
  void move()
  {
    if (keyPressed)
    {
      if (key =='w')
      {
        b--;
      }
      if (key == 's')
      {
        b++;
      }
    }
  }
}
