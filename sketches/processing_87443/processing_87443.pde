
//Christian Murphy
//Copyright january 2013
//Assignment 5

float x, y, wd, ht;
float art;
float art2;
float art3;
float art4;
float m1, m2;

void setup( )
{
 size ( 400, 400 );
 background ( 5 );
 smooth( );

 x = 200;
 y = 100;
 wd = 133;
 ht = 144;
 
 art = 55;
art2 = 200;
art3 = 130;
art4 = 67;
 
m1 = mouseX;
m2 = mouseY;

}

void draw ( )
{
  figure( x, y, wd, ht );
 figure( 0, HEIGHT, wd, ht);
 figure( art2, height, wd, ht );
 figure( width, 0, wd, ht );
 figure( width+12, height*.5, wd, ht );

 rect( mouseX, mouseY, mouseX-mouseY, mouseY-mouseX );
 fill( random (255), random (255), random (255) );
 ellipse (mouseX, mouseY, mouseX-mouseY*.5, mouseY-mouseX*.79);
 
 //ellipse
 fill (random (255));
 strokeWeight (3);
 stroke( 200, 179, 0);
 

 
 
//rect( x, y, wd, ht );
strokeWeight( 2 );
stroke( 205 );
ellipse( x + wd * .5, y + ht * .5, wd, ht );

strokeWeight (5);
stroke( random (255), 0, 0 );
}

void mousePressed( )
{
fill ( random (255), 0, 67 );
strokeWeight ( 3 );
stroke ( 220 );
ellipse (m1*.5, m2, m1+frameRate, m2*.7);
}

void keyPressed( )
{
  if (key == ' ')
  background( random (255), random (10), random (90) );
}

void figure2( float fart , float fart2, float fart3, float fart4 )
{
fill (255);
triangle(30, 75, 58, 20, 86, 75);
ellipse (fart4, fart3, fart2*.5, fart); 
}

void figure( float fx, float fy, float fwd, float fht )
{
  fill( 255, random (255) , 0 );
  ellipse( fx, fy, fwd, fht);
  triangle(30, 75, 58, 20, 86, 75);
  triangle (78, 45, 32, 67, 34, 87);
  triangle (200, 234, 300, 167, 122, 399);
}

