


PImage p;
float x, y, dx, dy;
void setup( )
{
  size( 600, 400, P3D );  
  p = loadImage("Trike2.jpg");
  //println( p.width + "  " + p.height);
}

void draw( )
{
    background( 0 );
    translate( width/2, height/2, -200 );
    rotateX( radians(frameCount) );
    image( p, -200, -100 );
}


