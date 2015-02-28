
//Kitty Kwan, mods 4/5, 8/29/12, Tron
/* @pjs globalKeyEvents="true";*/
int x=299;
int y=150;
int playeraX=0;
int playeraY=150;
int direction=LEFT;
int playeraDirection=RIGHT;
boolean gameOver=false;
void setup ()
{
  size (300, 300);
  background (0);
}

void draw ()
{
  stroke (255);
  if (get(x, y) !=color (0))
  {
    fill (255, 0, 0);
    textSize (22);
    text ("Game Over: Player 2 loses", 20,100);
    gameOver=true;
    
  
  }
  if (get(playeraX, playeraY) !=color (0))
  {
    fill (255, 0, 0);
    textSize (22);
    text ("Game Over: Player 1 loses",20,100);
    gameOver=true;
    
  }
  else if (gameOver==false)
  {
    human ();
    playera ();
  }
  }


void keyPressed ()
{
  if (keyCode==UP || keyCode==DOWN || keyCode==LEFT|| keyCode==RIGHT)
  {
    direction=keyCode;
  }
    if (key=='a' && playeraDirection !=RIGHT)
  {
    playeraDirection=LEFT;
  }
  else if (key=='d' && playeraDirection!=LEFT)
  {
    playeraDirection=RIGHT;
  }
  else if (key=='w'&& playeraDirection !=DOWN)
  {
    playeraDirection=UP;
  }
  else if (key== 's' && playeraDirection !=UP)
  {
    playeraDirection=DOWN;
  }
}
  
  
void human ()
{ point (x, y);
    if (direction==RIGHT)
    {
      x++;
    }
    else if (direction==LEFT )
    {
      x--;
    }
    else if (direction==UP)
    {
      y--;
    }
    else if (direction==DOWN)
    {
      y++;
    }
  }
  
  
  
 void playera ()
 {
   stroke (0,0,255);
    point (playeraX, playeraY);
    if (playeraDirection==RIGHT )
    {
      playeraX++;
    }
    else if (playeraDirection==LEFT)
    {
      playeraX--;
    }
    else if (playeraDirection==UP)
    {
      playeraY--;
    }
    else if (playeraDirection==DOWN)
    {
      playeraY++;
    }
   
 }
