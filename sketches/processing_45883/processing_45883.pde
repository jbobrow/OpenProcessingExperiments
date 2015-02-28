
// Homework 12
// 51-757 Computing for the Arts with Processing
// November 15, 2011
// Copyright Molly Nix November 2011 Pittsburgh, PA 15232

int MAX = 20;
float screenDepth = 800;

float [ ] bx;
float [ ] by;
float [ ] bz;
float [ ] rad;
int [ ] detail;
float [ ] bdx;
float [ ] bdy;
float [ ] bdz;
color [ ] bcol;

float xRotation;
float yRotation;
float zRotation;

void setup( )
{
  size ( 800, 600, P3D);
  bx = new float [ MAX ];
  initFloatArray( bx, 50, width-50 );
  by = new float [ MAX ];
  initFloatArray( by, 50, height-50  );
  bz = new float [ MAX ];
  initFloatArray( bz, -screenDepth/2, screenDepth/2  );
  rad = new float [ MAX ];
  initFloatArray( rad, .01, width*.06 );
  detail = new int [ MAX ];
  initIntArray( detail, 0, 30 );
  bdx = new float [ MAX ];
  initFloatArray( bdx, 1, 15  ); 
  bdy = new float [ MAX ];
  initFloatArray( bdy, 1, 15  ); 
  bdz = new float [ MAX ];
  initFloatArray( bdz, 1, 15  ); 
  bcol = new color [ MAX ];
  initColorArray( );
}

void draw( )
{
  background(225, 152, 111);
  turnOnLights();
  moveBoxes( );   
  drawBoxes( ); 
  noStroke();
  noFill();
}
void initFloatArray(float [ ] farray, float low, float high) 
{
  for ( int i = 0; i < farray.length; i++ )
  {
    farray[ i ] = int( random(low, high) );
  }
}

void initIntArray(int [ ] iarray, int low, int high) 
{
  for ( int i = 0; i < iarray.length; i++ )
  {
    iarray[ i ] = int( random(low, high) );
  }
}

void initColorArray( ) 
{
  for ( int i = 0; i < bcol.length; i++ )
  {
    bcol[ i ] = color( int( random(255) ), 
    int( random(255) ), 
    int( random(255) ) );
  }
}

void moveBoxes( ) 
{
  for (int i =0; i< MAX; i++) 
  {
    bx[i] = bx[i] + bdx[i];
    by[i] = by[i] + bdy[i];
    bz[i] = bz[i] + bdz[i];
    if ((bx[i] > width - (rad[i]/2)) || (bx[i] < (rad[i]/2))) 
    {
      bdx[i] = -bdx[i];
    }
    if ((by[i] < (rad[i]/2)) || (by[i] > height - (rad[i]/2))) 
    {
      bdy[i] = -bdy[i];
    }
    if ((bz[i] < -screenDepth/2) || (bz[i] > screenDepth/2)) {
      bdz[i] = -bdz[i];
    }
  }
}

void drawBoxes( )
{
  for ( int i = 0; i < MAX; i++ ) 
  {
    fill( bcol[i] );
    pushMatrix();
    translate(bx[i], by[i], bz[i]);
    sphereDetail(detail[i]);
    sphere(rad[i]);
    popMatrix();
  }
}

void prepScreen( )
{
  fill(225, 152, 111, 10);
  noStroke();
  rectMode( CENTER );
  rect( width/2, height/2, width, height );
}

void turnOnLights() 
{
  lights();
  directionalLight(102, 102, 102, -1, 1, -1);
}

