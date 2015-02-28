
//Sarah C, CP1 16/17, TRON

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
  size(500, 500);
  background(0);
  textAlign(CENTER);
  textSize(40);
}

void draw()
{
  obstacles();

  if (gameOver == true)
  {
    fill(234, 5, 5, 2);
    rect(0, 0, 500, 500);    
    text("GAME OVER", 250, 250);
  }
  if (youWin == true)
  {
    text("YOU WIN", 250,250);
  }

  if (get(x, y) != color(0, 0, 0)) //it crashed!
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

void keyPressed() //user input "wasd"
{
  if (key == 'd')
  {
    dir = RIGHT;
  }
  else if (key == 'a')
  {
    dir = LEFT;
  }
  else if (key == 'w')
  {
    dir = UP;
  }
  else if (key == 's')
  {
    dir = DOWN;
  }
}

void mouseClicked() //restart the game
{
  gameOver = false;
  youWin = false;
  background(0);
  x = 30;
  y = 250;
  dir = RIGHT;
  compx = 469;
  compy = 245;
  compdir = LEFT;
}

void human()
{
  //directions
  stroke(126, 228, 255);
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

void obstacles()
{
  stroke(234, 5, 5);
  noFill();
  rect(80, 20, 110, 100);
  rect(60, 80, 80, 90);
  rect(300,50,35,80);
  rect(240, 400, 80, 50);
  rect(260,420,90,70);
  rect(60, 300, 90, 270);
  rect(170,280,60,60);
}

void computer()
{ 
  stroke(200,130,100);
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



