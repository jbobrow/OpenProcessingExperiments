
// Copyright 2014 Jacklynn Pham
// Homework 6
//
//
// 257/757  Spring 2014
// Exploring 3D with tools from the first five homeworks
// rotate & translate Code borrowed & tweaked from Shannon Impellicceiri

/*Key Presses:
    X: rotate in + x direction
    x: rotate in - x direction
    Y: rotate in + y direction
    y: rotate in - y direction
    Z: rotate in + z direction
    z: rotate in - z direction
    s: stop rotations
    spacebar: return position to origin (continue rotations)
    r: reset initial to original position and set all rotation values to zero
 
Mouse Dragged:
    Left Button: drag initial left/right/up/down
    Right Button drag up: + z translation (moves closer)
    Right Button drag down: - z translation (moves away)
*/

// global variables

float transX        ;  // SX xis translation amounts
float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input

float rotY;
float transY;
float rotDeltaY;

float rotZ;
float rotDeltaZ;
float transZ;

float shapeSize; //size of figures
float shapeSpace; // space between shapes
float textSize; //size of text
float indent;
float lineSpace;

void setup( )
{
  size( 600, 600, P3D );
  textSize( 24 );
  //textAlign( CENTER );

  rotDeltaX  = 0;  // intially there is no rotation
  rotDeltaY = 0;
  rotDeltaZ = 0;
  //shape information
  shapeSize= 30;
  shapeSpace= 45;

  //text
  textSize= 14;
  indent = 75;
  lineSpace = 16;

  rotX  = 0; 
  rotY = 0;
  rotZ = 0;
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
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
  boxes();  

  // Translations
  fill(255, 0, 100);
} 

void boxes ()
{
  
  ///***bottom half
  fill(#BCF7B9);
  stroke(255);
  strokeWeight(.5);
  
  pushMatrix(); /// middle
    translate(0, 0, 0);
    rotateX( radians(0) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();    

  pushMatrix();
    translate(0, shapeSpace, 10);
    rotateX( radians(5) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  pushMatrix();
    translate(shapeSpace*-.5, shapeSpace*2, 20);
    rotateX( radians(10) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  pushMatrix();
    translate(shapeSpace*-1.5, shapeSpace*2, 30);
    rotateX( radians(10) );
    rotateY( radians(5) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  pushMatrix(); // last one
    translate(shapeSpace*-2.5, shapeSpace*1.25, 40);
    rotateX( radians(5) );
    rotateY( radians(10) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  ///*** start top half

  pushMatrix();
    translate(0, shapeSpace*-1, -10);
    rotateX( radians(-5) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  pushMatrix();
    translate(0, shapeSpace*-2, -20);
    rotateX( radians(-10) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();

  pushMatrix();
    translate(0, shapeSpace*-3, -40);
    rotateX( radians(-15) );
    rotateY( radians(0) );
    box(shapeSize, shapeSize, shapeSize); 
  popMatrix();
}



///****************************

void yourPrepareWindow( )
{
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );

  translate( 0, transY, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY) );

  translate( 0, 0, transZ );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ) );
  
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
      transX+=1; // right
    }
    if (pmouseX > mouseX )
    {
      transX -=1; // left
    }
    if (pmouseY > mouseY) {
      transY += 1; // up
    } 
    if (pmouseY < mouseY) {
      transY -= 1; // down
    } 
  }
  
 if (mouseButton == RIGHT ) {
    if (pmouseY > mouseY) {
     transZ+=1;
    } 
    if (pmouseY < mouseY) {
       transZ -= 1; 
    }
 }
  
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
  // test to see if X axis rotation is increased in positive direction
  //***** X axis
  if ( key == 'X' )
  {
    rotDeltaX += 1;
  }

  if ( key == 'x' )
  {
    rotDeltaX -= 1;
  }
  ///**** Y axiesxy
  if (key == 'Y' ) // rotates right
  {
    rotDeltaY += 1;
  }
  if (key == 'y' ) //rotates left
  {
    rotDeltaY -= 1;
  }
  //*** Z axis
  if (key == 'Z' ) // rotates right
  {
    rotDeltaZ += 1;
  }
  if (key == 'z' ) //rotates left
  {
    rotDeltaZ -= 1;
  }

  // stop rotation
  if ( key == 's') {
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  }

  // set all translation variables to zero (rotations continue)
  if ( key == ' ') {
    transX = 0;
    transY = 0;
    transZ = 0;
  }

  // reset
  if ( key == 'r') {
    transX = 0;
    transY = 0;
    transZ = 0;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
  fill( 255 );
  textSize(textSize);
  text("ROTATIONS", indent, width-120 );
  text("X: " + rotX, indent, width-100 + lineSpace);
  text("Y: " + rotY, indent, width-100 +lineSpace*2);
  text("Z: " + rotZ, indent, width-100 +lineSpace*3);

  text("delta-X: " + rotDeltaX, indent*2, width-100 + lineSpace);
  text("delta-Y: " + rotDeltaY, indent*2, width-100 + lineSpace*2);
  text("delta-Z: " + rotDeltaZ, indent*2, width-100 + lineSpace*3);

  text("TRANSLATIONS", indent*5, width-120 );
  text("X: " + transX, indent*5, width-100+lineSpace );
  text("Y: " + transY, indent*5, width-100+lineSpace * 2 );
  text("Z: " + transZ, indent*5, width-100+lineSpace * 3 );
}


void jimsPrepareWindow( )
{
  // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
  background( #675448 );  
  // moves (0, 0, 0 ) point to the window center );
  translate( width/2, height/2, 0 );

  // remove the follow when you are done
  // turn on a white light placed at the camera position pointing to the back of the window.
  directionalLight( 255, 255, 255, .5, .5, -1 );

  // draw axis lines
  strokeWeight( 3 );
  stroke( 200, 200, 0 ); 
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
}



