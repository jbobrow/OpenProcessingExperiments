
//alan c 14/15 computer tron 
int x = 30;
int y = 250;
int dir = RIGHT;
int compx = 469;
int compy = 245;
int compdir = LEFT;
boolean youWin = false;
boolean gameOver = false;
void setup()
{
  size(500,500);
  background(0);
  textAlign(CENTER);
  textSize(40);

}
 
void draw()
{

 
  if (gameOver == true)
  {
    fill(20,156,200,5);
    rect(0, 0, 500,500);   
    text("LOSER!!!!!", 250, 250);
  }
  if (youWin == true)
  {
    text("WINNER!!!!", 250,250);
  }
 
  if (get(x, y) != color(0, 0, 0)) 
  
  //crashed
  {
    gameOver = true;
  }
  else if (get(compx,compy) != color(0))
  {
    youWin = true;
  }
  else
  {
    human();
    computer();
  }
}
 
void keyPressed() 

//user input 6485
{
  if (key == '6')
  {
    dir = RIGHT;
  }
  else if (key == '4')
  {
    dir = LEFT;
  }
  else if (key == '8')
  {
    dir = UP;
  }
  else if (key == '5')
  {
    dir = DOWN;
  }
}
 
void mouseClicked() 

//restart the game
{
  gameOver = false;
  youWin = false;
  background(0);
  x = 30;
  y = 250;
  dir = RIGHT;
  compx = 400;
  compy = 200;
  compdir = LEFT;
}
 
void human()
{
  //directions
  stroke(15, 228, 20);
  point(x, y);
  if (dir == RIGHT)
  {
    x++;
  }
  else if (dir == LEFT)
  {
    x--;
  }
  else if (dir == DOWN)
  {
    y++;
  }
  else if (dir == UP)
  {
    y--;
  }
}
 

 
void computer()
{
  stroke(240,7,200);
  point(compx, compy);
  if (compdir == LEFT)
  {
    compx--;
    if (get(compx - 1, compy) != color(0))
    {
      compdir = DOWN;
    }
  }
  else if (compdir == RIGHT)
  {
    compx++;
    if (get(compx + 1, compy) != color(0))
    {
      compdir = UP;
    }
  }
   
  else if (compdir == DOWN)
  {
    compy++;
    if (get(compx, compy + 1) != color(0))
    {
      compdir = RIGHT;
    }
  }
  else if (compdir == UP)
  {
    compy--;
    if (get(compx, compy - 1) != color(0))
    {
      compdir = LEFT;
    }
  }
}
