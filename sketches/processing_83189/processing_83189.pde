
//Sarah C CP1 16/17 Pong

Ball fluffy;
Ball echo;
paddle solstice;
void setup()
{
  size(500,500); 
  frameRate(95);
  solstice = new paddle();
  fluffy = new Ball();
  echo = new Ball();
  echo.x = 320;
  echo.y = 50;
}
void draw()
{
  background(0);
  solstice.show();
  solstice.move();
  fluffy.show();
  fluffy.move();
  fluffy.bounce();
  echo.show();
  echo.move();
  echo.bounce();
 
}

class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
   x = 80;
   y = 300;
   up = false;
   right = true;
  }
  void show()
  {
    noStroke();
    fill(255,200,200);
    ellipse(x,y,10,10);
  }
  void move()
  {
    if(up == false && right == true)
    {
    x++;
    y++;
    }
    else if (up == true && right == true)
    {
      x++;
      y--;
    }
    else if (up == true && right == false)
    {
      x--;
      y--;
    }
    else if(up == false && right == false)
    {
      x--;
      y++;
    }
  }
  void bounce()
  {    
    if(x + 10 > 500)
    {
      right = false;
    }
    else if(y - 10 < 0)
    {
      up = false;     
    }
    else if (x - 10 < 0)
    {     
      right = true;
    }  
     else if(get(x,y + 6) != color(0,0,0))
    {
      up = true;     
    }
 }     
}

class paddle
{
  int px;
  paddle()
  {
    px = 320;
  }
  void show()
  {
    fill(189,234,234);
    rect(px,450,65,15);
  }
  void move()
  {
    if (keyPressed == true && keyCode == RIGHT)
    {
      px++;
    }
    if (keyPressed == true && keyCode == LEFT)
    {
      px--;
    }
  }
 
}


