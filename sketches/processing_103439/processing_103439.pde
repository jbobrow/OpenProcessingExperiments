
/*
  Another Game... but very politically incorrect...sigh...
  copyright Jim Roberts July 2013 Pittsburgh PA 15221
  
  Press any key to drop Jim from the blimp into the lake.
  [UP] and [DOWN] arrows to change blimp altitude.
  
  15 lake hits or splashes to win.
  5 isses or splats to lose.
  Fly the blimp to low and take your chances...
  
  VARIABLE NAMES:
  Variables beginning with b are used for the blimp.
  Variables beginning with j are used for the picture of Jim.
  Variables beginning with l are used for the lake in which the user tries to drop Jim.
  
  x is the horizontal location.
  y is the vertical location.
  w is the width.
  h is the height.
  dx is the change of the x value (deltaX).
  dy is the change of the y vauye (deltaY);
  c is the color.
  
*/

final int MAX_MISS_COUNT = 5;
final int WIN_SPLASH_COUNT = 15;
final int MAX_TIMER_WAIT = 100;
final float JIM_GRAVITY = 0.05;
float bx, by, bw, bh, bdx;   // blimp data
float jx, jy, jw, jh, jdx, jdy;  // Jim data
float lx, ly, lw, lh;  // lake data
boolean jimIsFalling, blimpHasCrashed, gameOver;  // boolean variables used by draw( )
                                        // to decide what to do.
PImage pic; 

color bgc, gc, lc;

int splashCount, missCount;
int splashTimer, missTimer;

void setup( )
{
  size( 800, 400 );

  bw = width*.1;
  bh = height * .05;
  bx = bw;
  by = height*.05;
  bdx = 1;
  
  jx = bx;
  jy = by;
  jw = width * .03;
  jh = jw;
  jdx = bdx;
  jdy = 0;
  
  lx = width*.8;
  ly = height * .95;
  lw = width*.2;
  lh = height * .075;
  
  jimIsFalling = blimpHasCrashed = gameOver = false;
  
  pic = loadImage( "jim.jpg");
  imageMode( CENTER );
  textAlign( CENTER );
  
  bgc = color( 11, 184, 188, 30 );  // sky color
  gc = color( 90, 155, 8 );  // ground color
  lc = color( 4, 34, 98 );  // lake color
  
  splashCount = missCount = 0;
  splashTimer = missTimer = 100000;
}

void draw( )
{     // the timers are used to control the various message displays on screen.
   splashTimer++;
   missTimer++;
   
   // Draw must decide what to do for each frame.  The boolean variables and timers 
   // are used to determine if something has happened:
  if ( blimpHasCrashed )  // Game is over
  {
     crashResult( );
  }
  else if ( missTimer < MAX_TIMER_WAIT )  // There was a recent miss
  {                 // This is before gameOver so the miss message shows up on the last
    missResult( );     // miss that causes the player to lose as well as the "lose" message.
  } 
  else if ( gameOver )  // The player has won or lost
  { 
    gameOverResult( );
  }
  else if( splashTimer < MAX_TIMER_WAIT )  // there was a recent splash.
  {
    splashResult( );   
  }
  else   // nothing has happened so the game continues...
  {
    prepareBackground( );
    moveBlimp( );
    drawBlimp( );
    showJim( );
    checkSplash( );
    showStats( );
  }
}

void gameOverResult( )
{
   textSize( 48 );
   if ( splashCount >= WIN_SPLASH_COUNT )  // Did the player win?
   {  // The player won...
      background( 34, 211, 19 );
      fill( 200, 0, 0 );
      text("You Win with " + splashCount + " Sucessful Drops!!", width*.5, height*.5 );
      noLoop( );  // Stops iteration of draw essentially ending the program.
   }
   else      // Apparently the player did not win
   {
      background( 179, 90, 9 );
      fill(  0 );
      text("You Lose with " + missCount + " Misses!!", width*.5, height*.5 ); 
      noLoop( );  // Stops iteration of draw essentially ending the program.
   }
}
void missResult( )
{
    background( 200, 0, 0 );
    fill( 0 );
    textSize( 48 );
    text( "Jim missed the lake!!\nYou gotta' be more careful...!!", width*.5, height * .5);
}

void splashResult( )
{
    background( lc );
    fill( 200, 200, 0 );
    textSize( 48 );
    text( "Jim hit the lake!!\nFantastic!!", width*.5, height * .5);
}

void crashResult( )
{
    background( 255, 0, 0 );
    fill( 200, 200, 0 );
    textSize( 48 );
    text( "You crashed the blimp!!\nYou Lose Big Time!!", width*.5, height * .5);
    noLoop( ); // Stops iteration of draw essentially ending the program.
}

void moveBlimp( )
{
  color c = get( int(bx), int(by) );  // Get color of screen at blimp location.
  if ( c == gc )   // If color matches the ground color, the blimp crashed.
  {
      blimpHasCrashed = true;
  } 
  else  // The blimp did not crash.
  {
    bx += bdx;  // move blimp
    jx += jdx;  // move Jim
    if ( bx  > width + bw)  // wrap blimp
    {
       bx = -bw; 
       bdx += .5;
       if ( !jimIsFalling )  // Is Jim falling -- if so, adjust his x and deltaX to the 
       {               //  blimp's so he can move on his own.
          jdx = bdx;
          jx = bx;     
       }
    }
  }
}

void drawBlimp( )
{
  fill( 200, 200, 0 );
  ellipse( bx, by, bw, bh );
}

void showJim( )
{ // Jim rotates as he falls so we translate and draw him at (0, 0);
  pushMatrix( );
     translate( jx, jy );
     if (jimIsFalling)  // Is Jim falling? If so rotate him, change his y coordinate
     {                    // and accelerate his fall
       jy += jdy;
       rotate( radians( frameCount*3 ) );   
       jdy += JIM_GRAVITY; // RoadRunner physics... sorry, guys... the mgmt.   
     }
     image( pic, 0, 0, jw, jh );
  popMatrix( );
}

void keyPressed( )
{
   if ( key == CODED )  // Was a non-printing key pressed?
   {
       if ( keyCode == UP )  // Was it the [UP]  arrow
       {
          by -= 2;
          jy = by;
       }
       else if ( keyCode == DOWN ) // or was it the [DOWN] arrow?
       {
         by +=2;
         jy = by;
       }
   }
   else // It was a printing key
   { 
     jimIsFalling = true;  // Change the flag so Jim falls.
     jdy = 1;  // Change Jim's vertical delta variable so he can fall.
   }
}

void checkSplash( )
{
   if ( jy >= ly  )  // Was Jim close enough to the ground to hit the lake?
   {
      if ( jx >= lx-lw*.5 && jx <= lx+lw*.5)  // Was Jim horizontally over the lake?
      {  // He was over the lake.
         splashCount++; 
         if ( splashCount >= WIN_SPLASH_COUNT )  // Did the player win?
         {
            gameOver = true; 
         }
         splashTimer = 0;  // Reset the timer so the splash screen is displayed.
      }
      else  // Jim missed the lake.
      {
         missCount++;
         if ( missCount >= MAX_MISS_COUNT )  // Did the player lose?
         { 
            gameOver = true; 
         }
         missTimer = 0; // Reset the timer so the miss screen is displayed.
      }
     
     // Jim is either in the lake or a stain on the ground so we reset stuff and 
     // the player can try again.
    jx =  -bw;
    jy = by;
    jdx = jdy = 0;
    jimIsFalling = false;
    background( bgc );  // background is opaque so we erase an vestiges of the 
                        // earlier round.
   }
}

void showStats( )
{
  textSize( 24 );
  fill( 0 );
  text( "Splashes: " + splashCount, width*.10, height*.10 );
  text( "Misses:   " + missCount, width*.10, height*.18 );
  text( "Speed:    " + int(bdx * 10 ), width*.10, height*.26);
  text( "Altitude: " + int (height - by), width*.10, height*.34 );
  
  if (frameCount < 1200 )  // Display instrucitons for first 20 seconds.
  {
    textSize( 18 );
    text( "[UP] and [DOWN] arrows to change blimp altitude", width*.3, height*.75);
    text( "[ANY-KEY] to drop Jim", width*.3, height*.83);
  }

}

void prepareBackground( )
{
 noStroke( );
 fill( bgc );
 rect( 0, 0, width, height );
 fill( gc );
 triangle( 0, height, 0, height*.9, width*.6, height);
 triangle( width*.4, height, width, height*.8,  width, height);
 fill( lc );
 ellipse( lx, ly, lw, lh );
 stroke( 0 );
 
 
}


