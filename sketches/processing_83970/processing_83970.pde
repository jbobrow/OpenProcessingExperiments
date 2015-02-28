
ball ball;
paddle paddle;
boolean gameover = false;
void setup()
{
  size(600,600);
  ball = new ball();
  paddle = new paddle();
}
void draw()
{
  if(gameover == false) 
  {
    background(0);
  }
  else
  {
    background(0,0,255);
  }
   paddle.move();
  paddle.show();
  ball.move();
  ball.bounce();
  ball.show();
 
}
class ball
{
  int x,y;
  boolean up,right;
  ball()
  {
    x = int (random(600));
    y = int (random(600));
    up = true;
    right = true;
  }
  void move()
  {
    if(up == true)
    {
      y= y-10;
    }
    if(right == true)
    {
      x=x+10;
    }
    if (up == false)
    {
      y=y+10;
    }
    if (right == false)
    {
      x=x-10;
    }
  }
  void bounce()
  {
    if( y>=574)
    {

      //up = true;
      gameover=true;
    }
     if (y<=0)
    {
      up = false;
    }
    else if (x>=600)
    {
      right = false;
    }
    else if (x<=0)
    {
      right = true;
    }
    else if (get(x,y+26) != color(0))
    {
      println("up");
      up = true;
    }
    
    

  }
  void show()
  {
    fill(0,255,0);
    ellipse(x,y,50,50);
  }   
}
class paddle
{
  int z=50;
  void move()
  {
    if(keyPressed==true && key=='a')
    {
      z=z-10;
    }
    if(keyPressed==true && key=='d')
    {
      z=z+10;
    }
  }
  void show()
  {
    fill(255,0,0);
    rect(z,520,100,20);
  }
}
