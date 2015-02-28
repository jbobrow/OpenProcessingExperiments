
// Hyun Doug Kim 
// Copyright 2014

// when keyboard X is pressed, x axis rotation delta increased in the positive direction
// when keyboard x is pressed, x axis rotation delta increased in the negative direction
// when keyboard Y is pressed, y axis rotation delta increased in the positive direction
// when keyboard y is pressed, y axis rotation delta increased in the negative direction
// when keyboard Z is pressed, z axis rotation delta increased in the positive direction
// when keyboard z is pressed, z axis rotation delta increased in the negative direction

// when left mouse button is pressed and mouse is dragged rightward , x translation is increased and initial moves to the right
// when left mouse button is pressed and mouse is dragged leftward , x translation is decreased and initial moves to the left
// when left mouse button is pressed and mouse is dragged upward , x translation is decreased and initial moves to the up
// when left mouse button is pressed and mouse is dragged downward , x translation is increased and initial moves to the  down
// when right mouse button is pressed and mouse is dragged upward , z translation is decreased and initial moves to the closer
// when right mouse button is pressed and mouse is dragged downward , z translation is decreased and initial moves to the away


float transX        ;  // SX xis translation amounts
float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input

float transY; // y axis translation amounts
float rotY; // y axis rotation amounts
float rotDeltaY; // amout of Y aixs rotation change

float transZ; // z axis translation amounts
float rotZ; // z axis rotation amounts
float rotDeltaZ; // amout of z aixs rotation change

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
     // remove these lines and add your code to draw your initial:
     fill( 255, 0, 0 );
     stroke( 255 );
     noStroke();
     box( 50 ); 
     
 //H's middle
 
 pushMatrix();
    translate(50, 0, -50);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(-50, 0, 50);
    box(50);  
  popMatrix();
 
 //H's left side 
 
  pushMatrix();
    translate(-100, -100, 100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(-100, -50, 100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(-100, 0, 100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(-100, 50, 100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(-100, 100, 100);
    box(50);  
  popMatrix();
  
  //H's right side
  
  pushMatrix();
    translate(100, 50, -100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(100, 100, -100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(100, 0, -100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(100, -50, -100);
    box(50);  
  popMatrix();
  
  pushMatrix();
    translate(100, -100, -100);
    box(50);  
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
  rotateY( radians( rotY));
  
  translate(0, 0, transZ);
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ));
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
   // check for mouse button 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseX < mouseX ) //initial moves right
     {
        transX+=1;
     }
     else if (pmouseX> mouseX) //initial moves left
     {
       transX-= 1;
     }
     else if (pmouseY < mouseY) //moves up    
     {
       transY += 1; 
     }
     else if (pmouseY > mouseY ) //mouse down
     {
       transY -= 1;
     }
  }
  
  if (mouseButton == RIGHT)
 {
   if (pmouseY< mouseY)  //moves closer
   {
     transZ += 1; 
   }
   else if (pmouseY > mouseY) //moves away
   {
     transZ -= 1;
   }
 }     
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    // test to see if X axis rotation is increased in positive direction
    if ( key == 'X' )
    {
       rotDeltaX += 1; // x rotation increased positive 
    }
    
    if (key == 'x')
    {
      rotDeltaX -= 1;  // x roation increased negative
    }
    
    if (key == 'Y')
    {
      rotDeltaY += 1; // y rotation increased positive
    }
   
   if (key == 'y')
   {
     rotDeltaY -= 1; // y roation increased negative
   }
   
   if (key == 'Z')
   {
     rotDeltaZ += 1; // z rotation increased positive
   }
   
   if (key == 'z') // z roation increased negative
   {
     rotDeltaZ -= 1;
   }
   
   if (key == 's')  //all rotation deltas are set to zero and rotation stops
   {
     rotDeltaX = 0;
     rotDeltaY = 0;
     rotDeltaZ = 0;
   }
   
   if (key == ' ') //all translation variables are set to zero but rotation continues
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
   text("Translations ",  width*.5, height - 80 ); // information about Translation
   text("x " +transX,  width*.3, height - 50 );
   text("y " +transY,  width*.5, height - 50 );
   text("z " +transZ,  width*.7, height - 50 );
   
   text("Rotations" ,  width*.5, height - 560 ); // information about Rotations
   text("x " +rotX,  width*.3, height - 530 );
   text("y " +rotY,  width*.5, height - 530 );
   text("z " +rotZ,  width*.7, height - 530 );
   
   text("delta X " +rotDeltaX,  width*.2, height - 500 ); // information about delta
   text("delta Y " +rotDeltaY,  width*.5, height - 500 );
   text("delta Z " +rotDeltaZ,  width*.8, height - 500 );
   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center );
    translate( width/2, height/2, 0 );

    // remove the follow when you are done
    // turn on a white light placed at the camera position pointing to the back of the window.
    directionalLight( 255, 102, 126, -1, 0, -1 );
    
        // draw axis lines
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


