
// ICE #4 
// Hyun Doug Kim copyright 2014 hyundouk
 
 float x, y, diam;
 color col;
 
void setup( ) 
{ 
 size( 400, 400 ); 
 background( 0 ); 

 x= 100;
 y= 100; 
 diam= 54;

 col = color (200, 200, 0);
} 
 
void draw( ) 
{ 
 fill( 0, 200, 0 ); 
 circle( 200, 200, 100 ); 
 color col = color( 100, 200, 0 ); 
 circle( 300, 200, 50, col ); 
 noLoop( ); 
} 

void circle (float x, float y, float d)
{
ellipse(x, y, diam, diam);
}

void circle (float x, float y, float d, color col)
{
fill (col);
ellipse(x, y, diam, diam);
}


