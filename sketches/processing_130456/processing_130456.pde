
// copyright 2014 Irene Joung
// ICE#4

float x,y,diam;
color col;

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

void circle (float x,float y,float diam)
{
  ellipse(x,y,diam,diam);
}

void circle (float x, float y, float diam, color col)
{
  fill(col);
  ellipse(x,y,diam,diam);
}


