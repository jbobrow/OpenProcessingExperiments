
//Jordan Leung 4,5 Computer Programming 

Ball cool; 
Paddle hihi;
int t= 1;
void setup()
{
 
  size(600,500);
  cool= new Ball();
  hihi= new Paddle();
}

void draw()
{
  background(0);
  hihi.show();
  hihi.move();
  cool.show();
  cool.bounce();
  cool.move();
  
 
}




class Ball
{
  int x,y;
  boolean Up, Right;
  Ball()
  {
   
    x= 250;
    y= 0;
   boolean Up= false;
   boolean Right= true ;
  }
  void show()
{
 
  fill(0,255,255);

  ellipse(x,y,30,30);

}
  void bounce()
{
  if(get(x,y+16) == color(255))
  {
    Up=true;
  }
  if(y==500)
  {
    Up=true;
  }
  
  if(x==0)
  {
    Right=true;
  }
  if(x==600)
  {
    Right=false;
  }
    
// if(get(x,y)y>499)
// {
//   Up=true;
// }
  if(y==0)
  {
    Up=false;
  }
  }
  void move()
  {
    if(Right== true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
    if(Up== true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
  }
}

class Paddle
{
   int x,y;
  boolean left, right;
  Paddle()
  {
   
    x= 100;
    y= 480;
   boolean left= false;
   boolean right= true ;
  }
  void show()
  {
    fill(255);
    rect(x,y,100,50);
  }
  void move()
  {
    
    if(x>495)
    {
      x=500;
    }
    if(x<0)
{
  x=0;
  }

if( keyPressed== true && key=='a')
  {
   x=x-10;
  }
  if( keyPressed==true && key=='d')
  {
    x=x+10;
  }

  }
  }
