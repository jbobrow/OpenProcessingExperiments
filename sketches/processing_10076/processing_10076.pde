

int grid;
int rnd;

void setup()
{
  size( 400, 400 );
  background( 255 );
  noStroke();
  smooth();
  
  rectMode( CORNERS );
  
  grid = 10;
}

void draw()
{
  //fill( 255, 100 );
  //rect( 0, 0, width, height);
  fill( 0 );
  for( int ix = 0; ix < width/grid; ix++ )
  {
    for( int iy = 0; iy < height/grid; iy++ )
    {
      rnd = int( random( 4 ) );
      if( rnd == 2 ) { recti( ix*grid, iy*grid ); }
      if( rnd == 3 ) { triangli( ix*grid, iy*grid ); }
    }
  }
  noLoop();
}

void recti( float x, float y )
{
  rect( x, y, x+grid, y+grid);
}

void triangli( float x, float y )
{
  triangle( x, y, x, y+grid, x+grid, y);
}

