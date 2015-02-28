
//2d Array of objects

Cell[][] grid;
//Number of columns and rows in grid
int cols = 10;
int rows = 10;

void setup()
{
  size(200,200);
  grid = new Cell[cols][rows];
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
  {
    //initialize each object
    grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
  }
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < cols;i++)
{
  for(int j = 0; j < rows; j++)
  {
    //oscilate and display each object
    grid[i][j].oscillate();
    grid[i][j].display();
  }
}
}
class Cell
{
  float x,y;
  float w,h;
  float angle;
  
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle)
  {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  }
  void oscillate()
{
  angle +=.02;
}

void display()
{
  stroke(255);
  //color calculate using sine wave
  fill(127+127*sin(angle));
  rect(x,y,w,h);
}
}
