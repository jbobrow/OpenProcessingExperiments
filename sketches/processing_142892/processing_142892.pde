
// Copyright 2014 Jacklynn Pham
// ICE 18

final int MAX_FIGURES = 10; 
 
Figure [ ] allFigures; 

 
void setup ( ) 
{ 
 size( 400, 400 ); 
 allFigures = new Figure [MAX_FIGURES];
 allFigures = initFigures( ); 
 
} 
 
void draw( ) 
{ 
 background( 0 ); 
 moveFigures(); 
 drawFigures(); 
} 

void drawFigures()
{
  for (int i = 0; i < allFigures.length; i++)
  {
    allFigures[i].drawFigure(i);
  }
}

void moveFigures()
{
  for (int i = 0; i < 10; i++)
  {
    allFigures[i].moveFigure(i);
  }
}


 
Figure [ ] initFigures( ) 
{ 
 Figure [ ] temp = new Figure[ MAX_FIGURES ] ; 
 
 for ( int i = 0; i < temp.length; i++) 
 { 
 int x = int( random( width ) ); 
 int y = int( random( height ) ); 
 int dim = int( random( 50 ) ); 
 int col = color( random( 255 ), 
 random( 255 ), 
 random( 255 ) ); 
 temp[i] = new Figure( x, y, dim, col ); 
 } 
 
 return temp; 
} 
class Figure
{
  int x, y, dim;
  int dx;
  color col;
  
  
  //constructor
  Figure( int tx, int ty, int tdim, color tcol ) 
    { 
     x = tx; 
     y = ty; 
     dim = tdim; 
     col = tcol; 
     } 
  
  void drawFigure(int i)
  {
    fill( col);
    ellipse(x, y, dim, dim);
 // small
      }
  
  void moveFigure(int i)
  {
   x += 3;
   if (x > width)
   {
     x =0;
   }
  }
  
}


