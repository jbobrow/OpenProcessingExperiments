
//Task 3
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// Collisions between bouncing and wrapping objects

float bx, by, bsz, bdeltaX, bdeltaY, bdirX, bdirY;
float wx, wy, wsz, wdeltaX, wdeltaY;
PImage pic;

void setup( )
{
   size( 400, 400 );
   imageMode( CENTER );
   // Bouncing Figure
   bx = width*.5;
   by = height*.5;   
   bdeltaX = random( 1, 5 );
   bdeltaY = random( 1, 5 );  
   bdirX = 1;
   bdirY = 1;   
   bsz =  50;
   
   // Wrapping Figure
   wx = random( width );
   wy = random( height );
   
   wdeltaX = random( 1, 5 );
   wdeltaY = random( 1, 5 );
   
   wsz = 50;

   pic = loadImage( "Jim.jpg" );
}

void draw( )
{
   background( 0 );
   noStroke( );
   // Wrapping Figure  
    // move the image
   wx += wdeltaX;
   wy += wdeltaY;  
    // see if x is too big
   if ( wx-wsz/2 > width )
   {
      wx = -wsz; 
   }   
    // see if y is too big
   if ( wy-wsz/2 > height )
   {
      wy = -wsz; 
   }
   image( pic, wx, wy, wsz, wsz );
   stroke( 0 );
   strokeWeight( 16 );
   noFill( );
   ellipse( wx, wy, wsz+.2*wsz, wsz+.2*wsz );
   
     // Bouncing Figure
   // move figure
   bx += bdeltaX*bdirX;
   by += bdeltaY*bdirY;  
   // see if x is too big
   if ( bx+bsz/2 > width || bx/2 <= 0 )
   {
      bdirX = -bdirX;
      bx += bdeltaX*bdirX;
   }   
   // see if y is too big
   if ( by+bsz/2 > height || by/2 <= 0 )
   {
      bdirY = -bdirY;
      by += bdeltaY*bdirY;
   }   
   image( pic, bx, by, bsz, bsz );
 
    // Check for Collision
    float distance = dist( wx, wy, bx, by );
    //println( distance );
    float minCollisionDistance = (wsz+bsz)*.5;
    //println(minCollisionDistance);
    if ( distance <= minCollisionDistance)
    {
       fill( 255, 0, 0 );
       noStroke( );
       rect( 0, 0, width, height ); 
    }
}


