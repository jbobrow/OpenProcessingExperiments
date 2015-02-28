
//Hyun Doug Kim 
//ICE 17

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
  float x, y, dim;
  color col;
  
void drawFigure()
{
  rect(x, y, dim, dim);
}
void moveFigure()
{
  x+=dim;
  if (x>width)
  {
    dim= -dim;
  }
  else if (x<0)
  {
    dim= -dim;
  }
}
}


