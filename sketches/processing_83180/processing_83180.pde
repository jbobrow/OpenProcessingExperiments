
//Steven G., CP1 mods 14-15, Pong

Ball bob;
Paddle bob2;
void setup()
{
  size(400, 400);
  bob2 = new Paddle();
  bob = new Ball();
}
void draw()
{
  background(0);
  bob2.show();
  bob2.keyPressed();
  bob.move();
  bob.bounce();
  bob.show();
}
class Ball
{
  int x, y, z;
  boolean up, right;
  Ball()
  {
    z=0;
    x=int(random(400));
    y=int(random(100,300));
    up=true;
    right=random(1)<.5;
  }
  void move()
  {
    if (up==true)
    {
      y=y-7;
    }
    else
    {
      y=y+7;
    }
    if (right==true)
    {
      x=x+7;
    }
    else
    {
      x=x-7;
    }
  }
  void show()
  {
    textSize(20);
    fill(255);
    text(z,330,70);
    ellipse(x, y, 25, 25);
  }
  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    if (x>400)
    {
      right = false;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>400)
    {
      fill(0);
      rect(200, 200, 410, 410);
      textAlign(CENTER);
      fill(255, 0, 0);
      textSize(50);
      text("GAME OVER", 200, 200);
    }
    if (get(x, y+12) == color(254))
    {
      z=z+1;
      up=true;
    }
  }
}
class Paddle
{
  int t;
  Paddle()
  {
    t=200;
  }
  void keyPressed()
  {
    if (keyPressed==true & (key=='d'||key=='D'))
    {
      t=t+5;
    }
    if (keyPressed==true & (key=='a'||key=='A'))
    {
      t=t-5;
    }
    if (t>=365)
    {
      t=365;
    }
    if (t<=35)
    {
      t=35;
    }
  }
  void show()
  {
    fill(254);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(t, 350, 70, 15);
  }
}
