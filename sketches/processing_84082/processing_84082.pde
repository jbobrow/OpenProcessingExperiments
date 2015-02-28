
//Matheson Gee Computer Programming 1 Mods:14/15
ball Bob;
pad Paddle;
void setup()
{
  Paddle=new pad();
  Bob=new ball();
  size(500,500);
}
  
void draw()
{
  background(0);
  Paddle.keyPressed();
  Paddle.shows();
  Bob.move();
  Bob.bounce();
  Bob.show();
}
class pad
{
  int x,y;
  boolean left, right;
  pad()
  {
    x=140;
    y=480;
    left=false;
    right=false;
  }
  void keyPressed()
  {
    if(keyPressed == true & key=='d')
    {
      x=x+2;
    }
    if(keyPressed==true & key=='a')
    {
      x=x-2;
    }
  }
  void shows()
  {
    noStroke();
    fill(255);
    rect(x,y,50,20);
  }
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(300));
    y=int(random(300));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x=x+2;
    }
    else
    {
      x=x-2;
    }
    if (up == true)
    {
      y=y-2;
    }
    else
    {
      y=y+2;
    }
    if(get(x,y+12)==color(255))
    {
      up=true;
    } 
  }
  
  void bounce()
  {
    if (x<1)
    {
      right = true;
    }
    if (x>499)
    {
      right = false;
    }
    if (y<1)
    {
      up = false;
    }
    if (y>499)
    {
      up=true;
    }
  }
  void show()
  {
    noStroke();
    fill(0,0,255);
    ellipse(x, y, 40, 40);
  }
}
