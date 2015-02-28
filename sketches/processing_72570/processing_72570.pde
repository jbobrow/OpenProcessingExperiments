
Pixel[][] screen;
Pixel[][] backBuffer;
int colormax = 200;

void setup()
{
  noStroke();
  frameRate(30);
  size(400, 400);
  colorMode(RGB, colormax);
  background(colormax);
  screen = new Pixel[width][height];
  backBuffer = new Pixel[width][height];
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      screen[i][j] = new Pixel();
    }
  }

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      backBuffer[i][j] = new Pixel();
    }
  }
}

void draw()
{
  multiArrayMove(backBuffer, screen);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      color c = get(x, y);

      int a = (c >> 24) & 0xFF;
      int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
      int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
      int b = c & 0xFF;          // Faster way of getting blue(argb)
      
      // if the pixel has flow
      if(screen[x][y].flowA.x != 0)
      {
        if(x+screen[x][y].flowA.x >= width || x+screen[x][y].flowA.x < 0)
        {
          backBuffer[x][y].flowA.x = -screen[x][y].flowA.x;
        }
        else // and isn't outside the screen bounds
        {
          // then pass the flow to the next pixel in the buffer
          backBuffer[x+screen[x][y].flowA.x][y].flowA.x = screen[x][y].flowA.x;
          
          a = colormax;
          r = 0;
          g = 0;
          b = 0;
        
          // if there is also y flow then carry it diagonally
          if(screen[x][y].flowA.y != 0
            && y+screen[x][y].flowA.y < height
            && y+screen[x][y].flowA.y >= 0)
          {
            backBuffer[x+screen[x][y].flowA.x][y+screen[x][y].flowA.y].flowA.x = -screen[x][y].flowA.y;
          }
        }
      }
      if(screen[x][y].flowA.y != 0)
      {
        if(y+screen[x][y].flowA.y >= height || y+screen[x][y].flowA.y < 0)
        {
          backBuffer[x][y].flowA.y = -screen[x][y].flowA.y;
        }
        else
        {
          // then pass the flow to the next pixel in the buffer
          backBuffer[x][y+screen[x][y].flowA.y].flowA.y = screen[x][y].flowA.y;
          
          a = colormax;
          r = 0;
          g = 0;
          b = 0;
          
          // if there is also x flow then carry it diagonally
          if(screen[x][y].flowA.x != 0
          && x+screen[x][y].flowA.x < width
          && x+screen[x][y].flowA.x >= 0)
          {
            backBuffer[x+screen[x][y].flowA.x][y+screen[x][y].flowA.y].flowA.y = screen[x][y].flowA.x;
          }
        }
      }
      
      a++;
      r++;
      g++;
      b++;
      // set this pixel's color      
      set(x, y, color(a, r, g, b));
    }
  }
}

void mousePressed()
{
  if(mouseX < width && mouseX >= 0
  && mouseY < height && mouseY >= 0)
  {
    if(mouseX+1 < width)
    {
      backBuffer[mouseX+1][mouseY].flowA.x = 1;
      set(mouseX+1, mouseY, color(colormax, 0, 0, 0));
    }
    if(mouseX-1 >= 0)
    {
      backBuffer[mouseX-1][mouseY].flowA.x = -1;
      set(mouseX-1, mouseY, color(0, colormax, 0, 0));
    }
    if(mouseY+1 < height)
    {
      backBuffer[mouseX][mouseY+1].flowA.y = 1;
      set(mouseX, mouseY+1, color(0, 0, colormax, 0));
    }
    if(mouseY-1 >= 0)
    {
      backBuffer[mouseX][mouseY-1].flowA.y = -1;
      set(mouseX, mouseY-1, color(0, 0, 0, colormax));
    }
  }
}

class Pixel
{
  Point flowA, flowR, flowB, flowG;

  Pixel()
  {
    flowA = new Point();
    flowR = new Point();
    flowB = new Point();
    flowG = new Point();
  }

  void reset()
  {
    flowA.x = 0;
    flowR.x = 0;
    flowB.x = 0;
    flowG.x = 0;

    flowA.y = 0;
    flowR.y = 0;
    flowB.y = 0;
    flowG.y = 0;
  }
  
  void copy(Pixel p)
  {
    flowA.x = p.flowA.x;
    flowR.x = p.flowR.x;
    flowB.x = p.flowB.x;
    flowG.x = p.flowG.x;

    flowA.y = p.flowA.y;
    flowR.y = p.flowR.y;
    flowB.y = p.flowB.y;
    flowG.y = p.flowG.y;
  }
}

class Point
{
  int x = 0, y = 0;
}

public void multiArrayMove(Pixel[][] source, Pixel[][] destination)
{
  for (int a=0;a<source.length;a++)
  {
    for (int b=0;b<source[a].length;b++)
    {
      destination[a][b].copy(source[a][b]);
      source[a][b].reset();
    }
  }
}


