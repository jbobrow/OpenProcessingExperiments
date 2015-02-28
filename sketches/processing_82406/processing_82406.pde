
//Derek Kwong; mods 14/15
Ball bob;
void setup()
{ 
  bob= new Ball();
  size(500, 500);
  frameRate(150);
}
void draw()
{ 
  background(0);
  bob.show();
  bob.move();
  bob.bounce();
  redraw();
}
class Ball
{ 
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=true;
    right=true;
  }

  void move()
  { 
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
      
    }
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
    if (x>470)
    {
      right=false;
    }
    if (x<30)
    {
      right=true;
    }
    if (y>470)
    {
      up=true;
    }
    if (y<30)
    {
      up=false;
    }
  }
  void show()
  { 
    smooth();
    fill(255);
    ellipse(x, y, 65, 65);    
  }
}
