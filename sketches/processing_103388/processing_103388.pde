
/****************************
  PGSS  Programming Lab 2013
  Day #3
  Game 1
  copyright Jim Roberts July 2013 Pittsburgh PA
  Use the mouse to influence the movement of the picture
  and try to hit the bouncing target.
  You get one point per hit.
  IF YOU FORCE THE PICTURE TO WRAP TO THE OTHER SIDE,
  YOU LOSE YOUR POINTS.
  
  As your hit counts increases, the movement control of the picture
  becomes more difficult.
  
  Ideas introduced:
     control: if, if else, if else if
     functions:  programmer defined and called functions
     API functions:  dist(float, float, float, float) to determine
         if a collision occurs
                     text( string, float, float ) for display of the 
         score
                     millis( ) for determing the time
*/


float wx, wy, wdx, wdy, wdim;
float bx, by, bdx, bdy, bdim;
color wCenter, wMiddle, wOuter;
color bCenter, bMiddle, bOuter;
color backgroundColor;

PImage pic;

int hitCount;

float pictureMovementDelta;

int startTime, currentTime, ellapsedTime;
 
void setup( )
{
  size( 600, 600);
  wx = wy =  width*.5;
  bx = by = 100;
  wdim = bdim = width*.1;
  wdx = 0;
  wdy = 0;
  bdx = random( 2, 8 );
  bdy = random( 2, 8 );
   
  wCenter = color( random(255), random(255), random(255) );
  bCenter = color( random(255), random(255), random(255) );
  bMiddle = color( random(255), random(255), random(255) );
  bOuter = color( random(255), random(255), random(255) );
   
  backgroundColor = color( 0, 50 );
   
  rectMode( CENTER );
  imageMode( CENTER );
  pic = loadImage( "jim.jpg");
  
  hitCount = 0;
  pictureMovementDelta = .1;
  
  textSize( 18 );
  textAlign(  CENTER );
  
  startTime = millis( );   // records the starting time in milliseconds
}
 
void draw( )
{
  // draw background
  fill( backgroundColor );
  rect( width*.5, height*.5, width, height );  

  // move targets
  moveWrappingTarget( );
  moveBouncingTarget( );
  
  // drawTargets
   // wrapping targets
  drawBouncingTarget( );
   // bouncing targets
  drawWrappingTarget( );
  
  checkCollision( );
  showStats( );
}


void showStats( )
{
  fill( 255, 255, 0 );
  text( "Hit Count: " + hitCount, width/2, 20 );
  currentTime = millis( );  // get the curent time in milliseconds
  ellapsedTime = currentTime - startTime;  // compute the ellapsed time in milliseconds
  text( "Time: " + int(ellapsedTime/1000), width/2, 40 ); // display the time in seconds
  
}

void checkCollision( )
{
   float distance = dist( wx, wy, bx, by );
   if ( distance < wdim )
   {
      fill( 255, 0, 0 );
      rect( width*.5, height*.5, width, height );
      hitCount++;
      // Every time the user makes 5 hits, the movement delta
      // in increased to make the game harder.
      if ( (hitCount+1)%5 == 0)
      {
          pictureMovementDelta += .3; 
      }
      bx = random( wdim*.5, width-wdim*.5 );
      by = random( wdim*.5, height-wdim*.5 );
      bdx = random( 3, 10 );
      bdy = random( 3, 10 );
   }
     
}

// mouseMoved( ) is called by Processing when the mouse is moved.
// This checks the direction the mouse moved and alters the x and
// y movement delta by the delta amount.
void mouseMoved( )
{
   if      ( mouseX > pmouseX) wdx += pictureMovementDelta;
   else if ( mouseX < pmouseX) wdx += -pictureMovementDelta; 
   
   if      ( mouseY > pmouseY) wdy += pictureMovementDelta;
   else if ( mouseY < pmouseY) wdy += -pictureMovementDelta; 
      
}

void drawBouncingTarget( )
{
   fill( bOuter );
   ellipse( bx, by, bdim, bdim);
   fill( bMiddle );
   ellipse( bx, by, bdim*.66, bdim*.66);
   fill( bCenter );
   ellipse( bx, by, bdim*.33, bdim*.33);   
}

void drawWrappingTarget( )
{
   fill( wOuter );
   rect( wx, wy, wdim, wdim);
   image( pic, wx, wy, bdim, bdim);
}


void moveBouncingTarget( )
{
     // bouncing targets
   bx += bdx;
  if (bx+bdim*.5 > width || bx < bdim*.5 )
  {
      bdx = -bdx;
  }
  by += bdy;
  if (by+bdim*.5 > height || by < bdim*.5 )
  {
      bdy = -bdy;
  }
}

void moveWrappingTarget( )
{
   // wrapping target
  wx += wdx;
  if (wx > width + wdim*.5  )  // too far to the right
  {
      wx = -wdim*.1;
      hitCount = 0;
  }
  else if (  wx < -wdim*.1 )  // too far to the left
  {
      wx =  width + wdim*.5;
      hitCount = 0;
  }
  wy += wdy;
  if (wy > height + wdim*.5 )
  {
      wy = -wdim*.5;
      hitCount = 0;
  } 
  else if ( wy < -wdim )
  {
     wy = -wdim*.5;
     hitCount = 0;
  }
}


