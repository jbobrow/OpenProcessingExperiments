
//Allison Wong, Pong, CP1 mods 4-5

int score1=0;
int score2=0;
int t=350;
float u=350;
int w=350;
int x=450;
int y=300;
Ball Zac=new Ball();
Paddle Cam=new Paddle();
Paddle Ani=new Paddle();
void setup()
{  
  size(300,300);
}
void draw()
{
  background(0);
  textAlign(CENTER);
  text("Score:"+score1,750,50);
  text("Score:"+score2,150,50);
  Cam.Cams();
  Cam.keyPressed();
  Ani.Anis();
  Ani.evil();
  Zac.move();
  Zac.bounce();
  Zac.show();
}
class Ball
{
  int x,y;
  boolean up,right;
  
  Ball()
  {
    x = int(random(300));
    y = int(random(300));
    up = true;
    right = true;
  }
 
  void move ()
  {
    if (up == true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right == true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
 
  void bounce ()
  {
    if (x == 300)
    {
      right = false;
    }
    if (x == 0)
    {
      right = true;
    }
    if (y == 300)
    {
      up = true;
    }
    if (y == 0)
    {
      up = false;
    }
  }
 
  void show ()
  {
    fill(50,227,213);
    ellipse(x, y, 40, 40);
  }
}
class Paddle
{
  void keyPressed()
  {
    if (keyPressed==true & (key== 's'||key== 'S'))
    {
      t=t+10;
    }
    if (keyPressed==true & (key== 'w'||key== 'W'))
    {
      t=t-10;
    }
    if (t>=510)
    {
      t=510;
    }
    if (t<=140)
    {
      t=140;
    }
  }
}
void evil()
  {
    if (u<=y && x>=450)
    {
      u=u+4.75;
    }
    if (u>=y && x>=450)
    {
      u=u-4.25;
    }
    if (u>=510)
    {
      u=510;
    }
    if (u<=140)
    {
      u=140;
    }
  }
  void Cams()
  {
    fill(255);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(110, t, 5, 60);
  }
  void Anis()
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(780, u, 5, 60);
  }
