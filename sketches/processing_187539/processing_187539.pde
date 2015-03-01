
Block[][] grille = new Block[8][8];

PImage b2;
PImage b4;
PImage b8;
PImage b16;
PImage b32;
PImage b64;
PImage b128;
PImage b256;
PImage b512;
PImage b1024;
PImage b2048;
PImage b4096;
PImage b8192;
PImage b16384;
PImage grid;
PImage empty;

int idGen = 0;

int genIndX = 0;
int genIndY = 0;

boolean moveIsLock = false;
boolean moveIsNotLock = false;

int score = 0;


void setup()
{
  size(1000, 1000);
  background(255);

  b2 = loadImage("2.png");
  b4 = loadImage("4.png");
  b8 = loadImage("8.png");
  b16 = loadImage("16.png");
  b32 = loadImage("32.png");
  b64 = loadImage("64.png");
  b128 = loadImage("128.png");
  b256 = loadImage("256.png");
  b512 = loadImage("512.png");
  b1024 = loadImage("1024.png");
  b2048 = loadImage("2048.png");
  b4096 = loadImage("4096.png");
  b8192 = loadImage("8192.png");
  b16384 = loadImage("16384.png");
  grid = loadImage("Grille.png");
  empty = loadImage("empty.png");

  for (int i = 0; i < 4; i++)
  {
    for (int j = 0; j < 4; j++)
    {
      grille[i][j] = new Block(i, j);
    }
  }

  blockGen();
}

void draw()
{
  background(0);
  for (int i = 0; i < 4; i++)
  {
    for (int j = 0; j < 4; j++)
    {
      grille[i][j].makeBlock();
    }
  }

  image(grid, 0, 0);

  score = 0;
  for (int i = 0; i < 4; i++)
  {
    for (int j = 0; j < 4; j++)
    {
      score += grille[i][j].getId();
    }
  }

  textSize(30);
  fill(255);
  stroke(50);
  text(score, 30, 30);
}

class Block {
  int id;
  int indX;
  int indY;

  Block(int x, int y)
  {
    id = 0;
    indX = x;
    indY = y;
  }

  boolean blockTest()
  {
    if (id == 0)
    {
      return false;
    } else
    {
      return true;
    }
  }

  void setId(int idGive)
  {
    id = idGive;
  }

  int getId()
  {
    return id;
  }

  int pos(int ind)
  {
    int pos = 0;
    pos = ind*200+9;

    return pos;
  }

  void makeBlock()
  {
    if (id == 0)
    {
      image(empty, pos(indX), pos(indY));
    } else if (id == 2)
    {
      image(b2, pos(indX), pos(indY));
    } else if (id == 4)
    {
      image(b4, pos(indX), pos(indY));
    } else if (id == 8)
    {
      image(b8, pos(indX), pos(indY));
    } else if (id == 16)
    {
      image(b16, pos(indX), pos(indY));
    } else if (id == 32)
    {
      image(b32, pos(indX), pos(indY));
    } else if (id == 64)
    {
      image(b64, pos(indX), pos(indY));
    } else if (id == 128)
    {
      image(b128, pos(indX), pos(indY));
    } else if (id == 256)
    {
      image(b256, pos(indX), pos(indY));
    } else if (id == 512)
    {
      image(b512, pos(indX), pos(indY));
    } else if (id == 1024)
    {
      image(b1024, pos(indX), pos(indY));
    } else if (id == 2048)
    {
      image(b2048, pos(indX), pos(indY));
    } else if (id == 4096)
    {
      image(b4096, pos(indX), pos(indY));
    } else if (id == 8192)
    {
      image(b8192, pos(indX), pos(indY));
    } else if (id == 16384)
    {
      image(b16384, pos(indX), pos(indY));
    }
  }
}

void blockGen()
{
  genIndX = int(random(4));
  genIndY = int(random(4));

  while (grille[genIndX][genIndY].blockTest () != false)
  {
    genIndX = int(random(4));
    genIndY = int(random(4));
  }

  idGen = int(random(1002));

  if (idGen>=0 && idGen<=250)
  {
    grille[genIndX][genIndY].setId(4);
  } else if (idGen > 250 && idGen <=1000)
  {
    grille[genIndX][genIndY].setId(2);
  } else if (idGen == 1001)
  {
    grille[genIndX][genIndY].setId(512);
  }
  {
  }
}

void keyReleased()
{
  if (keyCode == UP)
  {
    for (int k = 0; k < 3; k++)
    {
      for (int j = 1+k; j > 0; j--)
      {
        for (int i = 0; i < 4; i++)
        {
          if (grille[i][j-1].blockTest() == false)
          {
            grille[i][j-1].setId(grille[i][j].getId());
            if (grille[i][j].getId() != 0)
            {
              moveIsLock = false;
              moveIsNotLock = true;
            }
            grille[i][j].setId(0);
          } else
          {
            if (grille[i][j-1].getId() == grille[i][j].getId())
            {
              grille[i][j-1].setId(grille[i][j-1].getId()*2);
              if (grille[i][j].getId() != 0)
              {
                moveIsLock = false;
                moveIsNotLock = true;
              }
              grille[i][j].setId(0);
            } else
            {
              if (!moveIsNotLock)
              {
                moveIsLock = true;
              }
            }
          }
        }
      }
    }
  } else if (keyCode == DOWN)
  {
    for (int k = 2; k >= 0; k--)
    {
      for (int j = 0+k; j < 3; j++)
      {
        for (int i = 0; i < 4; i++)
        {
          if (grille[i][j+1].blockTest() == false)
          {
            grille[i][j+1].setId(grille[i][j].getId());
            if (grille[i][j].getId() != 0)
            {
              moveIsLock = false;
              moveIsNotLock = true;
            }
            grille[i][j].setId(0);
          } else
          {
            if (grille[i][j+1].getId() == grille[i][j].getId())
            {
              grille[i][j+1].setId(grille[i][j+1].getId()*2);
              if (grille[i][j].getId() != 0)
              {
                moveIsLock = false;
                moveIsNotLock = true;
              }
              grille[i][j].setId(0);
            } else
            {
              if (!moveIsNotLock)
              {
                moveIsLock = true;
              }
            }
          }
        }
      }
    }
  } else if (keyCode == RIGHT)
  {
    for (int k = 2; k >= 0; k--)
    {
      for (int i = 0+k; i < 3; i++)
      {
        for (int j = 0; j < 4; j++)
        {
          if (grille[i+1][j].blockTest() == false)
          {
            grille[i+1][j].setId(grille[i][j].getId());
            if (grille[i][j].getId() != 0)
            {
              moveIsLock = false;
              moveIsNotLock = true;
            }
            grille[i][j].setId(0);
          } else
          {
            if (grille[i+1][j].getId() == grille[i][j].getId())
            {
              grille[i+1][j].setId(grille[i+1][j].getId()*2);
              if (grille[i][j].getId() != 0)
              {
                moveIsLock = false;
                moveIsNotLock = true;
              }
              grille[i][j].setId(0);
            } else
            {
              if (!moveIsNotLock)
              {
                moveIsLock = true;
              }
            }
          }
        }
      }
    }
  } else if (keyCode == LEFT)
  {
    for (int k = 0; k < 3; k++)
    {
      for (int i = 1+k; i > 0; i--)
      {
        for (int j = 0; j < 4; j++)
        {
          if (grille[i-1][j].blockTest() == false)
          {
            grille[i-1][j].setId(grille[i][j].getId());
            if (grille[i][j].getId() != 0)
            {
              moveIsLock = false;
              moveIsNotLock = true;
            }
            grille[i][j].setId(0);
          } else
          {
            if (grille[i-1][j].getId() == grille[i][j].getId())
            {
              grille[i-1][j].setId(grille[i-1][j].getId()*2);
              if (grille[i][j].getId() != 0)
              {
                moveIsLock = false;
                moveIsNotLock = true;
              }
              grille[i][j].setId(0);
            } else
            {
              if (!moveIsNotLock)
              {
                moveIsLock = true;
              }
            }
          }
        }
      }
    }
  } else if (keyCode == 'R')
  {
    for (int i = 0; i < 4; i++)
    {
      for (int j = 0; j < 4; j++)
      {
        grille[i][j].setId(0);
      }
    }
    blockGen();
  }
  if (moveIsNotLock == true && moveIsLock == false)
  {
    blockGen();
    moveIsLock = false;
    moveIsNotLock = false;
  }
}



