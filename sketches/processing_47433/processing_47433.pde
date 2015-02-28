
int zoomLevel = 10;
int widthOfScreen = 1000;
int heightOfScreen = 650;

Grid newGrid;
location ourLocs[];


int currentMouseX;
int currentMouseY;


int gridWidth = widthOfScreen+1;
int gridHeight = heightOfScreen+1;

int gridStartX;
int gridStartY;

int differenceX;
int differenceY;

void setup()
{
  ourLocs = new location[locationArray.length];
  newGrid = new Grid();

  //size (widthOfScreen, heightOfScreen);
  size(1000,600);
  background(255);
  frameRate(35);
}

void draw()
{
  background(255);
  stroke(0);

  newGrid.newGrid(zoomLevel, gridWidth, gridHeight, gridStartX, gridStartY);

  addMouseWheelListener(new java.awt.event.MouseWheelListener() 
  { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) 
    { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );

  for (int j = 0; j < locationArray.length; j++) 
  {
    float x = locationArray[j][0];
    x = (float)map(x, -180, 180, gridStartX, gridWidth/2);
    float y = locationArray[j][1];
    y = (float)map(y, 90, -90, gridStartY, gridHeight/2);
    
    ourLocs[j] = new location(x, y);
  }
  if (mousePressed == true) 
  {
    noCursor();
  } 
  else 
  {
    cursor(HAND);
  }
}

void mouseDragged()
{
  currentMouseX = mouseX;
  currentMouseY = mouseY;

  gridStartX = currentMouseX - differenceX;
  gridStartY = currentMouseY - differenceY;

  newGrid.newGrid(zoomLevel, gridWidth, gridHeight, gridStartX, gridStartY);
}

void mousePressed()
{
  differenceX = mouseX - gridStartX;
  differenceY = mouseY - gridStartY;
}

void mouseWheel(int delta) 
{
  println(delta);
  if (delta < 0)
  {
    if (zoomLevel < 500)
    {
      zoomLevel ++;
    }
  }
  if (delta > 0)
  {
    if (zoomLevel > 10)
    {
      zoomLevel --;
    }
  }
  println(delta);
}

class Grid
{
  Grid()
  {
  }
  public void newGrid(int zoomLevel, int gridWidth, int gridHeight, int gridX, int gridY)//takes in the start point of the grid
  {
    // vertical lines start at top of screen
    for (int i = 0; i < gridWidth; i+=zoomLevel)
    {
      line(i+gridX, gridY, i+gridX, gridY + gridHeight);
    }
    // horizontal lines start at left side of screen
    for (int j = 0; j < gridHeight; j+=zoomLevel)
    {
      line(gridX, j+gridY, gridX + gridWidth, j+gridY);
    }
  }
}

class location 
{

  location(float x, float y) 
  {
    ellipse(x, y, 5, 5);
  }
}

float locationArray[][] = {
  {
    53.092, -4.049
  }
  , 
  {
    53.129, -4.106
  }
  , 
  {
    52.944, -4.131
  }
  , 
  {
    51.597, -4.925
  }
  , 
  {
    51.872, -5.235
  }
  , 
  {
    53.124, -4.103
  }
  , 
  {
    53.126, -4.097
  }
  , 
  {
    53.158, -1.659
  }
  , 
  {
    55.923, -3.397
  }
  , 
  {
    55.962, -2.671
  }
  , 
  {
    56.05, -3.286
  }
  , 
  {
    51.57, -4.111
  }
  , 
  {
    55.944, -3.17
  }
  , 
  {
    53.32, -1.628
  }
  , 
  {
    53.265, -1.61
  }
  , 
  {
    53.276, -1.619
  }
  , 
  {
    53.285, -1.628
  }
  , 
  {
    56.928, -3.26
  }
  , 
  {
    56.956, -3.241
  }
  , 
  {
    57.109, -3.661
  }
  , 
  {
    51.455, -2.627
  }
  , 
  {
    55.933, -2.221
  }
  , 
  {
    57.096, -3.659
  }
  , 
  {
    51.468, -2.633
  }
  , 
  {
    51.467, -2.632
  }
  , 
  {
    51.464, -2.63
  }
  , 
  {
    57.092, -3.65
  }
  , 
  {
    57.078, -3.625
  }
  , 
  {
    57.072, -3.645
  }
  , 
  {
    56.569, -3.613
  }
  , 
  {
    56.577, -3.6
  }
  , 
  {
    57.034, -4.188
  }
  , 
  {
    51.143, -4.261
  }
  , 
  {
    51.69, -2.663
  }
  , 
  {
    50.657, -3.279
  }
  , 
  {
    51.469, -2.783
  }
  , 
  {
    56.91, -4.516
  }
  , 
  {
    51.384, -2.762
  }
  , 
  {
    51.499, -2.635
  }
  , 
  {
    51.463, -2.63
  }
  , 
  {
    51.456, -2.626
  }
  , 
  {
    55.615, -4.209
  }
  , 
  {
    54.897, -3.703
  }
  , 
  {
    51.672, -2.684
  }
  , 
  {
    51.662, -2.664
  }
  , 
  {
    51.68, -2.661
  }
  , 
  {
    53.322, -1.619
  }
  , 
  {
    51.075, 0.199
  }
  , 
  {
    51.099, 0.219
  }
  , 
  {
    51.102, 0.188
  }
  , 
  {
    51.122, 0.231
  }
  , 
  {
    51.096, -0.028
  }
  , 
  {
    51.957, -5.141
  }
  , 
  {
    51.914, -5.285
  }
  , 
  {
    51.91, -5.298
  }
  , 
  {
    51.906, -5.308
  }
  , 
  {
    51.905, -5.309
  }
  , 
  {
    51.881, -5.313
  }
  , 
  {
    51.867, -5.28
  }
  , 
  {
    51.869, -5.276
  }
  , 
  {
    51.869, -5.251
  }
  , 
  {
    51.669, -2.661
  }
  , 
  {
    56.861, -3.238
  }
  , 
  {
    56.857, -3.185
  }
  , 
  {
    56.869, -3.158
  }
  , 
  {
    57.105, -3.681
  }
  , 
  {
    51.323, -3.019
  }
  , 
  {
    56.91, -3.256
  }
  , 
  {
    57.093, -3.469
  }
  , 
  {
    56.969, -2.633
  }
  , 
  {
    57.061, -3.045
  }
  , 
  {
    57.064, -3.037
  }
  , 
  {
    57.053, -3.007
  }
  , 
  {
    57.053, -2.999
  }
  , 
  {
    57.075, -2.996
  }
  , 
  {
    53.475, -1.556
  }
  , 
  {
    53.382, -1.579
  }
  , 
  {
    53.361, -1.689
  }
  , 
  {
    53.342, -1.605
  }
  , 
  {
    53.327, -1.598
  }
  , 
  {
    53.314, -1.628
  }
  , 
  {
    53.333, -1.617
  }
  , 
  {
    53.436, -1.603
  }
  , 
  {
    53.251, -1.583
  }
  , 
  {
    53.255, -1.594
  }
  , 
  {
    53.244, -1.588
  }
  , 
  {
    53.098, -1.563
  }
  , 
  {
    53.37, -1.663
  }
  , 
  {
    53.364, -1.657
  }
  , 
  {
    53.353, -1.639
  }
  , 
  {
    53.346, -1.632
  }
  , 
  {
    53.159, -1.994
  }
  , 
  {
    53.157, -1.973
  }
  , 
  {
    53.082, -1.791
  }
  , 
  {
    53.532, -1.959
  }
  , 
  {
    53.302, -2.006
  }
  , 
  {
    53.311, -1.618
  }
  , 
  {
    53.094, -1.64
  }
  , 
  {
    53.09, -1.674
  }
  , 
  {
    53.26, -1.741
  }
  , 
  {
    53.069, -1.782
  }
  , 
  {
    53.075, -1.785
  }
  , 
  {
    53.127, -1.558
  }
  , 
  {
    53.531, -1.965
  }
  , 
  {
    53.489, -1.935
  }
  , 
  {
    53.54, -1.946
  }
  , 
  {
    53.484, -1.852
  }
  , 
  {
    53.245, -1.876
  }
  , 
  {
    53.092, -1.854
  }
  , 
  {
    53.109, -1.555
  }
  , 
  {
    51.321, -2.983
  }
  , 
  {
    51.228, -2.662
  }
  , 
  {
    53.519, -1.976
  }
  , 
  {
    53.511, -1.917
  }
  , 
  {
    53.405, -1.865
  }
  , 
  {
    53.396, -1.879
  }
  , 
  {
    53.544, -1.941
  }
  , 
  {
    53.405, -1.705
  }
  , 
  {
    53.303, -1.923
  }
  , 
  {
    53.279, -1.669
  }
  , 
  {
    53.256, -1.754
  }
  , 
  {
    53.252, -1.744
  }
  , 
  {
    53.084, -1.842
  }
  , 
  {
    53.115, -1.558
  }
  , 
  {
    53.256, -1.776
  }
  , 
  {
    53.251, -1.748
  }
  , 
  {
    53.282, -1.689
  }
  , 
  {
    53.364, -2.0
  }
  , 
  {
    53.193, -1.855
  }
  , 
  {
    53.467, -2.018
  }
  , 
  {
    53.564, -1.974
  }
  , 
  {
    53.253, -1.757
  }
  , 
  {
    55.857, -3.152
  }
  , 
  {
    56.011, -3.391
  }
  , 
  {
    56.036, -3.406
  }
  , 
  {
    56.166, -3.362
  }
  , 
  {
    56.046, -2.717
  }
  , 
  {
    56.006, -2.523
  }
  , 
  {
    56.081, -3.991
  }
  , 
  {
    56.108, -3.976
  }
};


