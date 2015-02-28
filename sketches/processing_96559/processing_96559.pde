
//Hao-Yun Mei, hmei
//Copy right_Hao-Yun Mei_Carnegie Mellon University


float x, y, z;
float dx, dy, dz;
final int MAX = 50;


int [] xCoords;
int [] x2Coords;
int [] yCoords;
int [] zCoords;
int [ ] xDelta;
int [ ] yDelta;
int [ ] zDelta;
int [] boxSize;
int [] xRot;
int [] yRot;
int [] zRot;
int [] arrayY= { 
  0, 90, 180, 270, 360, 450, 540, 630, 720, 810, 900, -90, -180, -270, -360, -450, -540, -630, -720, -810, -900
};
int [] PxCoords;
int [] PyCoords;
int [] PzCoords;

color [] cols;
void setup()
{
  size(screen.width, screen.height, P3D);
  rectMode(CENTER);
  textSize(30);
  x = width/2;
  y = height/2;
  dx = 0;
  dy = 0;
  dz = -4000;
  cols = new color[ MAX ];
  xCoords = new int [ MAX ];
  x2Coords= new int [ MAX ];
  yCoords = new int [ MAX ];
  zCoords = new int [ MAX ];
  xDelta = new int[ MAX ];
  yDelta = new int[ MAX ];
  zDelta = new int[ MAX ];
  PxCoords = new int[ MAX];
  PyCoords = new int [MAX];
  PzCoords = new int [MAX];
  boxSize = new int [ MAX ];
  initCoords (xCoords, -width, width);
  initCoords (x2Coords, -width, width);
  initCoords (yCoords, - height, height);
  //initCoords (PxCoords, -width, width);
  initCoords( xDelta, -5, 5 );
  initCoords( yDelta, -5, 5 );
  initCoords( zDelta, 5, 30 );

  initCoords (zCoords, -1000, 500);
  initCoords (boxSize, 5, 300);
  intCols();
}

void draw()
{
  lights();
  background(0);


  //box (50,50,50);
  spinRect();
  moveBoxes();
  trainRect();
  if (keyPressed) saveFrame ("hw11.jpg");
}
void initCoords (int [] coords, int min, int max)
{
  for (int i = 0; i < coords.length; i ++)
  {
    coords[i] = int ( random (min, max));
  }
}
void intCols()
{
  for (int i=0; i< cols.length; i ++)
  {
    cols[i] = color ( int(random(255)), int(random (255)), int(random(255)));
  }
}

void moveBoxes( )
{
  for ( int i = 0 ; i < xCoords.length ; i++ )  
  {
    xCoords[i] -= xDelta[i];
    if ( xCoords[i] <= -2000 )
    {
      xCoords[i] = 2000;
    }
    else if ( xCoords[i] < -2000)
    {
      xCoords[i] = 2000;
    }

    yCoords[i] -= yDelta[i];
    if ( yCoords[i] <= -2000 )
    {
      yCoords[i] = 2000;
    } 
    else if ( yCoords[i] < -2000)
    {
      yCoords[i] = 2000;
    }

    zCoords[i] -= zDelta[i];
    if ( zCoords[i] <= -10000 )
    {
      zCoords[i] = 1000;
    }
  }
}

void trainRect()
{
  //noStroke();
  for (int i = 0; i < xCoords.length ; i++)
  {
    for (int a = 0; a < arrayY.length; a++)
    {
      fill (cols[i], frameCount);

      pushMatrix();

      noStroke();
      translate( xCoords[i], yCoords[i], zCoords[i]);
      //translate (width/2, height/2, -1500 );
      //rect (xCoords[i], yCoords[i], boxSize[i], boxSize[i]);

      // rect (xCoords[i], yCoords[i], 30, 30);
      rect (xCoords[i], arrayY[a], 30, 30);
      rect (arrayY[a], yCoords[i], 30, 30);
      //rect (x2Coords[i], 50, 30, 30);
      popMatrix();
      //box ( boxSize[i]);
    }
  }
}



void spinRect()
{

if (mousePressed)
{
      dz = dz - 10;
    translate(width/2, height/7, dz);
    if (dz <= -20000)
    { 
      dz = -4000;
    }
    dy = dy+1;
    rotateY(radians(frameCount));
}
  }



