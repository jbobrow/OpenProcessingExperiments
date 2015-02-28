
/* 
 Printing Code ITP
 (Spring 2012)
 
 Assignment Week 6: 
 Design a logo that has some sort of dynamic expression. It does not need to be random, but should 
 at least show some range of expression that can easily be tweaker by changin the variables in the 
 sketch. Form, color, typography and grids should be considered for planning a strategy. 
 
 This sketch shows variations for the Ride Snowboards logo, a company that provides outdoor wear 
 and equiptment for snowboarding. 
 
 */

/* created by Alexandra Coym */

float numVertices = 25;
float vertexDegree = 360 / numVertices;
PImage logo;

void setup()
{
  size(650, 650);
  // size(round(printWidth * enlarge), round(printHeight * enlarge));
  background(255);
  smooth();
  logo = loadImage("logo2.jpg");
}

void draw() {
  noLoop();
  noStroke();

  //grid values fitted to make each square be 26x26
  ModularGrid grid = new ModularGrid(20, 20, 3, 36.5);
  
  int r = (int)random(3);

  if (r ==0) {
    boarder1();
  }

  if (r ==1) {
    boarder2();
  }

  if (r ==2) {
    boarder3();
  }

  noStroke();

  //uncomment to display the grid
  //grid.display();
}

void fillBlack(Module theModule)
{
  pushMatrix();
  noStroke();
  translate(theModule.x, theModule.y);
  fill(0);
  rect(0, 0, 26, 26);
  popMatrix();
}

void fillWhite(Module theModule)
{
  pushMatrix();
  stroke(255);
  translate(theModule.x, theModule.y);
  fill(255);
  rect(0, 0, 26, 26);
  popMatrix();
}

void fillRide(Module theModule)
{
  pushMatrix();
  noStroke();
  translate(theModule.x, theModule.y);
  fill(228, 90, 20);
  rect(0, 0, 26, 26);

  fill(228, 90, 20);
  popMatrix();
}

class ModularGrid
{
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;

  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;

    modules = new Module[cols][rows];
    float actualPageWidth = ((float)width - (2*pageMargin));
    float totalGutterWidth = (cols-1) * gutterSize;
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;

    float actualPageHeight = ((float)height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      }
    }
  }

  void display()
  {
    noFill();
    stroke(255, 0, 0, 100);

    // draw the big bounding box
    rect(pageMargin, pageMargin, width - (2*pageMargin), height - (2*pageMargin));

    // draw all modules
    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
      }
    }
  }
}

class Module
{
  float x;
  float y;
  float w;
  float h;

  Module() {
  }
}

//draw first snowboarder
void boarder1() {
   ModularGrid grid = new ModularGrid(20, 20, 3, 36.5);

  for (int i = 1; i<17; i++) {
    for (int k = 2; k<8; k++) {
      fillBlack(grid.modules[k][i]);
    }
  }
  for (int i = 8; i<15; i++) {
    {
      fillBlack(grid.modules[i][i]);
    }
  }

  for (int i = 8; i<14; i++) {
    fillBlack(grid.modules[i][i+1]);
  }
  for (int i = 8; i<11; i++) {
    fillBlack(grid.modules[i][i+2]);
  }
  for (int i = 8; i<11; i++) {
    fillBlack(grid.modules[i][i+2]);
  }
  for (int i = 12; i<15; i++) {
    fillBlack(grid.modules[i][i-1]);
  }

  for (int i = 5; i<7; i++) {
    fillBlack(grid.modules[1][i]);
  }

  for (int i = 1; i<4; i++) {
    fillWhite(grid.modules[2][i]);
  }
  for (int i = 1; i<5; i++) {
    fillWhite(grid.modules[3][i]);
  }
  for (int i = 11; i<18; i++) {
    fillWhite(grid.modules[7][i]);
  }
  for (int i = 13; i<16; i++) {
    fillWhite(grid.modules[4][i]);
  }
  for (int i = 8; i<12; i++) {
    fillWhite(grid.modules[2][i]);
  }
  fillWhite(grid.modules[7][1]);
  fillWhite(grid.modules[7][3]);
  fillWhite(grid.modules[3][9]);
  fillRide(grid.modules[1][16]);
  fillBlack(grid.modules[3][2]);
  
    //typeface
  pushMatrix();
  stroke(255);
  Module typeface = grid.modules[1][17];
  translate(typeface.x, typeface.y);
  image(logo, 0, 28);
  fill(0);
  popMatrix();
  
}

//draw second snowboarder
int k = 10;
int j = 10;
void boarder2() {
  ModularGrid grid = new ModularGrid(20, 20, 3, 36.5);
pushMatrix();
translate(-48,20);
  rotate(radians(-7));
  for (int i = 1; i<12; i++) {
    for (int k =11; k<16; k++) {
      fillBlack(grid.modules[k][i]);
    }
  }

  for (int i = 6; i<12; i++) {
    {
      fillBlack(grid.modules[k][i]);
    }
    k= k-1;
  }
  for (int i = 6; i<12; i++) {
    {
      fillBlack(grid.modules[j][i+1]);
      fillBlack(grid.modules[j][i-1]);
    }
    j= j-1;
  }

  fillBlack(grid.modules[4][11]);
  fillBlack(grid.modules[9][2]);
  fillBlack(grid.modules[9][3]);
  fillBlack(grid.modules[10][2]);
  fillBlack(grid.modules[10][1]);
  fillBlack(grid.modules[10][11]);

  for (int i = 2; i<17; i++) {
    fillBlack(grid.modules[i][12]);
  }

  for (int i = 8; i<11; i++) {
    fillWhite(grid.modules[13][i]);
  }

  fillWhite(grid.modules[10][5]);
  fillWhite(grid.modules[13][1]);
  fillWhite(grid.modules[13][11]);
  fillWhite(grid.modules[14][10]);
  fillWhite(grid.modules[14][11]);
  fillBlack(grid.modules[15][7]);
  fillWhite(grid.modules[15][5]);
  fillRide(grid.modules[1][12]);

popMatrix();
  //typeface
  pushMatrix();
  stroke(255);
  Module typeface = grid.modules[1][13];
  translate(typeface.x, typeface.y);
  image(logo, 0, 28);
  fill(0);
  popMatrix();
}

//draw third snowboarder
void boarder3() {
  ModularGrid grid = new ModularGrid(20, 20, 3, 36.5);
  k = 6;

  for (int i = 7; i<19; i++) {
    for (int k = 2; k<7; k++) {
      fillBlack(grid.modules[i][k]);
    }
  }

  for (int i = 7; i<19; i++) {
    for (int k = 2; k<7; k++) {
      fillBlack(grid.modules[i][k]);
    }
  }

  for (int i = 13; i<18; i++) {
    fillWhite(grid.modules[i][5]);
    fillWhite(grid.modules[i][6]);
  }

  for (int i = 2; i<15; i++) {
    fillBlack(grid.modules[i][10]);
    fillBlack(grid.modules[i][11]);
  }

  for (int i = 13; i<16; i++) {
    fillBlack(grid.modules[i][9]);
  }

  for (int i = 7; i<10; i++) {
    fillBlack(grid.modules[k][i]);
    fillBlack(grid.modules[k+1][i]);
    fillBlack(grid.modules[k+5][i]);
    fillBlack(grid.modules[k+6][i]);
    k = k-1;
  }

  fillBlack(grid.modules[10][1]);
  fillBlack(grid.modules[11][1]);
  fillBlack(grid.modules[6][4]);
  fillBlack(grid.modules[8][7]);
  fillBlack(grid.modules[15][10]);
  fillRide(grid.modules[1][10]); 



  fillWhite(grid.modules[7][2]);
  fillWhite(grid.modules[10][6]);
  fillWhite(grid.modules[18][6]);
  fillWhite(grid.modules[18][2]);
  fillWhite(grid.modules[18][3]);
  fillWhite(grid.modules[17][2]);


  //typeface
  pushMatrix();
  stroke(255);
  Module typeface = grid.modules[1][12];
  translate(typeface.x, typeface.y);
  image(logo, 0, 28);
  fill(0);
  popMatrix();
}



