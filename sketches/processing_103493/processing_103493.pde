
//copyright Mark Obeldobel July 2013

void setup( )
{
size(600, 600, OPENGL);
noStroke( );
}

void draw( )
{
background (185, 39, 154);
fill(125, 240, 233);
translate(width/2, height/2);
lights( );
sphere(35);
fill(123, 206, 56);
rotateX( radians(frameCount));
rotateY( radians (40));
translate( 100, 100, 0 );
fill( 247, 197, 197 );
sphere( 40 );
translate(100, 100, 0);
sphere( 10 );
fill(102, 107, 234);
translate(-300, -300);
sphere( 45 );
stroke( 75, 16, 62);
line( 0, 0, 500, 500);
}




