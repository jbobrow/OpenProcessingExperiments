
//Richard May Copywright October 2012
//rwmay@andrew.cmu.edu
//Pseudo Screen Saver, Hide TheCamera and unhide workingBounce to see exact requirements


final int MAX = 100;
int [ ]  x, y, z, r, g, b, dx, dy, dz, diam;
float spin;
void setup ( )
{
  size(800, 800, P3D);
  x = new int[ MAX ];
  y = new int[ MAX ];
  z = new int [ MAX ];
  dx = new int[ MAX ];
  dy = new int[ MAX ];
  diam = new int[ MAX ];
  r = new int[ MAX ];
  g = new int[ MAX ];
  b = new int[ MAX ];
  dz = new int[ MAX ];
  spin=.1;

  initializeIntArray ( z, -100, 20);
  initializeIntArray( x, -400, width/4);
  initializeIntArray( y, -400, height/4);
  initializeIntArray( dx, 2, 5 );
  initializeIntArray( dy, 5, 9 );
  initializeIntArray( dz, 2, 5 );
  initializeIntArray( diam, 50, 80 );
  initializeIntArray( r, 0, 255 );
  initializeIntArray( g, 0, 40 );
  initializeIntArray( b, 0, 40 );
}
void initializeIntArray( int [ ] array, int bm, int tp )
{
  pushMatrix();
  for ( int i = 0; i < array.length; i++)
  {
    array[i] = int(random(bm, tp));
  }
  popMatrix();
}
void draw ( )
{

  prepareWindow( );
  moveFigures( );
  TheCamera();
  //workingBounce( );
  TheBox();
  pushMatrix();
  drawSphere();
  popMatrix();
  
}
void TheBox ()
{
  pushMatrix();
  fill(230, 0, 0, 70);
  rotateX (radians (60+spin));
  rotateY (radians (60+spin));
  rotateZ (radians (90+spin));
  ++spin;
  box (8*width, 8*height, 800);
  popMatrix();
}
void TheCamera()
{
  camera (2*width, 8*height, 2000, width/2, height/2, -200, 0, 1, 0);
}
void drawSphere ()
{
  //pushMatrix ();
  for (int i=0; i<x.length; i++)
  {
    fill (r [i], g [i], b[i]);
    translate (x [i], y [i], z [i]);
    sphere (diam [i]);
  }
  //popMatrix ();
}
void prepareWindow( )
{

  background( 255 );
  stroke( 255, 0, 255);
  noStroke( );
}


void moveFigures( )
{
  pushMatrix();
  for ( int i = 0; i < x.length; i++)
  { 
    x[i] += dx[i];
    if ( x[i] + diam [i] >=  width || x [i] - diam [i] <=  -400)  dx[i] = -1*dx[i];
    y [i] += dy[i];
    if (y[i] >= height || y [i] <= -400) dy[i] = - dy[i];
    z [i] += dz [i];
    if (z[i] <=  -400 || z[i] >= 200 ) dz [i] = -dz [i];
  }
  popMatrix();
}
void workingBounce( )
{
  for (int i=0; i<x.length; i++)
  {
    fill (r [i], g [i], b[i]);
    ellipse(x[i], y[i], diam[i], diam[i]);
  }
}


