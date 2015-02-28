
//Matthew Quesada Computer Programming 4-5
//PONNGGGGG

Paddle smash;  
Ball matthew;
void setup()
{
  smash=new Paddle();
  matthew= new Ball();
  size(500, 500);
}

void draw()
{
  frameRate(120);
  background(0, 0, 0);
  smash.showw();
  smash.movee();
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
      y=y+1;
    }
    else
    {
      y=y-1;
    }

    if (right==true)
    {
      x=x+1;
    }
    else
    {
      x=x-1;
    }
  }


  void bounce()
  {
    
    if (x==500)
    {
      right=false;
    }

    if (x==0)
    {
      right=true;
    }

    if (y==500)
    {
      up=true;
    }
    if (y==0)
    {
      up=false;
    }
    
     if(get(x-16,y) == color(255))
     {
       right=true;
     }
  }

  void show()
  {
    fill(0, 255, 0);
    ellipse(x, y, 30, 30);
  }
}

class Paddle
{
  int xp, yp;
  Paddle()
  {
    xp=0;
    yp=250;
  }
  void movee()
  {
    if (keyPressed==true && key=='w')
    {
      yp=yp-5;
    }
    if (keyPressed==true && key=='s')
    {
      yp=yp+5;
    }
   
   

  }

    void showw()
    {
      fill(255);
      rect(xp, yp, 10, 50);
    }
  }
