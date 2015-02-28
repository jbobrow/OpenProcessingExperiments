
//ICE #4
//Copyright Miranda Jacoby, 2014 All Rights Reserved

float x, y, diam;

void setup( ) 
{ 
 size( 400, 400 ); 
 background( 0 ); 
} 
 
void draw( ) 
{ 
 fill( 0, 200, 0 ); 
 circle( 200, 200, 100 ); 
 color col = color( 200, 200, 0 ); 
 circle( 300, 200, 50, col ); 
 noLoop( ); 
} 
 
void circle (float x, float y, float diam) 
{
  stroke(0);
  fill(200, 0, 0);
  ellipse(x, y, diam, diam);
}

void circle (float x, float y, float diam, color col)
{
  stroke(0);
  fill(col);
  ellipse(x, y, diam, diam);
}


