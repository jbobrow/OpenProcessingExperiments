
//Matthew Quesada
//Computer Programming 4-5
//bouncingball


Ball matthew;
void setup()
{
  matthew= new Ball();
  size(500, 500);
}

void draw()
{
  background(0, 0, 0);
  matthew.move();
  matthew.bounce();
  matthew.show();
}

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=200;
    y=70;
    boolean up=false;
    boolean right=true;
  }

  void move()
  {
    if (up==false)
    {
      y=y+10;
    }
    else
    {
      y=y-10;
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


    void bounce()
    {
      if(x==500)
      {
        right=false;
      }
      
      if (x==0)
      {
        right=true;
      }
      
      if(y==500)
      {
        up=true;
      }
      if (y==0)
      {
        up=false;
      }
        
    }

    void show()
    {
      fill(0, 255, 0);
      ellipse(x, y, 50, 50);
    }
  }
