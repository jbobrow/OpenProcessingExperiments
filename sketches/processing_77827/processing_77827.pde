
// Hanson T., Comp Prog 1 16/17, Tron
int x = 0;
int y = 250;
int direction = RIGHT;
int compX = 490;
int compY = 250;
int compA = 250;
int compB = 0;
int compC = 150;
int compD = 490;
int compDir = LEFT;
int compDir1 = DOWN;
int compDir2 = UP;
boolean gameOver = false;
PImage GG;
PImage G;
void setup()
{
  size(500, 500);
  background(0);
  GG = loadImage("images.jpg");
  G = loadImage("images1.jpg");
}
void draw()
{
  if (gameOver == true)
  {
    textSize(75);
    image(G, 50, 50, 415, 350);
  }
  else
  {
    human();
    computer1();
    computer2();
    computer3();
  }
}
void keyPressed()
{
  if (keyCode == UP)
  {
    direction = UP;
  }
  if (keyCode == DOWN)
  {
    direction = DOWN;
  }
  if (keyCode == LEFT)
  {
    direction = LEFT;
  }
  if (keyCode == RIGHT)
  {
    direction = RIGHT;
  }
  if (key == 'r')
  {
    background(0);
    gameOver = false;
    x = 0;
    y = 250;
    direction = RIGHT;
    compX = 490;
    compY = 250;
    compA = 250;
    compB = 0;
    compC = 150;
    compD = 490;
    compDir = LEFT;
    compDir1 = DOWN;
    compDir2 = UP;
  }
}
  void human()
  {
    if (get(x, y) != color(0, 0, 0))
    {
      gameOver = true;
      image(GG, 50, 50, 415, 350);
    }
    if (keyPressed == true && key == 'x')
    {
      frameRate(500);
    }
    stroke(255, 255, 255);
    point(x, y);
    if (direction == RIGHT)
    {
      x++;
    }
    if (direction == LEFT)
    {
      x--;
    }
    if (direction == UP)
    {
      y--;
    }
    if (direction == DOWN)
    {
      y++;
    }
  }
  void computer1()
  {
    if (get(compX, compY) != color(0, 0, 0))
    {
      image(G, 50, 50, 415, 350);
      gameOver = true;
    }
    stroke(255, 0, 0);
    point(compX, compY);
    if (compDir == RIGHT)
    {
      compX++;
      if (get(compX+1, compY) != color(0, 0, 0))
      {
        compDir = UP;
      }
    }
    if (compDir == LEFT)
    {
      compX--;
      if (get(compX-1, compY) != color(0, 0, 0))
      {
        compDir = DOWN;
      }
    }
    if (compDir == UP)
    {
      compY--;
      if (get(compX, compY-1) != color(0, 0, 0))
      {
        compDir = LEFT;
      }
    }
    if (compDir == DOWN)
    {
      compY++;
      if (get(compX, compY+1) != color(0, 0, 0))
      {
        compDir = RIGHT;
      }
    }
  }
  void computer2()
  {
    if (get(compA, compB) != color(0, 0, 0))
    {
      image(G, 50, 50, 415, 350);
      gameOver = true;
    }
    stroke(0, 255, 0);
    point(compA, compB);
    if (compDir1 == RIGHT)
    {
      compA++;
      if (get(compA+1, compB) != color(0, 0, 0))
      {
        compDir1 = UP;
      }
    }
    if (compDir1 == LEFT)
    {
      compA--;
      if (get(compA-1, compB) != color(0, 0, 0))
      {
        compDir1 = DOWN;
      }
    }
    if (compDir1 == UP)
    {
      compB--;
      if (get(compA, compB-1) != color(0, 0, 0))
      {
        compDir1 = LEFT;
      }
    }
    if (compDir1 == DOWN)
    {
      compB++;
      if (get(compA, compB+1) != color(0, 0, 0))
      {
        compDir1 = RIGHT;
      }
    }
  }

  void computer3()
  {
    if (get(compC, compD) != color(0, 0, 0))
    {
      image(G, 50, 50, 415, 350);
      gameOver = true;
    }
    stroke(0, 0, 255);
    point(compC, compD);
    if (compDir2 == RIGHT)
    {
      compC++;
      if (get(compC+1, compD) != color(0, 0, 0))
      {
        compDir2 = UP;
      }
    }
    if (compDir2 == LEFT)
    {
      compC--;
      if (get(compC-1, compD) != color(0, 0, 0))
      {
        compDir2 = DOWN;
      }
    }
    if (compDir2 == UP)
    {
      compD--;
      if (get(compC, compD-1) != color(0, 0, 0))
      {
        compDir2 = LEFT;
      }
    }
    if (compDir2 == DOWN)
    {
      compD++;
      if (get(compC, compD+1) != color(0, 0, 0))
      {
        compDir2 = RIGHT;
      }
    }
  }
