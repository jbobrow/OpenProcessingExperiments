
//Homework#4; Angeline Chen; Pittsburgh, PA; September 10, 2013

float x, y, wd, ht;
PImage img;
PImage img2;
PImage img3;

void setup( )
{
  size( 400, 400 );
  fill( 80, 40, 26 );
  noStroke( );
  x = random(width);
  y = random(height);
  wd = random(width);
  ht = random(height);
  
  img = loadImage( "Justin-Bieber.jpg" );
  img2 = loadImage( "moustache.png" );
  img3 = loadImage( "hat.png" );
}

void draw( )
{
 background(0);
 imageMode( CENTER );
 image( img, 200, 200 );
 
 image( img2, x, y );
 noLoop( );
 
 image( img3, wd, ht );
}
 
void keyPressed( )
{
 loop( );
 text( keyCode, 0, 0 );
 if ( keyCode == UP )
 {
   y = y - 7;
 }
  if ( keyCode == DOWN )
 {
   y = y + 7;
 }
  if ( keyCode == RIGHT )
 {
   x = x + 7;
 }
   if ( keyCode == LEFT )
 {
   x = x - 7;
 }

 text( key, 0, 0 );
 if ( key == 'w' )
 {
  ht = ht - 7; 
 }
 if ( key == 's' )
 {
   ht = ht + 7;
 }
 if (key == 'a' )
 {
   wd = wd - 7;
 }
 if (key == 'd' )
 {
   wd = wd + 7;
 }
}




