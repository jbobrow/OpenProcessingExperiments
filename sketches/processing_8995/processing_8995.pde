
/*

  gmc_muster0016
  Gestalten mit Code
  FH Mainz
  
  Steffen Henschel
  2010 04 20
  
  */

int count = 4;

void setup()
{
  size( 404, 404 );
  background( 255 );
}

void draw()
{  
  for( int ix = 0; ix < count; ix++ )
  {
    for( int iy = 1; iy < pow(count/2, ix+2)+1; iy++ )
    {
      //println(ix + "," + iy);
      rect( 100*(ix), 100*(iy-1)/(pow(2, ix)), 100, 100/(pow( 2, ix ) ) );  // !!BÄÄM!!
    }
  }
  noLoop();
}

