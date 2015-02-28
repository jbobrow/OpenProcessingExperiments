
//James Wu, CP1 Mods 16-17
boolean gameover = false;
Ball bob;
Paddle pop;
ai ai;
void setup()
{
  size(500, 500);
  bob = new Ball();
  pop = new Paddle();
  ai = new ai();
}
int y= int(random(500));
int c=0;
int p=0;
void draw()
{
  if (gameover == true)
  {
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("HUMAN LOSES", 250, 250);
    textSize(20);
    text("CLICK ON THE SCREEN TO CONTINUE HUMILIATION", 250,270);
  }
  if (gameover==false)
  {
    background(0);
    ai.aishow();
    pop.popshow();
    pop.kk();
    bob.move();
    bob.bounce();
    bob.show();
  }
  textAlign(CENTER);
  textSize(30);
  text(" "+c+" ", 480, 40);
  text(" "+p+" ",20,40);
}
class Ball
{
  int x;
  boolean up, right;
  Ball()
  {
    x= 250;
    up=false;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y=y-2;
    }
    if (up==false)
    {
      y=y+2;
    }
    if (right==true)
    {
      x=x+2;
    }
    if (right==false)
    {
      x=x-2;
    }
  }

  void bounce()
  {
    if (get(x-5, y)!= color(0))
    {
      right=true;
    }
    if (get(x+5, y) != color(0))
    {
      right=false;
    }
    if (get(x, y-5) != color(0))
    {
      up=false;
    }
    if (get(x, y+5) != color(0))
    {
      up=true;
    }
    if (x<5)
    {
      gameover = true;
      c++;
    }
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 10, 10);
  }
}

class ai
{
  void aishow()
  {
    rect(490, y-30, 5, 60);
  }
}

class Paddle
{
  int w;
  Paddle()
  {
    w=210;
  }
  void popshow()
  {
    rect(5, w, 5, 60);
  }
  void kk()
  {
    if (keyPressed==true)
    {
      if (key=='w')
      {
        w=w-3;
      }
      if (key=='W')
      {
        w=w-3;
      }
      if (key=='S')
      {
        w=w+3;
      }
      if (key=='s')
      {
        w=w+3;
      }
    }
  }
}

void mouseClicked()
{
  gameover = false;
  redraw();
}


