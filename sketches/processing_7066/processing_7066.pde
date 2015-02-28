

boolean dilate;
Cells cells;

void setup()
{
  size(500, 500, P2D);
  background(0);
  dilate = true;
  cells = new Cells(100, 100);
  cells.addCells();
}

void draw()
{

  if (dilate)
  {
    filter(DILATE);
  }
  else
  {
    filter(ERODE);
  }
  cells.updateCells();
}

void mousePressed()
{
  dilate = !dilate;
}

class Cell
{
  float x;
  float y;
  float dx;
  float dy;
  float nag;
  color c;
  Cell(float tempx, float tempy, color tempc)
  {
    x = tempx;
    y = tempy;
    c = tempc;
  }
  void display()
  {
    dx = x-mouseX;
    dy = y-mouseY;
    nag = dx*dx+dy*dy;
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x+500*dx/nag, y+500*dy/nag, 4, 4);
  }
}

class Cells
{
  int rows;
  int cols;
  float x;
  float y;
  
  Cell[][] cells;
  Cells(int temprows, int tempcols)
  {
    rows = temprows;
    cols = tempcols;
    cells = new Cell[cols][rows];
  }
  void addCells()
  {
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        x = i*width/cols;
        y = j*height/rows;
        cells[i][j] = new Cell(x, y, color(random(255), random(255), random(255), 100));
      }
    }
  }
  void updateCells()
  {
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        cells[i][j].display();
      }
    }
  }
}

