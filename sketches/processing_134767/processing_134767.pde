
// copyright nickiecheung nickiec HW6
//
//
//
// 257/757  Spring 2014
// Homework #6
// Exploring 3D with tools from the first five homeworks

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// You may use, alter, or delete any of this..

// global variables

float transX        ;  // SX xis translation amounts
float transY;
float transZ;

float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input
float rotY;
float rotDeltaY;
float rotZ;
float rotDeltaZ;

void setup( )
{
  size( 600, 600, P3D );
  textSize( 24 );
  textAlign( LEFT );
  

  rotDeltaX  = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
}


void draw( )
{
  pushMatrix( );
  jimsPrepareWindow( );
  yourPrepareWindow( );
  drawInitial( );
  popMatrix( );
  showStats( );
}


void drawInitial( )
{  
  fill( 0, 255, 0, 40 );
  stroke( 255, 255, 0 );
  box( 50 ); 
  translate( -50, -50, -50 );
  box( 50 );
  translate( -50, -50, - 50 );
  box( 50 );
  translate( -50, -50, -50 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 0, 50, 0 );
  box( 50 );
  translate( 200, -100, 200 );
  box( 50 );
  translate( 50, 50, 50 );
  box( 50 );
  translate( 50, 50, 50 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  translate( 0, -50, 0 );
  box( 50 );
  
} 

// Mantra for hw 6:  
//   translate, rotate, draw... translate, rotate, draw... translate, rotate, draw... 
// Do the required translations and rotations here before you draw anything.

// Delete, edit, or alter this code as you wish
void yourPrepareWindow( )
{
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  translate( 0, transY, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
  translate( 0, 0, transZ );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  // check for mouse button 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
    if (pmouseX < mouseX )
    {
      transX+=1;
    }
  }
  if (mouseButton == LEFT )
  {
    if (pmouseX > mouseX )
    {
      transX -= 1;
    }
  }
  if (mouseButton == LEFT )
  {
    if (pmouseY > mouseY )
    {
      transY += 1;
    }
  }
  if (mouseButton == LEFT )
  {
    if (pmouseY < mouseY )
    {
      transY -= 1;
    }
  }
  if (mouseButton == RIGHT )
  {
    if (pmouseY > mouseY )
    {
      transZ += 1;
    }
  }
  if (mouseButton == RIGHT )
  {
    if (pmouseY < mouseY )
    {
      transZ -= 1;
    }
  }
} 


void keyPressed( )
{
  
  if ( key == 'X' )
  {
    rotDeltaX += 1;
  }
  if ( key == 'x' )
  {
    rotDeltaX -= 1;
  }
  if ( key == 'Y' )
  {
    rotDeltaY += 1;
  }
  if ( key == 'y' )
  {
    rotDeltaY -= 1;
  }
  if ( key == 'Z' )
  {
    rotDeltaZ += 1;
  }
  if ( key == 'z' )
  {
    rotDeltaZ -= 1;
  }
  if ( key == 's' )
  {
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  }
  if ( key == ' ' )
  {
    transX = 0;
    transY = 0;
    transZ = 0;
  }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
  fill( 255 );
  text("rotX = " + rotX, 0, height - 120 );
  text("rotY = " + rotY, 0, height - 140 );
  text("rotZ = " + rotZ, 0, height - 160 );
  text("transX = " + transX, 0, height - 180 );
  text("transY = " + transY, 0, height - 200 );
  text("transZ = " + transZ, 0, height - 220 );
  text("rotDeltaX = " + rotDeltaX, 0, height - 60 );
  text("rotDeltaY = " + rotDeltaY, 0, height - 80 );
  text("rotDeltaZ = " + rotDeltaZ, 0, height - 100 );
}


void jimsPrepareWindow( )
{
  // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
  background( 0 );  
  // moves (0, 0, 0 ) point to the window center );
  translate( width/2, height/2, 0 );

  // remove the follow when you are done
  // turn on a white light placed at the camera position pointing to the back of the window.
  directionalLight( 255, 255, 255, 0, 0, -1 );

  // draw axis lines
  strokeWeight( 3 );
  stroke( 200, 200, 0 ); 
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
}



