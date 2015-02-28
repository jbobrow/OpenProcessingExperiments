
// kevin kan copyright©2014
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

float rotX, rotY, rotZ; 
float rotDeltaX, rotDeltaY, rotDeltaZ;
float transX, transY, transZ;


void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   
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
     // Letter K
     fill( 100, 200, 25 );
     noStroke();
     
     pushMatrix();
     translate(-50,0,0);
     box(50,200,50);
     popMatrix();
     
     pushMatrix();
     translate(0,0,0);
     box(50,50,50);
     popMatrix();
     
     pushMatrix();
     translate(0,0,-80);
     box(50,50,50);
     popMatrix();
     
     pushMatrix();
     translate(0,0,80);
     box(50,50,50);
     popMatrix();
     
     pushMatrix();
     translate(30,54,0);
     box(50,96,50);
     popMatrix();
     
     pushMatrix();
     translate(30,-54,0);
     box(50,96,50);
     popMatrix();
     
     //Serifs
     pushMatrix();
     translate(-50,-100,0);
     box(75,20,75);
     popMatrix();
     
     pushMatrix();
     translate(30,-100,0);
     box(75,20,75);
     popMatrix();
     
     pushMatrix();
     translate(-50,100,0);
     box(75,20,75);
     popMatrix();
     
     
     pushMatrix();
     translate(30,100,0);
     box(75,20,75);
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
   
  translate(0,transY,0);
  rotY +=rotDeltaY;
  rotateY (radians (rotY));
   
  translate (0,0, transZ);
  rotZ +=rotDeltaZ;
  rotateZ(radians(rotZ));
   

}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
   // check for mouse button 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseX < mouseX ){
        transX+=10;
     }
     if (pmouseX > mouseX ){
        transX+=-10;
     }
     if (pmouseY < mouseY ){
        transY+=10;
     }
     if (pmouseY > mouseY ){
        transY-=10;
     }
  }
  if (mouseButton == RIGHT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseY < mouseY ){
        transZ-=10;
     }
     if (pmouseY > mouseY ){
        transZ+=10;
      }
  }
}

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    // test to see if X axis rotation is increased in positive direction
    if ( key == 'X' ){
          rotDeltaX += 1;
    }
    if ( key == 'x' ){
       rotDeltaX -= 1;
    }
    if ( key == 'Y' ){
       rotDeltaY += 1;
    }
    if ( key == 'y' ){
       rotDeltaY -= 1;
    }
    if ( key == 'Z' ){
       rotDeltaZ += 1;
    }
    if ( key == 'z' ){
       rotDeltaZ -= 1;
    }
    
    if ( key == 's') {
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
    
     if ( key == ' ') {
    transX = 0;
    transY = 0;
    transZ = 0;
    }
    }
}

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( ){
  
 fill(255,255,255);
 
 //Drag translate
 text("Translations",width/2,height-70);
 text("X: "+transX+"Y: "+transY+"    Z: "+transZ,width/2,height-40);
 
 //Key Rotation
 text("Rotations",width/2,50);
 text("    X: "+rotX+"    Y: "+rotY+"    Z: "+rotZ,width/2,80);
 text("Delta-X: "+rotDeltaX+"    Delta-Y "+rotDeltaY+"    Delta-Z "+rotDeltaZ,width/2,110);
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


