
//Task 2B
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// Images and Wrapping

float x, y, sz, deltaX, deltaY;
PImage pic;

void setup( )
{
   size( 400, 400 );
   x = random( width );
   y = random( height );
   
   deltaX = random( 1, 5 );
   deltaY = random( 1, 5 );
   
   sz = random( 100, 200 );

   pic = loadImage( "Jim.jpg" );
}

void draw( )
{
   background( 0 );
   // move the image
   x += deltaX;
   y += deltaY;
   
   // see if x is too big
   if ( x > width )
   {
      x = -sz; 
   }
   
   // see if y is too big
   if ( y > height )
   {
      y = -sz; 
   }
   
   image( pic, x, y, sz, sz );
 
}


