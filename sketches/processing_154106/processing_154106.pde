
//Task 2C
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// Images and Bouncing

float x, y, sz, deltaX, deltaY, dirX, dirY;
PImage pic;

void setup( )
{
   size( 400, 400 );
   x = width*.5;
   y = height*.5;
   
   deltaX = random( 1, 5 );
   deltaY = random( 1, 5 );
   
   dirX = 1;
   dirY = 1;
   
   sz = random( 25, 100 );

   pic = loadImage( "Jim.jpg" );
}

void draw( )
{
   background( 0 );
   // move the image
   x += deltaX*dirX;
   y += deltaY*dirY;
   
   // see if x is too big
   if ( x+sz > width || x <= 0 )
   {
      dirX = -dirX;
      x += deltaX*dirX;
   }
   
   // see if y is too big
   if ( y+sz > height || y <= 0 )
   {
      dirY = -dirY;
      y += deltaY*dirY;
   }
   
   image( pic, x, y, sz, sz );
 
}


