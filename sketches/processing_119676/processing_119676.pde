
//CMU Computing arts with Processing
//All right reserved to Chia-Fang Lue
// Instruction: Drag the mouse in x direction to speed up or slow down the rain.

final int MAX = 40;
final int rMAX = 500;

color [ ] colorList = { color( 51, 121, 203, 10), color( 60, 138, 175, 10), color( 26, 92, 201, 10)}; 

//cloud
int [ ] xCloud;
int [ ] yCloud;
int [ ] zCloud;
int [ ] dxCloud;
int [ ] dyCloud;
int [ ] dzCloud;
int [ ] rotzCloud;
int [ ] sizeCloud;

//rain
int [ ] xRain;
int [ ] yRain;
int [ ] zRain;
int [ ] dxRain;
int [ ] dyRain;
int [ ] dzRain;
color [ ] cols;


void setup()
{
  size( 800, 600, P3D);
  background( 240);
  xCloud = new int[MAX];
  yCloud = new int[MAX];
  zCloud = new int[MAX];
  dxCloud = new int[MAX];
  dyCloud = new int[MAX];
  dzCloud = new int[MAX];
  rotzCloud = new int[MAX];
  sizeCloud = new int[MAX];
  
  xRain = new int[rMAX];
  yRain = new int[rMAX];
  zRain = new int[rMAX];
  dxRain = new int[rMAX];
  dyRain = new int[rMAX];
  dzRain = new int[rMAX];
  cols = new color[rMAX];
  
  initCloud( xCloud, -displayWidth*2, displayWidth*2);
  initCloud( yCloud, -displayHeight*2, displayHeight*2);
  initCloud( zCloud, -2000, 0);
  initCloud( dxCloud, -5, 5);
  initCloud( dyCloud, -3, 3);
  initCloud( dzCloud, 0, 0);
  initCloud( rotzCloud, -3, 3);
  initCloud( sizeCloud, 100, 350);
  
  initRain( xRain, -displayWidth*2, displayWidth*2);
  initRain( yRain, -displayHeight*2, displayHeight*2);
  initRain( zRain, -2000, 2000);
  initRain( dxRain, 5, -5);
  initRain( dyRain, 5, -5);
  initRain( dzRain, -10, -3); 
  initColors( );
  
  ellipseMode( CENTER );
}

void draw()
{
  background( 240 );
  
  lights();
  drawRain();
  moveRain();
  
  ambientLight(200, 200, 200);
  drawClouds();
  moveClouds();
 
}

void drawRain()
{
  for ( int i = 0 ; i < xRain.length; i++)
  {
    fill( cols[i]);
    stroke( 255);
    strokeWeight(1);
    pushMatrix();
      translate( xRain[i], yRain[i], zRain[i]);
      box( 5, 5, 100);
    popMatrix();
  } 
}

void moveRain()
{
  for ( int i = 0; i < xRain.length; i++)
  {
    xRain[i] += dxRain[i];
    if ( xRain[i] < -2000)
    {
      xRain[i] = 2000;
    }
    else if ( xRain[i] > 2000)
    {
      xRain[i] = -2000;
    }
    
    yRain[i] += dyRain[i];
    if ( yRain[i] > 2000)
    {
      yRain[i] = -2000;
    }
    else if ( yRain[i] < -2000)
    {
      yRain[i] = 2000;
    } 
    
    zRain[i] += dzRain[i];
    if ( zRain[i] < -1000)
    {
      zRain[i] = 1000;
    }
  }
}

void drawClouds()
{
  for ( int i = 0; i < sizeCloud.length; i++)
  {
    noStroke();
    if ( i % 3 == 0)
    {
    fill( colorList[0]);
    }
    else if ( i % 3 == 1)
    {
      fill( colorList[1]);
    }
    else if ( i % 3 == 2)
    {
      fill( colorList[2]);
    }
    pushMatrix();
      translate(xCloud[i], yCloud[i], zCloud[i]);
      rotateZ( radians( frameCount/5)*rotzCloud[i]);
      ellipse( 0, 0, sizeCloud[i], sizeCloud[i]);
      ellipse( -sizeCloud[i]*.5, 0, sizeCloud[i]*.7, sizeCloud[i]*.7);
      ellipse( sizeCloud[i]*.5, 0, sizeCloud[i]*.7, sizeCloud[i]*.7);
      ellipse( -sizeCloud[i]*.3, -sizeCloud[i]*.4, sizeCloud[i]*.4, sizeCloud[i]*.4);
      ellipse( sizeCloud[i]*.3, sizeCloud[i]*.4, sizeCloud[i]*.4, sizeCloud[i]*.4);
   
    popMatrix();
  }
}

void moveClouds()
{
  for ( int i=0; i < xCloud.length; i++)
  {
    xCloud[i] += dxCloud[i];
    if ( xCloud[i] > 2000 || xCloud[i] < -2000 )
    {
      dxCloud[i] = -dxCloud[i];
    }
    
  }
}

void initCloud( int [ ] cloudArray, int min, int max)
{
  for ( int i = 0; i < cloudArray.length; i++)
  {
    cloudArray[i] = int ( random( min, max));
  }
}

void initRain( int [ ] rainArray, int min, int max)
{
  for ( int i = 0; i < rainArray.length; i++)
  {
    rainArray[i] = int ( random( min, max));
  }
}

void initColors()
{
  for ( int i = 0; i< cols.length; i++)
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    cols[i] = color( r, g, b);
  }
}

void mouseDragged()
{
  if ( mouseX > pmouseX)
  {
    for ( int i = 0; i < dzRain.length; i++)
    {
      dzRain[i] += -5;
    }
  }
  else if ( mouseX < pmouseX)
  {
    for ( int i = 0 ; i < dzRain.length; i++)
    {
      dzRain[i] += 5;
    }
  }
}


