
// Copyright Talha Aamir
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
float rotY;
float rotZ;
float rotDeltaX     ;  // amount of X axis rotation change for each input
float rotDeltaY;
float rotDeltaZ;
float x;

void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   
   rotDeltaX  = 0;  // intially there is no rotation
   rotDeltaY = 0;
   rotDeltaZ = 0;
   x = 35;
}

// Strongly suggest you do not alter the draw( ) function...
void draw( )
{
   pushMatrix( );
     jimsPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   // The pushMatrix( ) / popMatrix( ) pair are used
   // so the stats will always be drawn in the same place on
   // the graphics window.
   showStats( );
    
}

// DrawYour initial here
void drawInitial( )
{  
     fill(255, 0, 0); //iddle
     noStroke();
     box(30);
     
     //horizontal line of boxes for A
     //can do with for loop
     pushMatrix();
     translate(x, 0, 0);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(2*x, 0, 0);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-x, 0, 0);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-2*x, 0, 0);
     box(30);
     popMatrix();
     
     //one diagonal of A
     pushMatrix(); //head
     translate(0, -2*x, 0);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-x, -x, x/2);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-2*x, 0, x);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-3*x, x, 1.5*x);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(-4*x, 2*x, 2*x);
     box(30);
     popMatrix();
     
     //other diagonal of A
     pushMatrix();
     translate(x, -x, x/(-2));
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(2*x, 0, -x);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(3*x, x, -1.5*x);
     box(30);
     popMatrix();
     
     pushMatrix();
     translate(4*x, 2*x, -2*x);
     box(30);
     popMatrix();
     
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
  
  translate(0, transY, 0);
  rotY += rotDeltaY;
  rotateY(radians(rotY));
  
  translate(0, 0, transZ);
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
   // check for mouse button 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseX < mouseX ) //RIGHT
     {
        transX+=1;
     }
     if (pmouseX > mouseX ) //LEFT
     {
       transX-=1;
     }
     if (pmouseY < mouseY ) //UP
     {
       transY+=1;
     }
     if (pmouseY > mouseY ) //DOWN
     {
       transY-=1;
     }
  }
  
  if (mouseButton == RIGHT )
  {
    if (pmouseY > mouseY ) //UP
    {
      transZ+=1;
    }
    if (pmouseY < mouseY ) //DOWN
    {
      transZ-=1;
    }
  }  
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    // test to see if X axis rotation is increased in positive direction
    if ( key == 'X' )
    {
       rotDeltaX += 1;
    }
    if( key == 'x' )
    {
      rotDeltaX -= 1;
    }
    if( key == 'Y' )
    {
      rotDeltaY += 1;
    }
    if( key == 'y' )
    {
      rotDeltaY -= 1;
    }
    if( key == 'Z' )
    {
      rotDeltaZ += 1;
    }
    if( key == 'z' )
    {
      rotDeltaZ -= 1;
    }
    if( key == 's' )
    {
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
    if( key == ' ' )
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
  // text("Working on it...: ",  width*.5, height - 100 );
  text("Rotations", width * .50, height - 550);
  text("X: " + rotX + "  Y: " + rotY + "  Z: " + rotZ, width*.5, height - 525);
  text("deltaX: " + rotDeltaX + "  deltaY: " + rotDeltaY + "  deltaZ: " + rotDeltaZ, width*.5, height - 500);
  text("Translations", width*.50, height - 75);
  text("X: " + transX + "  Y: " + transY + "  Z: " + transZ, width*.50, height - 50);
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


