
//Hannah Abdel, CP1, Mods 4-5, tron
int x;
int y;
int direction = RIGHT;
int compX = 130;
int compY = 130;
int compDir = LEFT;
boolean gameOver = false;
void setup()
{
  x = 150;
  y = 150;
  size(300,300);
  background(0);
}
void draw()
{
  if (gameOver == true)
  {
    text("GAME OVER!", 100,150);
  }
  else
 {
   human();
 computer();
 }
}
void human()
{
 stroke(0,255,0);
  if(get(x,y) !=color (0,0,0))
  {
    gameOver = true;
  }
  else
  {
    point(x,y);
    if(direction == RIGHT)
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
    else if(direction == DOWN)
    {
      y++;
    }
  }
}

void keyPressed()
{
  if (key== 'a')
  {
    direction = LEFT;
  }
  else if (key =='d')
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
void computer()
{
  stroke(20,18,222);
  point(compX, compY);
  if (compDir == LEFT)
  {
    compX--;
    if(get(compX-1, compY) != color(0,0,0))
    {
      compDir = UP;
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if(get(compX,compY+1) !=color (0,0,0))
    compDir = LEFT;
  }

  else if (compDir == UP)
{
  compY--;
  if(get(compX, compY-1) !=color (0,0,0))
  {
    compDir = RIGHT;
  }
}
  else if (compDir == RIGHT)
  {
    compX++;
    if(get(compX+1,compY) !=color(0,0,0))
    {
      compDir = DOWN;
    }
    if(get(compX,compY) !=color(0,0,0))
    {
      gameOver = true;
      text("YOU WON!", 200,150);
    }
  }
}


  
  
    


