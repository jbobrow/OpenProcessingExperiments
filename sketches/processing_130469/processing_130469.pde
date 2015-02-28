
// ICE#4
// copyright Harris Mazur

float x, y, diam;
color col;

void setup ( )
{
    size (400,400);
    background ( 0);
    x= 200;
    y= 200;
    diam= 100;
    col= color (200, 200, 0);
}   

void draw ( )
{
     circle ( x, y, diam);
     circle( x*1.5, y, diam/2, col ); 
     noLoop( ); 
 
}

void circle (float x, float y, float diam)
{ 
      fill (0, 200, 0);
      stroke (0);
      ellipse (x, y, diam, diam);
}

void circle (float x, float y, float diam, color col)
{ 
      fill (col);
      stroke (0);    
      ellipse (x, y, diam, diam);
}
