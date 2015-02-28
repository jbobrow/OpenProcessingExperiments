
//Brandan H. Comp 1 Block 7
Ball boy;
Paddle p;
void setup()
{
  size(750, 750);
  p = new Paddle();
  boy = new Ball();
}
void draw()
{
  background(0);
  p.show();
  p.keyPressed();
  boy.move();
  boy.bounce();
  boy.show();
}
class Ball
{
  int x, y, z;
  boolean up, right;
  Ball()
  {
    z=0;
    x=int(random(750));
    y=int(random(100, 300));
    up=true;
    right=random(1)<.5;
  }
  void move()
  {
    if (up==true)
    {
      y=y-10;
    }
    else
    {
      y=y+10;
    }
    if (right==true)
    {
      x=x+10;
    }
    else
    {
      x=x-10;
    }
  }
  void show()
  {
    textSize(50);
    fill(255);
    text(z, 330, 70);
    ellipse(x, y, 25, 25);
  }
  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    if (x>750)
    {
      right = false;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>750)
    {
      z--;
      up=true;
    }
    if (get(x, y+12) == color(254))
    {
      z++;
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
    if (t>=725)
    {
      t=725;
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
    rect(t, 725, 125, 15);
  }
}
