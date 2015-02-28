
float x, y, z;

color[]palette = {
  //#0095a8, #00616f, #333333, #666666, #999999, #CCCCCC
  #242424
};

color[] pickedColors;
int[] pickedRanPosX;
int[] pickedRanPosY;


float[] springLeaders;
float[] springFollowers;
float[] springDeltas;


int numAssets = 3600;
int startX = 30;
int startY = 30;
int Xspacing = 10;
int Yspacing = 10;
int gridCols= 90;

// proximity vars
float _dist;
float _goalValue = 0;
float _radius;
float _mouseRadius = 100;
float _objValue = 0;
float _mySpeed = 0;
float _spring = 0.9;
float _ease = 0.7;
float _minX;
float _maxX;
float _minY;
float _maxY;
float _x;
float _y;
int proxRan = 300;

void setup()
{
  size(950, 600);
  smooth();

  _radius = _mouseRadius * _mouseRadius;

  pickedColors= new color[numAssets];
  pickedRanPosX= new int[numAssets];
  pickedRanPosY= new int[numAssets];

springLeaders = new float[numAssets];
springFollowers = new float[numAssets];
springDeltas = new float[numAssets];

  for (int j=0; j<numAssets; j++)
  {
    pickedColors[j] = palette[(int)random(palette.length)];
    pickedRanPosX[j] = (int)random(proxRan) - (proxRan/2);
    pickedRanPosY[j] = (int)random(proxRan) - (proxRan/2);
  }
}

void draw()
{

  background(#ECECEC);

  for (int i=0; i<numAssets; i++)
  {
    int row = floor(i / gridCols);
    int col = i % gridCols;

    // find x and y pos
    x = startX + (col * Xspacing);
    y = startY + (row * Yspacing);
    
    _minX = x;
    _minY = y;
    _maxX = x + pickedRanPosX[i];
    _maxY = y + pickedRanPosY[i];

    _dist = pow(x - mouseX, 2) + pow(y - mouseY, 2);


    

    if (_dist >= _radius)
    {
      springLeaders[i] = 0;
    } else
    {
      springLeaders[i] = (1 - _dist / _radius);
    }
    
    
    springDeltas[i] = springDeltas[i] * _ease + (springLeaders[i] - springFollowers[i]) * _spring;
    springFollowers[i] += springDeltas[i];


    _x = (springFollowers[i]* (_maxX - _minX)) + _minX;
    _y = (springFollowers[i]* (_maxY - _minY)) + _minY;
    

    /*
    _mySpeed = _mySpeed * _ease + (_goalValue - _objValue) * _spring;
    _objValue += _mySpeed;
    
   
    _x = (_objValue * (_maxX - _minX)) + _minX;
    _y = (_objValue * (_maxY - _minY)) + _minY;
     */

    noStroke();
    fill( pickedColors[i] );
    rectMode(CENTER);
    rect(_x, _y, 9, 9);

  }

  z++;
}
