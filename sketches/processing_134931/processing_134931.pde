
// HW_6
//copyright Joanne Lo jylo 2014
//
//
// 257/757  Spring 2014
// Homework #6
//Keyboard

//X: + x-axis rotation
//x: - x-axis rotation
//Y: + y-axis rotation
//y: - y-axis rotation
//Z: + z-axis rotation
//z: - z-axis rotation
//s: stop rotation
//Space: reset

//Mouse Movement:

//Left button
//Drag up: moves up
//Drag down:  moves down
//Drag left:  moves to the left
//Drag right:  moves to the right

// global variables

float transX        ;  // SX xis translation amounts

float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input
float transY;
float rotY;
float rotDeltaY;
float transZ;
float rotZ;
float rotDeltaZ;

void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   
   rotDeltaX  = 0;  // intially there is no rotation
   rotDeltaY=0;
   rotDeltaZ=0;
   rectMode(CENTER);
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
       fill(random(110), random(255), random(255), 220);
       noStroke();
       pushMatrix();
       translate( 0, -40, -60 );
       box(40);
       popMatrix();
       
         
     pushMatrix();
       translate( 0, -80, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 40, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 0, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, -120, -60 );
       box(40);
     popMatrix();
   
   pushMatrix();
       translate( 40, -120, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 80, -120, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( -40, -120, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( -80, -120, -60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 40, -20 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 40, 20 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 40, 60 );
       box(40);
     popMatrix();
     
     pushMatrix();
       translate( 0, 0, 60 );
       box(40);
     popMatrix();
} 

// Mantra for hw 6:  
//   translate, rotate, draw... translate, rotate, draw... translate, rotate, draw... 
// Do the required translations and rotations here before you draw anything.

// Delete, edit, or alter this code as you wish
void yourPrepareWindow( )
{
  lights();
  translate( transX, 0, 0 );
  translate(0,transY,0);
  translate(0,0,transZ);
  rotX += rotDeltaX;
  rotY +=rotDeltaY;
  rotZ +=rotDeltaZ;
  rotateX( radians( rotX ) );
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
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
  if (mouseButton == LEFT)
  {
    if (mouseX < pmouseX)
    {
      transX-= 1;
    }
  }
  if (mouseButton == LEFT)
  {
    if (pmouseY > mouseY)
    {
      transY-= 1;
    }
  }
  if (mouseButton == LEFT)
  {
    if (mouseY > pmouseY)
    {
      transY+=1;
    }
  }
  if (mouseButton == RIGHT)
  {
    if (pmouseY >  mouseY)
    {
      transZ+=5;
    }
  }
  if (mouseButton == RIGHT)
  {
    if (mouseY > pmouseY)
    {
      transZ-=5;
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
    else if (key=='x')
    {
      rotDeltaX -=1;
    }
    else if (key=='Y')
    {
      rotDeltaY +=1;
    }
    else if (key=='y')
    {
      rotDeltaY-=1;
    }
    else if (key=='Z')
    {
      rotDeltaZ+=1;
    }
    else if (key=='z')
    {
      rotDeltaZ-=1;
    }
    else if (key=='s')
    {
      rotX=0;
      rotY=0;
      rotZ=0;
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
      
    }
    else if (key==' ')
    {
    transX=0;
    transY=0;
    transZ=0;
    }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255);
  textAlign( LEFT );
  textSize(15);
  text("r o t a t i o n | X : " + abs(round(rotX)) + " , Y: " + abs(round(rotY)) + ", Z : " + abs(round(rotZ)) + " |", 20, 560, 0);
  text("t r a n s l a t i o n | X : " + round(transX) + " , Y: " + round(transY) + ", Z : " + round(transZ) + " |", 20, 580, 0);

}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center );
    translate( width/2, height/2, 0 );

    // turn on a white light placed at the camera position pointing to the back of the window.
    directionalLight( 255, 255, 255, 0, 0, -1 );
    lights();
    
        // draw axis lines
    strokeWeight( 3 );
    stroke( 255 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 255);
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 255 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


