
//Victor Murillo, CP1 mods 16-17, Tron

int x = 10;
int y = 250;
int direction = RIGHT;
int humx = 490;
int humy = 250;
int humdir = LEFT;
boolean gameover = false;
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
  if (gameover == true)
  {
    
    text("GAME OVER", 200, 250);
  }
  else
  {
    playerone();
    playertwo();
  }
}
void playerone()  //PLAYER 1
{
  if (get(x, y)!= color(0))
  {
    text("PLAYER 1 LOSES",200,280);
    gameover = true;
  }
  stroke(255, 0, 0);
  point(x, y);
  if (direction == LEFT)
  {
    x--;
  }
  else if (direction == DOWN)
  {
    y++;
  }
  else if (direction == RIGHT)
  {
    x++;
  }
  else if (direction == UP)
  {
    y--;
  }
}
void playertwo()
{
  if(get(humx,humy) != color(0))
  {
    text("PLAYER 2 LOSES",200,280);
    gameover = true;
  }
  stroke(0,0,255);
  point(humx,humy);
  if(humdir == LEFT)
  {
    humx--;
  }
  else if(humdir == DOWN)
  {
    humy++;
  }
  else if(humdir == RIGHT)
  {
    humx++;
  }
  else if(humdir == UP)
  {
    humy--;
  }
}
void keyPressed()
{
  if (key == 'a')    //PLAYER 1 CONTROLS
  {
    direction = LEFT;
  }
  else if (key == 's')
  {
    direction = DOWN;
  } 
  else if (key == 'd')
  {
    direction = RIGHT;
  } 
  else if (key == 'w')
  {
    direction = UP;
  }

  if (key =='j') // PLAYER 2 CONTROLS
  {
    humdir = LEFT;
  }
  else if (key == 'k')
  {
    humdir = DOWN;
  }
  else if (key == 'l')
  {
    humdir = RIGHT;
  }
  else if (key == 'i')
  {
    humdir = UP;
  }
  else if (key == 'r') //RESTART
  {
    gameover = false;
    background(0,0,0);
    x= 20;
    y = 250;
    direction = RIGHT;
    humx = 490;
    humy = 250;
    humdir = LEFT;
  }
}
void mousePressed()
{
  if(mousePressed == true)
  {
    gameover = false;
    background(0);
    x = 20;
    y = 250;
    direction = RIGHT;
    humx = 490;
    humy = 250;
    humdir = LEFT;
  }
}
