
int[][] c = new int[20][20];
int[][] tc;

void setup()
{
  size(400, 400);
  
  initialize();
  
  frameRate(5);
  
}

void initialize()
{
  for(int y = 1; y < 20 - 1; y++)
  {
    for(int x = 1; x < 20 - 1; x++)
    {
      c[x][y] = random(1) < 0.5 ? 1 : 0;
    }
  }
  tc = c;
}

void mousePressed()
{
  initialize();
}

void draw()
{
  rectMode(CENTER);
  background(255);
  fill(0);
  strokeWeight(5);



    tc = c;
    for(int y = 1; y < 20 - 1; y++)
    {
      for(int x = 1; x < 20 - 1; x++)
      {
        check(x, y);   
        if(random(1) < 0.0005)
        {
          c[x][y] = 2;
        }
      }
    } 
    c = tc; 
  
  
  for(int y = 1; y < 20 - 1; y++)
  {
    for(int x = 1; x < 20 - 1; x++)
    {
      if(tc[x][y] == 1)
      {
       //ellipse(getX(x, y), getY(x, y), 3, 3);
       //hex(getX(x, y), getY(x, y), 6);
       drawNode(x, y); 
      }
      else if(tc[x][y] == 2)
      {
       //ellipse(getX(x, y), getY(x, y), 5, 5);
       drawNode(x, y); 
      }

    }
  }  
}

void drawNode(int x, int y)
{
    int ax = y % 2 == 0 ? 0 : -1;
    int tx = getX(x, y);
    int ty = getY(x, y);
    

    if(c[x + 1][y] == 1)
    {
      int dx = getX(x + 1, y);
      int dy = getY(x + 1, y);
      line(tx, ty, tx + (dx - tx), dy);
    }
    if(c[ax + x][y + 1] == 1)
    {
      int dx = getX(ax + x, y + 1);
      int dy = getY(ax + x, y + 1);
      line(tx, ty, tx + (dx - tx), ty + (dy - ty));
    }
    if(c[ax + x + 1][y + 1] == 1)
    {
      int dx = getX(ax + x + 1, y + 1);
      int dy = getY(ax + x + 1, y + 1);
      line(tx, ty, tx + (dx - tx), ty + (dy - ty));
    }
}

int getX(int x, int y)
{
    return x * 20 +  10 + (y % 2 == 0 ? 10 : 0);
}

int getY(int x, int y)
{
  return y * 20 + 10;
}

void check(int x, int y)
{
  int live = 0;
  
  int ax = y % 2 == 0 ? 0 : -1;
  
  live += c[x + ax][y - 1];  
  live += c[x + ax + 1][y - 1];  
  live += c[x - 1][y];  
  live += c[x + 1][y];  
  live += c[x + ax][y + 1];  
  live += c[x + ax + 1][y + 1];  

  if(c[x][y] == 0)
  {
    if(live == 2)
    {
      tc[x][y] = 1;
    }
  }
  else
  {
    if(live <= 1 || live >= 4)
    {
      tc[x][y] = 0;
    }
  }

}
