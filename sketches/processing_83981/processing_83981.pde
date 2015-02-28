
//David Avetisyan, CP1, (4/5)
Ball bally;
Paddle pongy;
int t= 1;
int p=255;
void setup()
{
  smooth();
  size(600,500);
  bally= new Ball();
  pongy= new Paddle();
}
 
void draw()
{
  background(0);
  pongy.show();
  pongy.move();
  bally.show();
  bally.bounce();
  bally.move();
   
  
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
  
  fill(255,255,255);
 
  ellipse(x,y,20,20);
 
}
  void bounce()
{
  if(get(x,y+16) == color(0,255,0))
  {
    Up=true;
   p=-10;
  }
  if(y>500)
  {
    x=250;
    y=0;

  }
   
  if(x==0)
  {
    Right=true;
  }
  if(x==600)
  {
    Right=false;
  }

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
   
    fill(0,255,0);
    rect(x,y,100,25);
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
 if (keyPressed==true && key=='r')
 {

 }
  }
  }


