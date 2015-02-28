
/*

  gmc_muster0005
  Gestalten mit Code
  FH Mainz
  
  Steffen Henschel
  2010 04 20
  
  */
  
  int f = 1;
  float s = 7.2;
  float c = height/2;
  
void setup()
{
  size( 500, 500 );
  background( 255 );
  ellipseMode( CENTER );
  noStroke();
  smooth();
  c = height/2;
}

void draw()
{
  for( int iy = 0; iy < 32; iy++ )
  {
    fill( (iy%2)*255 );
    if( iy == 8 ) { f = -1; }
    if( iy == 24 ) { f = 1; }
    ellipse( width/2, c, height-iy*s*2, height-iy*s*2 );
    c-=(s-s/height)*(f);
  }
  noLoop();
}

