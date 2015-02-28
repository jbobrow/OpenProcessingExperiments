
//copyright Irene Joung 2014
//homework #6
// Exploring 3D with tools from the first five homeworks

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// You may use, alter, or delete any of this..

// global variables

float transX        ;  // transX is translation amounts
float rotX          ;  // rotX axis rotation amounts
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
   fill(186,237,98);
   noStroke();
   box( 50 );    
   
   pushMatrix();
   translate(0,60,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,120,0);
   box(50);
   popMatrix();

   pushMatrix();
   translate(0,-60,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,60);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,-60);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-60,120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-120,120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-120,60,0);
   box(50);
   popMatrix();
   
} 

// Mantra for hw 6:  
//   translate, rotate, draw... translate, rotate, draw... translate, rotate, draw... 
// Do the required translations and rotations here before you draw anything.

// Delete, edit, or alter this code as you wish
void yourPrepareWindow( )
{
  lights();
  directionalLight(255,255,255,0,0,1);
  
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  
  translate(0,transY,0);
  rotY += rotDeltaY;
  rotateY(radians(rotY));
  
  translate(0,0,transZ);
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
  
        // draw axis lines
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
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseX < mouseX )//move right
     {
        transX+=1;
     }
     else if (pmouseX > mouseX)//move left
     {
       transX+=-1;
     }
     else if (pmouseY < mouseY)//move up
     {
       transY+=1;
     }
     else if (pmouseY > mouseY)//move down
     {
       transY+=-1;
     }
  }
  
  if (mouseButton == RIGHT)
  {
    if (pmouseY > mouseY)
    {
      transZ+=1;
    }
    else if (pmouseY < mouseY)
    {
      transZ+=-1;
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
    if (key == 'x')
    {
      rotDeltaX += -1;
    }
    if (key == 'Y')
    {
      rotDeltaY += 1;
    }
    if (key == 'y')
    {
      rotDeltaY += -1;
    }
    if (key == 'Z')
    {
      rotDeltaZ += 1;
    }
    if (key == 'z')
    {
      rotDeltaZ += -1;
    }
    if (key == 's')
    {
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
    if (key == ' ')
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
   textSize(15);
   
   text("TransX Value:" + int(transX) +"pixels",  width*.47, height - 60 );
   text("TransY Value:" + int(transY) +"pixels", width*.47, height - 40);
   text("TransZ Value:" + int(transZ) +"pixels", width*.47, height - 20);
   
   text("RotX Value:" + int(rotX) +"pixels", width*.15, height -60);
   text("RotY Value:" + int(rotY) +"pixels", width*.15, height -40);
   text("RotZ Value:" + int(rotZ) +"pixels", width*.15, height -20);
   
   text("RotDeltaX Value:" + int(rotDeltaX) +"pixels", width*.8, height -60);
   text("RotDeltaY Value:" + int(rotDeltaY) +"pixels", width*.8, height -40);
   text("RotDeltaZ Value:" + int(rotDeltaZ) +"pixels", width*.8, height -20);
  
   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center );
    translate( width/2, height/2, 0 );
    //^don't change this!

    // remove the follow when you are done
    // turn on a white light placed at the camera position pointing to the back of the window.
    //directionalLight( 255, 255, 255, 0,0,-1 );
    //lights();  
}


