
// Hannah Abdel, CP1 4-5, Pong 
//http://www.openprocessing.org/classroom/1967
Ball billy;
Paddle paddy;
int w;
void setup()
{
  smooth();
  size(200,200);
  paddy = new Paddle();
  billy = new Ball();
  
}
void draw()
{
  background(0,0,0);
  paddy.show();
  paddy.move();
  billy.bounce();
  billy.show();
  billy.move(); 
  if(keyPressed == true && key == 'a')
  {
    w--;
  }
  else if (keyPressed == true && key == 'd')
  {
    w++;
  }
  
   

 }
class Paddle
{
  boolean LEft, RIght;
  void show()
  {
    stroke(2,143,170);
    rect(w,180,30,10);
  }
    void move()
  {
    if(RIght == true)
    {
      w++;
    }
    else if (LEft == true)
    {
      w--;
    }
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
       y++;
     }    
  }
  void bounce()
  {
    if(x > 199)
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
    if(get(x,y)!=color(0,0,0))
    {
   
    }
  }
  void show()
  { 
    stroke(144,105,237);
    ellipse(x,y,10,10);
  }
}



