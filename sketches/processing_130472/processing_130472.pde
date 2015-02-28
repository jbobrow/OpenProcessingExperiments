
//Copyright Mina Kim 2014
// minakim0128@gmail.com
// Spring 2014

float x,y,z;

void setup( ) 
{ 
 size( 400, 400 ); 
 x=100;
 y=200;
 z=100;
 background( 0 ); 
} 
 
void draw( ) 
{ 
 fill( 0, 200, 0 ); 
 circle (x,y,z);
 color col = color( 200, 200, 0 ); 
 circle (x,y,z,col);
 noLoop( ); 
}


void circle (float x,float y, float z)
{
  ellipse (x,y,z,z);
}

void circle (float x, float y, float z, color col)
{
  fill (col);
  ellipse (x,y+150,z,z*.5);
}



