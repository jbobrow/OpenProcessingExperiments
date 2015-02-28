
//DiTang, TRON, 14-15, CP1
int x = 10;
int y = 150;
int direction = RIGHT;
int compX = 250;
int compY = 250;
int compDir = LEFT;
boolean gameOver = false;

void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
  stroke(0,125,255);
  if(get(x,y) != color(0)) 
  {
    textSize(50);
    textAlign(CENTER);
    text("GG NO RE!", 250, 250);
    
  }
  if(get(compX,compY) != color(0)) 
  {
    textSize(25);
    textAlign(CENTER);
    text("YOU ARE SMARTER THAN A COMPUTER!~", 250, 250);
    gameOver = true;
  }
 else
 {
   human();
   if (gameOver == false)
   {
     computer();
   }
 }
}

void human()
{
    point(x,y);
    if (direction == RIGHT)
    {
     x++;
    }
   else if (direction == LEFT)
   {
     x--;
   }
   else if (direction == UP)
   {
     y--;
   }
   else if (direction == DOWN)
   { 
     y++;
   }
   else if (direction == RIGHT)
   {
     direction = RIGHT;
   }
}

void computer()
{
  stroke(250,0,0);
  point(compX,compY);
  if(compDir == LEFT)
  {
    compX--;
    if(get(compX-1,compY) !=color (0))
    {
      compDir = DOWN;
    }
  }
  if(compDir == DOWN)
  {
    compY++;
    if(get(compX,compY+1) !=color (0))
    {
      compDir = RIGHT;
    }
  }
  if(compDir == RIGHT)
  {
    compX++;
    if(get(compX+1,compY) !=color (0))
    {
      compDir = UP;
    }
  }
  if(compDir == UP)
  {
    compY--;
    if(get(compX,compY-1) !=color (0))
    {
      compDir = LEFT;
    }
  }
}


void keyPressed()
{
  if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == 'd' )
  {
    direction = RIGHT;
  }
  else if (key == 'w')                                                                                                                                                                                                                           
  {
    direction = UP;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
}
