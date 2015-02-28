
//Global vars:
int number = 20;
PVector scalar = new PVector(0, 0);
int[][] things = new int[number][number];

void setup()
{
  //Start this sheat:
  size(1024, 768);
  background(40, 40, 40);
  frameRate(5);
  loop();
  //noLoop();
  
  //Figure out the tile scale:
  scalar.x = ((width+0.0) / (number+0.0));
  scalar.y = ((height+0.0) / (number+0.0));
}

//Empty draw function:
void draw()
{
  //clear();
  GenerateTiles(things, number, number);
  DrawTiles(things, number, number);
}

//Tile generation function:
void GenerateTiles(int[][] ta, int lx, int ly)
{
  //Get some random information for each tile:
  for (int i = 0; i < lx; i++)
  {
    for (int j = 0; j < ly; j++)
    {
      ta[i][j] = floor(random(0.5, 5.5));
    }
  }
}

//Tile drawing function:
void DrawTiles(int[][] ta, int lx, int ly)
{
  for (int i = 0; i < lx; i++)
  {
    for (int j = 0; j < ly; j++)
    {
      float mul = ((i+0.0) / (lx+0.0)) * ((j+0.0) / (ly+0.0));
      int val = 255;  //floor(255.0 * mul);
      switch (ta[i][j])
      {
      case 0:
        fill(val, 0, 0);
        break;
      case 1:
        fill(0, val, 0);
        break;
      case 2:
        fill(0, 0, val);
        break;
      case 3:
        fill(val, 0, val);
        break;
      case 4:
        fill(val, val, 0);
        break;
      case 5:
        fill(0, val, val);
        break;
      }
      
      rect(i * scalar.x, j * scalar.y, scalar.x, scalar.y, 8);
    }
  }
}


