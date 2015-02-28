
Ball bob;
Paddle tom;
boolean gameover = false;
PImage foreveralone;
int z =0;
void setup()
{
  size(600, 600);
  foreveralone = loadImage ("foreveralone.jpg");
  bob=new Ball();
  tom=new Paddle();
}
void draw()
{
  if (gameover==false)
  {
    image (foreveralone, 0 , 0, 600,600);
    tom.show();
    tom.keyPressed();
    bob.show();
    bob.move();
    bob.bounce();
  }
  else
  {
    background(0);
    textAlign(CENTER);
    fill(255, 0, 0);
    textSize(50);
    text("GAME OVER", 300, 300);
  }
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(600));
    y=350;
    up = true;
    right = false;
  }
  void move()
  {
    if (up==true)
    {
      y=y-10;
    }
    if (up==false)
    {
      y=y+10;
    }
    if (right==true)
    {
      x=x+10;
    }
    if (right==false)
    {
      x=x-10;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 30, 30);
    textSize(50);
    text(z,510,50);
  }
  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    if (x>600)
    {
      right = false;
    }
    if (y<=0)
    {
      up = false;
    }
    if (get(x, y+17)==color(254))
    {
      z=z+1;
      up=true;
    }
    if (y>=600)
    {
      gameover=true;
    }
  }
}
class Paddle
{
  int a;
  void keyPressed()
  {
    if (keyPressed==true & (key =='a'||key== 'A'))
    {
      a=a-10;
    }
    if (keyPressed==true & (key == 'd'||key== 'D'))
    {
      a=a+10;
    }
    if (a>=450)
    {
      a=450;
    }
    if (a<=0)
    {
      a=0;
    }
  }
  void show()
  {
    fill(254);
    rect (a, 570, 150, 10);
  }
}



