
// Joe Liang, 11/5/12, Mods 14/15
int x = 100;
int y = 100;
int direction = RIGHT;
int Compx = 300;
int Compy = 100;
int Compdirection = LEFT;
boolean gameOver = false;
void setup()
{
  size(400, 400);
  background(0);
}
void draw()
{
   
  if ( gameOver == true)
  {

    text("GAME OVER", 250,250);
    direction = 0;
  }
   else
   {
     human();
     computer();
   }
 
    
  }
void human()
{
 if(get(x, y) != color (0))
  {
    gameOver= true;
   }
  
   stroke(255);
   point(x, y);
  
    
    if (direction == RIGHT)
    {
      x++;
    }
    else if(direction == LEFT)
    {
      x--;
    }
    else if(direction == UP)
    {
      y--;
    }
    else if(direction == DOWN)
    {
      y++;
    }
}
void computer()
{
  if(get(Compx, Compy) != color (0))
  {
    gameOver= true;
   }
  
   stroke(255);
   point(Compx, Compy);
  
    
    if (Compdirection == RIGHT)
    {
      Compx++;
      if(get(Compx+1,Compy) !=color(0,0,0))
      {
        Compdirection=UP;
        //if(get(Compx,Compy+1) !=color(0,0,0))
        //{
          //Compdirection=DOWN;
        //}
        
      }
    }
    else if(Compdirection == LEFT)
    {
      Compx--;
      if(get(Compx-1,Compy) !=color(0,0,0))
      {
        Compdirection=DOWN;
      }
    }
    else if(Compdirection == UP)
    {
      Compy--;
      if(get(Compx,Compy-1) !=color(0,0,0))
      {
          Compdirection=LEFT;
        }
       
      
    }
    else if(Compdirection == DOWN)
    {
      Compy++;
      if(get(Compx,Compy+1) !=color(0,0,0))
      {
        Compdirection=RIGHT;
        
      }
    }
}
  

void keyPressed()
{
  if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key=='d')
  {
    direction = RIGHT;
  }
  else if (key == 'w')
  {
    direction = UP;
  }
  else if(key == 's')
  {
    direction = DOWN;
  }
}
