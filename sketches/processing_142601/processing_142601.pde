
// copyright Yoon-ji Kim 2014
// 51-257 A
// ICE#17

Figure f1, f2;
void setup ( )
{
  size( 400, 400 );
  f1 = new Figure( );
  f1.x = 200;
  f1.y = 100;
  f1.dim = 30;
  f1.col = color( 255, 0, 0 );
  f2 = new Figure( );
  f2.x = 300;
  f2.y = 200;
  f2.dim = 47;
  f2.col = color( 0, 0, 255 );
  noStroke( );
}

void draw( )
{
  background( 0 );
  f1.moveFigure( );
  f1.drawFigure( );
  f2.moveFigure( );
  f2.drawFigure( );
}
class Figure
{
  int x, y, dim;
  color col;
  
  void moveFigure()
  {
    if(x < width)
     {
       x+= 1;
     }
     if(x >= width)
     {
       x=0;
     }
  }
  
  void drawFigure()
  {
    fill(col);
    ellipse(x, y, dim, dim);
  }
}


