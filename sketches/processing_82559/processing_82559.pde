
//Jordan Leung 4,5 Computer Programming 

Ball cool; 
int t= 1;
void setup()
{
 
  size(500,500);
  cool= new Ball();
}

void draw()
{
  background(0);
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

  ellipse(x,y,40,40);

}
  void bounce()
{
  if(x<0)
  {
    Right=true;
  }
  if(x>499)
  {
    Right=false;
  }
  if(y<0)
  {
    Up=true;
  }
  if(y>499)
  {
    Up=false;
  }
  
}
  void move()
  {
    if(Right== true)
    {
      x=x+4;
    }
    else
    {
      x=x-5;
    }
    if(Up== true)
    {
      y=y+5;
    }
    else
    {
      y=y-5;
    }
  }
}
