
//Homework #6, Section A
//Copyright Miranda Jacoby 2014, All Rights Reserved. 
//Contact: majacoby@andrew.cmu.edu
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

//X Variables
float transX        ;  // transX is translation amounts

float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input

//Y Variables
float transY        ;  // transY is translation amounts

float rotY          ;  // Y axis rotation amounts
float rotDeltaY     ;  // amount of Y axis rotation change for each input

//Z Variables
float transZ        ;  // transZ is translation amounts

float rotZ          ;  // Z axis rotation amounts
float rotDeltaZ     ;  // amount of Z axis rotation change for each input
void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   
   rotDeltaX  = 0;  // intially there is no rotation
}

// Strongly suggest you do not alter the draw( ) function...
void draw( )
{
   pushMatrix( );
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
     //BOX PARTY! Boxes make an "M" shape. 
 
       fill( 255, 200, 0 );
       noStroke();
       box(50);  
       
     pushMatrix();
       translate( 0, -60, 0 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( 50, -120, 50 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( -50, -120, 50 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( 100, 60, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( -100, 60, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( 100, 0, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( -100, 0, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( 100, -60, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( -100, -60, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( 100, 120, 100 ); 
       box(50); 
     popMatrix();
     
     pushMatrix();
       translate( -100, 120, 100 ); 
       box(50); 
     popMatrix();
  
  
// Extra boxes     
//     pushMatrix();
//       translate( 100, -180, 110 ); 
//       box(50); 
//     popMatrix();
     
//     pushMatrix();
//       translate( -100, -180, 110 ); 
//       box(50); 
//     popMatrix();
     
} 

// Mantra for hw 6:  
//   translate, rotate, draw... translate, rotate, draw... translate, rotate, draw... 
// Do the required translations and rotations here before you draw anything.

// Delete, edit, or alter this code as you wish
void yourPrepareWindow( )
{
  //All code below before spotLight was taken from Jim's PrepareWindow function. 
  background( 0 );  
  // moves (0, 0, 0 ) point to the window center );
  translate( width/2, height/2, 0 );
  // turn on a white light placed at the camera position pointing to the back of the window.
  directionalLight( 255, 255, 255, 0, 0, -1 );
  spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2); 
  
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  
  translate( 0, transY, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
  
  translate( 0, 0, transZ );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );
  
 //for testing 
 //rotateX( radians( frameCount ) );
 //rotateY( radians( frameCount ) );
 //rotateZ( radians( frameCount ) );
  
 strokeWeight( 3 );
 stroke( 200, 200, 0 ); 
 line( 0, 0, 200, 0, 0, -200 );  // Z axis line
 stroke( 0, 200, 200 );
 line( 0, 200, 0, 0, -200, 0 );  // Y axis line
 stroke( 200, 0, 200 );
 line( 200, 0, 0, -200, 0, 0 );  // X axis line
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
   // check for mouse button 
  if ( mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if ( pmouseX < mouseX ) //move right
     {
        transX+=1;
     }
     else if ( pmouseX > mouseX ) // move left
     {
        transX-=1; 
     }
     else if ( pmouseY < mouseY ) // move up
     {
        transY+=1;
     }
     else if ( pmouseY > mouseY ) // move down
     {
        transY-=1;
     } 
}  

if (mouseButton == RIGHT)
 {
  if ( pmouseY > mouseY ) // move up
     {
        transZ+=1;
     }
  else if ( pmouseY < mouseY ) // move down
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
   textSize(20);
   
   text("TransX value: " + transX,  width*.5, height - 60 );
   text("TransY value: " + transY,  width*.5, height - 40 );
   text("TransZ value: " + transZ,  width*.5, height - 20 );
   
   text("RotX value: " + rotX,  width*.20, height - 560 );
   text("RotY value: " + rotY,  width*.20, height - 540 );
   text("RotZ value: " + rotZ,  width*.20, height - 520 );
   
   text("RotDeltaX value: " + rotDeltaX,  width*.75, height - 560 );
   text("RotDeltaY value: " + rotDeltaY,  width*.75, height - 540 );
   text("RotDeltaZ value: " + rotDeltaZ,  width*.75, height - 520 );
   
}




