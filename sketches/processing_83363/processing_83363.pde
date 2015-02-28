
PFont font;
PImage pong;
int score1=0;
int score2=0;
int t=350;
float u=350;
int w=350;
int x=450;
int y=300;
Ball ace=new Ball();
Paddle hero=new Paddle();
Paddle villain=new Paddle();
void setup()
{
  size(900, 600);
  pong=loadImage("Pong.png");
  font=loadFont("Flintstone-48.vlw");
  textFont(font);
  textSize(40);
}
void draw()
{
  classic();
}
void classic()
{
  image(pong, 0, 0);
  fill(255);
  textAlign(CENTER);
  text("Score: "+score1, 750, 50);
  text("Score: "+score2, 150, 50);
  hero.heros();
  hero.keyPressed();
  villain.villains();
  villain.evil();
  ace.move();
  ace.bounce();
  ace.show();
}
class Ball
{
  boolean up, right;
  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    if (up==false)
    {
      y=y+5;
    }
    if (right==true)
    {
      x=x+5;
    }
    if (right==false)
    {
      x=x-5;
    }
  }
  void bounce()
  {
    if (100>=y || y>=550)
    {
      up=!up;
    }
    if (get(x, y)!=color(0))
    {
      right=!right;
    }
    if (get(x+10, y) !=color(0))
    {
      right=!right;
    }
    if (x<=100)
    {
      x=450;
      score1=score1+1;
    }
    if (x>=787)
    {
      x=450;
      score2=score2+1;
    }
  }
  void show()
  {
    strokeWeight(1);
    fill(255);
    stroke(255);
    ellipse(x, y, 10, 10);
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
  void heros()
  {
    fill(255);
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    rect(110, t, 5, 60);
  }
  void villains()
  {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(780, u, 5, 60);
  }
}


