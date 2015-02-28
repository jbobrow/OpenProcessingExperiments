
ballo bob;
paddle bobo;
float z=200;
void setup()
{
  size(500, 600);
  frameRate(120);
  bob=new ballo();
  bobo=new paddle();
}
void draw()
{
  background(127);
  bob.show();
  bob.move();
  bob.lose();
  bob.bounce();
  bobo.shows();
  bobo.move();
}
class ballo
{
  float y, speed, gravity, x;
  boolean right, gameover;
  ballo()
  {
    y=150;
    speed=2;
    gravity=0.01;
    x=int(random(500));
    right=true;
    gameover=false;
  }
  void move()
  {
    y=y+speed;
    speed=speed+gravity;
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x+20>width)
    {
      right=false;
    }
    if (x<0)
    {
      right=true;
    }
    if (x>z && x+20<z+75 && y+20>580)
    {
      speed=speed*(-.95);
    }
  }
  void show()
  {
    stroke(1);
    fill(254);
    if (gameover==false)
    {
      
      rect(x, y, 20, 20);
    }
  }
  void lose()
  {
    if (y>height)
    {
      text("You Lose! Click to play again!", 250, 250);
      gameover=true;
    }
    if (mousePressed==true && gameover==true)
    {
      background(127);
      gameover=false;
      x=int(random(500));
      y=150;
      speed=2;
      gravity=0.01;
    }
  }
}
class paddle
{
  boolean left, right;
  paddle()
  {
    left=false;
    right=false;
  }
  void move()
  {
    if (keyPressed==true && key=='a')
    {
      z-=2.5;
    }
    else if (keyPressed==true && key=='d')
    {
      z+=2.5;
    }
    if (z<0)
    {
      z=0;
    }
    if (z+75>width)
    {
      z=width-75;
    }
  }
  void shows()
  {
    stroke(0);
    rect(z, 580, 75, 20);
  }
}



