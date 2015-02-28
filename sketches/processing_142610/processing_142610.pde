
// Copyright 2014 Jacklynn Pham
// ICE 17

Figure f1, f2; 
 
void setup ( ) 
{ 
 size( 400, 400 ); 
 f1 = new Figure(200, 30, color( 0, 0, 255) ); 
 f2 = new Figure( 300, 47, color( 255, 0, 0 ) ); 
 noStroke( ); 
} 

void draw()
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
  int dx;
  color col;
  
  
  //constructor
  Figure ( int tempx, int tempdim, color tcolors)
  {
   x = tempx;
   y = height/2;
   dim = tempdim;
   col = tcolors; 
  }
  
  void drawFigure()
  {
    fill( col);
    ellipse(x, y, dim, dim); // small
    
  }
  
  void moveFigure()
  {
   x += 3;
   if (x > width)
   {
     x =0;
   }
  }
  
}


