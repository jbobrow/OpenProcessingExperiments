
int numCells = 3300;
float cellSize = 7;
float[][][][] colorArray;
int currentFrame = 0;
int dir1,dir2,dir3,dir4 = 1;
float v = 0 ;

void setup()
{
  frameRate(50);
  background(0);
  size(400,400,P2D);
  smooth();
  noStroke();
  
  colorArray = new float[floor(sqrt(numCells))][floor(sqrt(numCells))][3][2];
  for(int i = 0; i < floor(sqrt(numCells)); i++)
  {
    for(int j = 0; j < floor(sqrt(numCells)); j++)
    {
      j = constrain(j, 1, numCells);
      i = constrain(i, 1, numCells);
      colorArray[i][j][0][0] = .0001*(i*(j*j));
      colorArray[i][j][1][0] = .0005*(j*(i*i));
      colorArray[i][j][2][0] = cos(j)*TWO_PI;
      colorArray[i][j][0][1] = i*cos(j);
      colorArray[i][j][1][1] = (i-j)*height;
      colorArray[i][j][2][1] = j/i;
    }
  } 
}

void draw()
{ 
  background(colorBG());
  v = noise(width*.001,height*.001, currentFrame*.0001);
  v = (cos(v)*currentFrame);
  dir1 = int(currentFrame - v);
  dir2 = int(currentFrame + v);
  dir3 = int(currentFrame + v);
  dir4 = int(currentFrame - v);
  
  for(int i = 0; i < floor(sqrt(numCells)); i++)
  {
    for(int j = 0; j < floor(sqrt(numCells)); j++)
    {
      j = constrain(j,1,numCells);
      i = constrain(i,1,numCells);
      float rand = cos(noise(i,j, currentFrame));
      fill(colorArray[i][j][0][0], colorArray[i][j][1][0], colorArray[i][j][1][1],  colorArray[i][j][0][1]*255);
      ellipse( cellSize * j, cellSize * i, cellSize, cellSize);
      colorArray[i][j][0][1] = rand;
      colorArray[i][j][0][0] -= .0007*(cos(colorArray[i][j][2][0]) + floor(random(-dir1,dir1)));
      colorArray[i][j][2][0] += (cos(colorArray[i][j][0][1])-cos(colorArray[i][j][0][0])+ dir2);
      colorArray[i][j][1][1] += sqrt(cos(colorArray[i][j][1][0])+cos(colorArray[i][j][0][0]) - dir3);
      colorArray[i][j][1][0] -= sqrt(cos(colorArray[i][j][0][0]) + (dir4));
      colorArray[i][j][2][1] = 255*cos(colorArray[i][j][1][0]) + dir4 ;
      if(colorArray[i][j][2][1] >= 255){ colorArray[i][j][2][1] = 0; }
      else if(colorArray[i][j][2][1] <= 0)colorArray[i][j][2][1] = 255; 
      if(colorArray[i][j][1][0] >= 255){dir4 *= -1;}
      else if(colorArray[i][j][1][0] <= 0) colorArray[i][j][1][0] = 255;
      if(colorArray[i][j][1][1] >= 255) dir3 *=-1;
      else if(colorArray[i][j][1][1] <= 0) colorArray[i][j][1][1] = 255;
      if(colorArray[i][j][0][0] >= 255) dir1*=-1;
      else if(colorArray[i][j][0][0] <= 0) colorArray[i][j][0][0] = 255;
      if(colorArray[i][j][2][0] >= 255){ dir2*= -1;}
      else if(colorArray[i][j][2][0] <= 0){ colorArray[i][j][2][0] = 255;}
    }
  }
  currentFrame++;
}

color colorBG()
{
  float[] colours = new float[floor(sqrt(numCells))];
  color bgColour = 0 ;
  for(int i = 0; i < floor(sqrt(numCells)); i++)
  {
    for(int j = 0; j < floor(sqrt(numCells)); j++)
    {
      for(int k = 0; k < 3; k++)
      {
        for(int l = 0; l < 2; l++)
        {
          float c = colorArray[i][j][k][l];
          colours[i] = int(c);
        }
      }
    }
  }
  for(int i = 0; i < colours.length; i++)
  {
     float currentColour = colours[i];
     bgColour += (currentColour);
  }
  bgColour /= (colours.length);
  
  return bgColour;
}

