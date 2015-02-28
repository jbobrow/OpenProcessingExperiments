
// copyright Yoon-ji Kim 2014
//51-257 A: ICE 6

void setup( )
{
size( 400, 400, P3D );
background( 0 );
}
void draw( )
{
prepareWindow( );
placeShapes( );
}
void placeShapes( )
{
  noStroke();
  fill(142, 255, 246);
  box(30);
  
  translate(100, 0, 0);
  fill(75, 136, 219);
  sphere(20);
  
  translate(-100, -100, 0);
  sphere(20);
  
  translate(0, 100, -100);
  sphere(20);
}
void prepareWindow( )
{
background( 0 );
translate( width/2, height/2, 0 );
// rotate +30 degrees around the x Axis
rotateX( radians( 30 ) );
// rotate +20 degrees around the y Axis
rotateY( radians( 20 ) );
// turn on the light
lights( );
stroke( 255, 0, 0 );
strokeWeight( 5 );
line( -100, 0, 0, 100, 0, 0 ); // RED x axis line
stroke( 0, 255, 0 );
line( 0, -100, 0, 0, 100, 0 ); // GREEN y axis line
stroke( 0, 0, 255 );
line( 0, 0, -100, 0, 0, 100 ); // BLUE z axis line
}


