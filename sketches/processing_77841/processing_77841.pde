
int x = 10;
int y = 250;
int ox = 10;
int oy = 350;
int odirection = RIGHT;
int direction = RIGHT;
int compX = 490;
int compY = 250;
int compDir = LEFT;
boolean gameOver = false;
boolean gameOver1 = false;
boolean compLoses = false;
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  stroke (255);
  if (gameOver1 == true )
  {
    textSize(30);
    textAlign(CENTER);
    text("OTHER GUY LOSES", 250, 250);
  }
  if (gameOver == true)
  {
    textSize(40);
    textAlign(CENTER);
    text("HUMAN LOSES", 250, 250);
  }
  if (compLoses == true)
  {
    textSize(40);
    textAlign(CENTER);
    text("COMPUTER LOSES", 250, 250);
  }
  else 
  {
    if (gameOver1 == false && compLoses == false)
    {
      human();
    }
    if (gameOver == false && gameOver1 == false)
    {
      computer();
    }
    if (gameOver == false && compLoses == false)
    {
      human1();
    }
  }
}

void human ()
{
  if (get(x, y) != color(0, 0, 0))
  {
    gameOver = true;
  }
  else
  {
    point(x, y);
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
  }
}

void human1()
{
  if (get(ox, oy) != color(0, 0, 0))
  {
    gameOver1 = true;
  }
  else
  {
    stroke(0, 255, 0);
    point(ox, oy);
    if (odirection == RIGHT)
    {
      ox++;
    }
    else if (odirection == LEFT)
    {
      ox--;
    }
    else if (odirection == UP)
    {
      oy--;
    }
    else if (odirection == DOWN)
    {
      oy++;
    }
  }
}

void computer()
{
  if (get(compX, compY) != color(0, 0, 0))
  {
    compLoses = true;
  }
  else
  {
    stroke(255, 0, 0);
    point(compX, compY);

    // Going to the right
    if (compDir == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) !=color(0))
      {
        if (get(compX, compY+1)==color(0) && get(compX, compY-1)==color(0))
        {
          int p = int (random(0, 2));
          if (p==0)
          {
            compDir = DOWN;
          }
          if (p==1)
          {
            compDir = UP;
          }
        }
        else 
        {
          if (get(compX, compY-1) !=color(0))
          {
            compDir = DOWN;
          }
          if (get(compX, compY+1) != color(0))
          {
            compDir = UP;
          }
        }
      }
    }

      //Going Left
      if (compDir == LEFT)
      {
        compX--;
        if (get(compX-1, compY) !=color(0))
        {
          if (get(compX, compY-1)==color(0) && get(compX, compY+1)==color(0))
          {
            int o = int(random(0));
            if (o==0)
            {
              compDir = UP;
            }
            if (o==1)
            {
              compDir=DOWN;
            }
          }
          else
          {
            if (get(compX, compY+1) !=color(0))
            {
              compDir = UP;
            }
            if (get(compX, compY-1) != color(0))
            {
              compDir = DOWN;
            }
          }
        }
      }

      // going up
      if (compDir == UP)
      {
        compY--;
        if (get(compX, compY-1) !=color(0))
        {
          if (get(compX-1, compY)==color(0) && (get(compX+1, compY) == color(0)))
          {
            int i = int(random(0, 2));
            if (i==0)
            {
              compDir =RIGHT;
            }
            if (i==1)
            {
              compDir=LEFT;
            }
          }
          else 
          {
            if (get(compX-1, compY) !=color(0))
            {
              compDir = RIGHT;
            }
            if (get(compX+1, compY) != color(0))
            {
              compDir = LEFT;
            }
          }
        }
      }

      //Going down
      if (compDir == DOWN)
      {
        compY++;
        if (get(compX, compY+1) != color(0))
        {
          if (get(compX+1, compY) == color(0) && (get(compX-1, compY) == color(0)))
          {
            int u = int(random(0, 2));
            if (u==0)
            {
              compDir = LEFT;
            }
            if (u==1)
            {
              compDir = RIGHT;
            }
          }
          else
          {
            if (get(compX+1, compY) !=color(0))
            {
              compDir = LEFT;
            }
            if (get(compX-1, compY) != color(0))
            {
              compDir = RIGHT;
            }
          }
        }
      }
    }
}

    void keyPressed()
    {
      if (key =='a')
      {
        direction = LEFT;
      }
      else if (key == 'd')
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
      if (key =='4')
      {
        odirection = LEFT;
      }
      else if (key == '6')
      {
        odirection = RIGHT;
      }
      else if (key == '8')
      {
        odirection = UP;
      }
      else if (key == '5')
      {
        odirection = DOWN;
      }
    }
