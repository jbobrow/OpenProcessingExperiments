

//Task 5  Phases
// Jim Roberts
// Copyright July 2014 Pittsburgh, PA 15221

// A Game

float bx, by, bsz, bdeltaX, bdeltaY, bdirX, bdirY;
float wx, wy, wsz, wdeltaX, wdeltaY;
PImage pic;

int score, startTime, currentTime, lapsedTime, maxTime;

int phase;


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
   wx = width/2;
   wy = height/2;
   
   wdeltaX = 0;
   wdeltaY = 0;
   
   wsz = 50;

   pic = loadImage( "Jim.jpg" );
   
   textSize( 30 );
   textAlign( CENTER );
   score = 0;

   maxTime = 30;
   
   phase = 1;


}

void draw( )
{
   if ( phase == 1 )
   {
     hello( );
   }
   else if ( phase == 2 )
   {

     prepScreen( );
     
     moveWrappingFigure( );
     drawWrappingFigure( );
     
     moveBouncingFigure( );
     drawBouncingFigure( );
   
     checkForCollision( );
     
     showStats();
   }
   else
   {
      goodbye( ); 
   }

}

void goodbye( )
{    background( 0 );
    fill( 255, 0, 0 );
     text( "GAME OVER", width/2, height*.25 );
     text( "Not a very good \nplayer, are you?", width/2, height*.5 );
     noLoop( );
}

void hello( )
{
   background( 0 );
   fill( 255, 0, 0 );
   text("Welcome to Jim's \nHouse of Doom...", width/2, height*.20);
   text("blah...blah...blah...\nblah...blah...", width/2, height*.40);
   text("Press any key to play \n(if you can find\nthe [any] key}", width/2, height*.60 );
}

void mouseMoved( )
{
    if      ( mouseX > pmouseX ) wdeltaX+=.1;
    else if ( mouseX < pmouseX ) wdeltaX-=.1;
    
    if      ( mouseY > pmouseY ) wdeltaY+=.1;
    else if ( mouseY < pmouseY ) wdeltaY-=.1;
}

void showStats()
{
  fill( 255, 255, 0 );
  text( "Score: " + score, width/2, 40 );
  currentTime = millis ();
  lapsedTime = (currentTime - startTime)/1000;
  text("Time Remaining: " + int((maxTime - lapsedTime)),  width/2, height - 50 );
  
  if (lapsedTime >= 30 )
  {
    phase = 3;
  }
  
}

void prepScreen( )
{
   background( 0 );
   noStroke( );
    
}

void moveWrappingFigure( )
{
   wx += wdeltaX;
   wy += wdeltaY;  
    // see if x is too big
   if ( wx-wsz/2 > width )
   {
      wx = -wsz/2; 
      score = 0;
   } 
   else if  ( wx+wsz/2 < -wsz/2 )
   // see if X is too small
   {
     wx =  width + wsz/2; 
     score = 0;
   }
   
    // see if y is too big
   if ( wy-wsz/2 > height )
   {
      wy = -wsz;  
      score = 0;
   }
   else if ( wy+wsz/2 < -wsz/2 )
   // see if Y is too small
   {
      wy = height + wsz/2;  
      score = 0;
   }  
}

void drawWrappingFigure( )
{
   image( pic, wx, wy, wsz, wsz );
   stroke( 0 );
   strokeWeight( 16 );
   noFill( );
   ellipse( wx, wy, wsz+.2*wsz, wsz+.2*wsz ); 
}

void moveBouncingFigure( )
{
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
}

void drawBouncingFigure( )
{
  image( pic, bx, by, bsz, bsz );  
}

void checkForCollision( )
{
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
       bx = random( 50, width-50 );
       by = random( 50, height-50 );
       bdeltaX = random( 1, 5 );
       bdeltaY = random( 1, 5 );  
       score++;    
    }   
}

void keyPressed( )
{
   if ( phase == 1 ) 
   {
     phase = 2; 
     startTime = millis( );
   }
}


