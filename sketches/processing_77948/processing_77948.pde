
// Lucky Wen, TRON, CP1 mods 16-17


int x= 50;
int y=250;
int direction=RIGHT;
int compX = 445;
int compY = 250;
int compDir = LEFT;
int rand;
boolean gameOver = false;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(50000);
}
void draw()
{
  if (gameOver ==true)
  {
    smooth();
    textSize(50);
    textAlign(CENTER);
    text ("GAME OVER", 250, 250);
  }
  else
  {
    human();
    if (gameOver ==false)
    {
      computer();
    }
  }
}
void human()
{
  if (get(x, y) != color (0, 0, 0))
  {
    smooth();
    textSize(35);
    textAlign(CENTER);
    text ("HUMAN LOSES", 250, 350);
    gameOver =true;
  }




  else 

  {
    stroke(100, 0, 255);
    point(x, y);
    if (direction==RIGHT)
    {
      x++;
    }
    else if (direction ==LEFT)
    {
      x--;
    }
    else if (direction== UP)

    {
      y--;
    }
    else if (direction==DOWN)
    {

      y++;
    }
  }
}
void keyPressed()
{
  if (key== 'a')
  { 
    direction= LEFT;
  }
  else if (key=='d')
  {
    direction= RIGHT;
  }
  else if (key == 'w')
  {
    direction= UP;
  }
  else if (key=='s')
  {
    direction=DOWN;
  }
}

void computer()
{
  if (get(compX, compY) != color (0, 0, 0))
  {
    smooth();
    textSize(35);
    textAlign(CENTER);
    text ("COMPUTER LOSES", 250, 350);
    gameOver =true;
  }
  else 
  {
    stroke(255, 0, 255);
    point(compX, compY);

    // going right
    if (compDir==RIGHT)
    {
      compX++;

      if (get(compX+1, compY) != color (0, 0, 0))
      {
        if (get(compX, compY+1) != color (0, 0, 0))
        {
          compDir = UP;
        }
        else if (get(compX, compY-1) != color(0, 0, 0))
        {
          compDir= DOWN;
        }
        else
        {
          rand = int(random(2));
          if (rand == 0)
          {
            compDir = DOWN;
          }
          else if (rand == 1)
          {
            compDir = UP;
          }
        }
      }
    }
    // going left
    else if (compDir==LEFT)
    {
      compX--;

      if (get(compX-1, compY) != color (0, 0, 0))
      {
        if (get(compX, compY-1) != color (0, 0, 0))
        {
          compDir = DOWN;
        }
        else if (get(compX, compY +1) != color(0, 0, 0))
        {
          compDir = UP;
        }
        else 
        {
          rand = int(random(2));
          if (rand == 0)
          {
            compDir = UP;
          }
          else if (rand == 1)
          {
            compDir = DOWN;
          }
        }
      }
    }
    // going up
    else if (compDir== UP)
    {
      compY--;
      if (get(compX, compY-1) != color (0, 0, 0))
      {
        if (get(compX+1, compY) != color (0, 0, 0))
        {
          compDir = LEFT;
        }
        else if (get(compX-1, compY) != color (0, 0, 0))
        {
          compDir = RIGHT;
        }

        else
        {
          rand = int(random(2));
          if (rand == 0)
          {
            compDir= RIGHT;
          }
          else if (rand == 1)
          {
            compDir = LEFT;
          }
        }
      }
    }

    // going down
    else if (compDir==DOWN)
    {

      compY++;
      if (get(compX, compY+1) != color (0, 0, 0))
      {
        if (get(compX-1, compY) != color (0, 0, 0))
        {
          compDir = RIGHT;
        }

        else if (get(compX+1, compY) != color (0, 0, 0))
        {
          compDir = LEFT;
        }

        else
        {
          rand = int(random(2));
          if (rand == 0)
          {
            compDir = LEFT;
          }
          else if (rand == 1)
          {
            compDir = RIGHT;
          }
        }
      }
    }
  }
}



