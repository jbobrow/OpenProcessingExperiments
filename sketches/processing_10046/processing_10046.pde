
int ypos1;
int ypos2;
int xpos;
int d = 4;
int xgrid;
  
void setup()
{
  size( 490, 400 );
  background( 255 );
  xgrid = width/7;
  xpos = 0;
  noStroke();
  fill( 0 );
  rectMode( CORNERS );
}

void draw()
{
  ypos2 = ypos1 + int( random( 15 ) );
  rect( xpos, ypos1, xpos+xgrid-d, ypos2  );
  ypos1 = ypos2 + int( random( 15 ) );
  if( ypos1 >= height)
  {
    ypos1 = 0;
    ypos2 = 0;
    xpos+= xgrid;
  }
  if( xpos >= width )
  {
    noLoop();
  }
}

