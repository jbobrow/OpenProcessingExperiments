
//Alina V, CP1 mods 16,17, Tron
int x = 10;
int y = 10;
int compX = 390;
int compY = 10;
int direction = RIGHT;
int compDir = LEFT;
boolean gameOver1 = false;
boolean gameOver2 = false;
void setup()
{
  size(400, 400);
  background(0);
  strokeWeight(7);
  noFill();
  stroke(245, 202, 44);
  rect(0, 0, 400, 400);
  int a = 1;
  while (a < 26)
  {
      strokeWeight(3);
      stroke(173, 134, 201 );
    rect(int(random(20, 380)), int(random(20, 380)), 10, 10);
    a++;
  }
}
void draw()
{
  if (gameOver1 == true)
  {
    textAlign(CENTER);
    textSize(48);
    text("You Lost!", 200, 200);
  }
  else if (gameOver2 == true)
  {
    textAlign(CENTER);
    textSize(48);
    text("You Won!", 200, 200);
  } 
  else
  {
    human();
    computer();
  }
}
void human()
{
  if (get(x, y) != color(0))
  {
    gameOver1 = true;
  }
  else 
  {
    strokeWeight (1);
//    stroke(211, 125, 19);
stroke(255,0,0);
    point(x, y);
    if (direction == RIGHT)
    {
      x++;
    }
    else if (direction == LEFT)
    {
      point(x, y);
      x--;
    }
    else if (direction == UP)
    {
      point(x, y);
      y--;
    }
    else if (direction == DOWN)
    {
      point(x, y);
      y++;
    }
  }
}
void keyPressed()
{
  if (key == 'd')
  {
    direction = RIGHT;
  }
  else if (key == 'a')
  {
    direction = LEFT;
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
  if (get(compX, compY) != color(0))
  {
    gameOver2 = true;
  }
  else 
  {
    stroke (44, 245, 230);
    point (compX, compY);
    if (compDir == LEFT)
    {
      compX--;
      if (get(compX-1, compY) != color (0))
      {
        compDir = DOWN;
      }
    }
    else if (compDir == RIGHT)
    {
      compX++;
      if (get(compX + 1, compY) != color(0))
      {
        compDir = UP;
      }
    }
    else if (compDir == DOWN)
    {
      compY++;
      if (get(compX, compY + 1) != color(0))
      {
        compDir = RIGHT;
      }
    }
    else if (compDir == UP)
    {
      compY--;
      if (get(compX, compY - 1) != color(0))
      {
        compDir = LEFT;
      }
    }
  }
}
