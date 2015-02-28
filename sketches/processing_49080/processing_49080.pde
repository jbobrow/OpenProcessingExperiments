
// jim roberts test code 3
void setup( )
{
  size(400, 400 );
  fill( 200, 200, 0 );
  noStroke( );
  
}

void draw( )
{
  background( 0, 0, 200 );
  ellipse( frameCount%width, height/2, frameCount%width, frameCount%height);
}
