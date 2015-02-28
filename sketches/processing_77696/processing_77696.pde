
/* @pjs globalKeyEvents= "true"; */

int x= 20;
int y= 250;
int direction= RIGHT;
int compx= 480;
int compy= 250;
int compdirection= LEFT;
boolean gameOver= true;

void setup()
{
  size(500, 500);
  background(0);
  frameRate(100);
}

void draw()
{
  noFill();
  stroke(255, 0, 0);
  rect(0, 0, 499, 499);
  if (gameOver==false)
  {
    human();
  }
  if (gameOver==false)
  {
    computer();
  }
  if (keyPressed == true && key == 'r')
  {
    background (0);
    gameOver=false;
  }

}

void human()
{
  if (get(x, y) != color (0))
  {
    gameOver=true;
    background(255);
    fill(0);
    textSize(24);
    text("GAME OVER, COMPUTER WINS", 60, 250);
    text("Press 'r' to restart the game", 70,275);
  }
  stroke(257, 222, 0);
  point(x, y);
  if (direction== RIGHT)
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
}

void keyPressed()
{
  if (key== 'w')
  {
    direction = UP;
  }
  else if (key== 'a')
  {
    direction = LEFT;
  }
  else if (key== 's')
  {
    direction = DOWN;
  }
  else if (key== 'd')
  {
    direction = RIGHT;
  }
  if (key=='r')
  {
    background(0);
    gameOver=false;
    direction=RIGHT;
    compdirection=LEFT;
    x= 20;
    y= 250;
    compx= 480;
    compy= 250;
  }
}

void computer()
{
  if (get(compx, compy) != color(0))
  {
    gameOver=true;
    background(255);
    fill(0);
    textSize(24);
    text("GAME OVER, COMPUTER LOSES", 60, 250);
    text("Press 'r' to restart the game", 70,275);
  }
  stroke(0, 255, 0);
  point(compx, compy);
  if (compdirection== RIGHT)
  {
    compx++;
    if (get(compx+1, compy) != color (0))
    {
      compdirection= DOWN;
    }
  }
  else if (compdirection == LEFT)
  {
    compx--;
    if (get(compx-1, compy) != color (0))
    {
      compdirection= UP;
    }
  }
  else if (compdirection == UP)
  {
    compy--;
    if (get(compx, compy-1) != color(0))
    {
      compdirection = RIGHT;
    }
  }
  else if (compdirection == DOWN)
  {
    compy++;
    if (get(compx, compy+1) != color(0))
    {
      compdirection= LEFT;
    }
  }
}
