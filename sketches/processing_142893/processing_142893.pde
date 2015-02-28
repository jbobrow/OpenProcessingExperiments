
final int MAX_FIGURES = 10;

Figure [ ] allFigures;

void setup ( ) {
  size( 400, 400 );
  allFigures = initFigures( );
}

void draw( ) {
  background( 0 );
  moveFigure( );
  drawFigure( );
}

Figure [ ] initFigures( ) {
  Figure [ ] temp = new Figure[ MAX_FIGURES ] ;
  
  for ( int i = 0; i < temp.length; i++) {
  int x = int( random( width ) );  
  int y = int( random( height ) );
  int dim = int( random( 50 ) );
  int col = color( random( 255 ),
  random( 255 ),
  random(255 ) );
  temp[i] = new Figure( x, y, dim, col );
  }
  return temp;
}

void moveFigure ( ) {
  for ( int i = 0; i < allFigures.length; i++) {
    allFigures [i].moveFigure ( );
  }
}

void drawFigure ( ) {
   for ( int i = 0; i < allFigures.length; i++) {
    allFigures [i].drawFigure ( );
   } 
}
// eunkichung
// ICE #18

class Figure
{
  int x, y, dim;
  color col;

Figure ( int tx, int ty, int tdim, int tcol )
{
  x = tx;
  y = ty;
  dim = tdim;
  col = tcol;
}

void drawFigure ( )
{
  fill (col);
  ellipse (x, y, dim, dim);
}

void moveFigure ( )
{
  if (y < height)
  {
    y++;
  }
  
  if (y >= height) {
  y = 0;
  }
}
}


