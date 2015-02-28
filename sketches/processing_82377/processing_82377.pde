
// Hannah Abdel, CP1 4-5, Bouncing Ball
Ball billy;
void setup()
{
  smooth();
  size(200,200);
  billy = new Ball();
}
void draw()
{
  background(0,0,0);
  billy.bounce();
  billy.show();
  billy.move();
 {
   
 }
}

class Ball
{ 
  boolean Up, Right;
  int x,y;
  Ball()
  {
    x = int(random(200));
    y = int (random(200));
    Up = true;
    Right = true;  
  } 
    void move()
  {
    if(Right == true)
    {
      x++;
    }
      else
      {
        x--;
      }
     if(Up == true)
     {
       y--;
     }
     else
     {
       y++;;
     }    
  }
  void bounce()
  {
    if(x>199)
    {
      Right = false;
    }
    else if (x < 1)
    {
      Right = true;
    }
    if (y < 1)
    {
      Up = false;
    }
    else if (y > 199)
    {
      Up = true;
    }   
  }
  void show()
  {
   
    stroke(255,255,255);
    ellipse(x,y,30,30);
  }

}

     



