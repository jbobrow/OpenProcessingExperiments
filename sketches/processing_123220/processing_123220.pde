
// HW 9
// Copyright Melissa Mak, November 2013, Pittsburgh, PA

int dx, dy, sd;

int [ ] x;
int [ ] y;
int [ ] xd;
int [ ] yd;
int [ ] sz;
int [ ] xr;
int [ ] yr;
color [ ] col;

final int MAX = 250;

void setup ()
{
  size (700, 700, P3D);
  smooth();
  x = new int[ MAX ];
  y = new int[ MAX ];
  xd = new int[ MAX ];
  yd = new int[ MAX ];
  sz = new int [ MAX ];
  xr = new int[ MAX ];
  yr = new int[ MAX ];
  col = new color[ MAX ];
  sd = 2;
  rectMode(CENTER);
  
  initCoords( x, -width/2, width/2 );
  initCoords( y, -height/2, height/2 );
  initCoords( xd, -2, 2 );
  initCoords( yd, -2, 2 );
  initCoords( sz, 2, 25 );
  initCoords( xr, -2, 2 );
  initCoords( yr, -2, 2 );
  initColors( );  
  
  directionalLight(50, 100, 100, -1, 0, 0);
  
}

void draw( )
{
  background(25);
  stroke(255);
  moveBoxes( );
  boxes( );  
}

void initCoords( int [ ] coords, int  min, int max )
{
  for( int i = 0 ; i < coords.length ; i++ )
  {
    coords[i] = int( random( min, max ) );
  }
}

void initColors(   )
{
  for( int i = 0 ; i < col.length ; i++ )
  {
    float r = random( 100, 255 );
    float g = random( 100, 255 );
    float b = random( 100, 255 );
    col[i] = color( r, g, b );
  }
}

void moveBoxes( )
{
  for( int i = 0 ; i < col.length ; i++ )  
  {
    x[i] += xd[i];
    if ( x[i] >= 600 )
    {
       x[i] = -600; 
    }
    else if ( x[i] < -600)
    {
      x[i] = 600; 
    }
    y[i] += yd[i];
    if( y[i] >= 600 )
    {
       y[i] = -600; 
    } 
    else if ( y[i] < -600)
    {
      y[i] = 600; 
    }
  }  
}

void boxes ( )
{
  strokeWeight( 1 );
  stroke( 255 );
  for( int i = 0 ; i < col.length ; i++ )  
  {
    fill( col[i]);
    pushMatrix( );
      translate (x[i], y[i]);
      rotateX( mouseX * xr[i] );
      rotateY( mouseY * yr[i] );
      sphereDetail( sd );
      sphere( sz[i] );
      sphere( sz[i]*1.5);
    popMatrix( );
  }
}

void mouseMoved()
{
  for( int i = 0 ; i < col.length ; i++ )  
  {
  translate (x[i], y[i]);
      rotateX( mouseX * xr[i] );
      rotateY( mouseY * yr[i] );
  box( sz[i] );
  }
}

void mousePressed()
{
  sd = sd + 1;
  if (sd == 5)  
  {
  sd = 2; 
  } 
}



