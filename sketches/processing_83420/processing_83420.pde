
int s1=0;
int ug=2;
int rg=2;
int colorR=150;
int colorG=150;
int colorB=150;
boolean p=false;
Ball horton= new Ball();
Paddle stan= new Paddle();
Paddle john= new Paddle();
void setup()
{
  size(400, 400);
}
void draw()
{ 
  if (s1==1)
  {
    horton.bounce();
    horton.move();
    background(0);
    fill(255);
    rect(200,0,5,400);
    horton.show();
    horton.check();
    john.moveP2();
    john.show();
    john.pong();
    stan.moveP1();
    stan.show();
    stan.ping();
  }
  else if (s1==0)
  { 
    background(0);
    textSize(45);
    textAlign(CENTER, CENTER);
    fill(colorR, colorG, colorB);
    colorR=int(random(0, 150));
    colorB=colorG-colorR;
    text("pong", 200, 50);
    fill(255);
    textSize(20);
    text("Press x to start 2 player pong", 200, 100);
    text("Press r,g or t to change gravity",200, 125);
    if (key=='x')
    {
      s1=1;
    }
    if (key=='r')
    {
      rg=5;
      ug=2;
      text("reverse gravity", 325, 385);
    }
    if(key=='g')
    {
      rg=2;
      ug=5;
      text("gravity",325,385);
    }
    if(key=='t')
    {
      rg=2;
      ug=2;
      text("no gravity",325,385);
    }
    if(key=='p');
    {
      p=true;
    }
  }
}
class Ball
{
  int x, y, p1, p2;
  boolean right, up, left, down;
  Ball()
  { 
    p1=0;
    p2=0;
    right=true;
    down=true;
    left=false;
    up=false;
    x=75+int(random(-25,10));
    y=25;

   
  }
  void show()
  { 
    fill(225, y, x);
    ellipse(x, y, 20, 20);
    text(p1, 100, 25);
    text(p2, 300, 25);
  }
  void move()
  {
     if(p==true)
    {
      if (key=='r')
    {
      rg=5;
      ug=3;
      text("reverse gravity", 325, 285);
    }
    if(key=='g')
    {
      rg=3;
      ug=5;
      text("gravity",325,285);
    }
    }
    if ( right==true)
    {
      x=x+2;
    }
    else if (left==true)
    {
      x=x-2;
    }
    if (down==true)
    {
      y=y+ug;
    }
    else if (up==true)
    {
      y=y-rg;
    }
  }
  void bounce()
  {
    if (get(x+5, y) ==color(255, 0, 0)||get(x+5, y) ==color(255))
    {
      left=true;
      right=false;
    }
    if (get(x-5, y) ==color(255, 0, 0)||get(x-5, y) ==color(255))
    {
      left=false;
      right=true;
    }
    if (y>390)
    {
      down=false;
      up=true;
    }
    if (y<10)
    {
      down=true;
      up=false;
    }
  }
  void check()
  {
    if (x>390)
    { 
      p1=p1+1;
      right=true;
      down=true;
      left=false;
      up=false;
      x=75;
      y=25;
    }
    else if(p1>10)
    {
      textSize(25);
      text("p1 wins",200,200);
    }
    if (x<0)
    {
      p2=p2+1;
      right=false;
      down=true;
      left=true;
      up=false;
      x=150;
      y=25;
    }
    else if(p2>10)
    {
      textSize(25);
      text("p2 wins",200,200);
    }
  }
}
  class Paddle
  {
    int x, y, c;
    Paddle()
    {
      c=255;
      y=150;
    }
    void ping()
    {
      x=25;
    }
    void pong()
    {
      x=375;
    }
    void moveP2()
    { 
      if (mouseY <150 && y>0)
      {
        y=mouseY;
      }
      if (mouseY > 150 && y<350)
      {
        y=mouseY;
      }
    }

    void moveP1()
    {
      if (keyPressed == true)
      {
        if (key=='w' && y>0)
        {
          y=y-5;
        }
        if (key=='s'&& y<350)
        {
          y=y+5;
        }
      }
    }
    void show()
    {
      fill(c, 0, 0);
      rect(x, y, 10, 50);
    }
  }
