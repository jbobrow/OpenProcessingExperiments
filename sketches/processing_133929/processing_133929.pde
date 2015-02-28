
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #6
// 2/4/14

/*
Key Presses:
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
float transX        ;  // SX axis translation amounts
float transY;
float transZ;
float rotX          ;  // X axis rotation amounts
float rotY;  
float rotZ; 
float rotDeltaX     ;  // amount of X axis rotation change for each input
float rotDeltaY;
float rotDeltaZ;
float shapeSize; // size of each box/sphere
float distUnit; // size of each distance unit
float indent; // size of text indent
float txtSize; // text size
float lineSize; // height of a line of text

// ***************************************************
void setup( )
{
   size(600,600,P3D);
   
   // initialize rotation variables
   rotX  = 0;  
   rotY = 0;
   rotZ = 0;
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   
   // initialze shape variables
   shapeSize = 10;
   distUnit = shapeSize*2;
   
   // initialize text-related variables
   txtSize = 18;
   lineSize = txtSize*1.25;
   indent = lineSize*1.5;
}

// ***************************************************
void draw( )
{
   pushMatrix( );
     prepareWindow( );
     drawInitial( );
   popMatrix( );
   // The pushMatrix( ) / popMatrix( ) pair are used
   // so the stats will always be drawn in the same place on
   // the graphics window.
   showStats( );
}

// ***************************************************
// DrawYour initial here
void drawInitial( )
{  
  noStroke();
  fill(255,0,100);
  
  // top section
  pushMatrix();
    translate(-distUnit*1.5,-distUnit*1.25,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(-distUnit,-distUnit*2.25,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(0,-distUnit*2.75,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(distUnit,-distUnit*2.5,-distUnit*.5);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(distUnit*1.5,-distUnit*1.5,-distUnit);
    sphere(shapeSize);
  popMatrix();
  
  // center
  pushMatrix();
    translate(-distUnit,-distUnit*.25,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(0,0,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(distUnit,distUnit*.25,0);
    sphere(shapeSize);
  popMatrix();
  
  // bottomY section
  pushMatrix();
    translate(distUnit*1.5,distUnit*1.25,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(distUnit,distUnit*2.25,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(0,distUnit*2.75,0);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(-distUnit,distUnit*2.5,distUnit*.5);
    sphere(shapeSize);
  popMatrix();
  pushMatrix();
    translate(-distUnit*1.5,distUnit*1.5,distUnit);
    sphere(shapeSize);
  popMatrix();  
} 

// ***************************************************
void mouseDragged( )
{
  // check for left mouse button 
  if (mouseButton == LEFT ){
    if (pmouseX < mouseX ){
      // dragged right
      transX+=1;
    }
    if(pmouseX > mouseX){
      // dragged left
      transX-=1;
    }
    if(pmouseY > mouseY){
      // dragged up
      transY-=1;
    }if(pmouseY < mouseY){
      // dragged down
      transY+=1;
    }
  }
  
  // check for right mouse button
  if (mouseButton == RIGHT){
    if(pmouseY > mouseY){
      // dragged up
      // increase Z (moves closer)
      transZ+=1;
    }if(pmouseY < mouseY){
      // dragged down
      // decrease Z (moves farther)
      transZ-=1;
    }
  }
} 

// ***************************************************
void keyPressed( )
{
    // x-axis rotation in positive direction
    if ( key == 'X'){
       rotDeltaX += 1;
    }
    
    // x-axis rotation in negative direction
    if ( key == 'x'){
       rotDeltaX -= 1;
    }
    
    // y-axis rotation in positive direction
    if ( key == 'Y'){
       rotDeltaY += 1;
    }
    
    // y-axis rotation in negative direction
    if ( key == 'y'){
       rotDeltaY -= 1;
    }
    
    // z-axis rotation in positive direction
    if ( key == 'Z'){
       rotDeltaZ += 1;
    }
    
    // z-axis rotation in negative direction
    if ( key == 'z'){
       rotDeltaZ -= 1;
    }
    
    // stop rotation
    if ( key == 's'){
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
    
    // set all translation variables to zero (rotations continue)
    if ( key == ' '){
      transX = 0;
      transY = 0;
      transZ = 0;
    }
    
    // reset
    if ( key == 'r'){
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

// ***************************************************
void showStats( )
{
   textSize(txtSize);
   
   // Rotations
   textAlign(CENTER);
   fill(255,0,100);
   text("Rotations:", width/2, indent);
   // Rot X Y Z
   fill(255);
   text("X: " + rotX,width/4,indent+lineSize);
   text("Y: " + rotY,width/2,indent+lineSize);
   text("Z: " + rotZ,width*3/4,indent+lineSize);
   // Rot Delat X Y Z
   text("delta-X: " + rotDeltaX,width/4,indent+(lineSize*2));
   text("delta-Y: " + rotDeltaY,width/2,indent+(lineSize*2));
   text("delta-Z: " + rotDeltaZ,width*3/4,indent+(lineSize*2));
   
   // Translations
   fill(255,0,100);
   text("Translations:",width/2,height-indent-(2*lineSize));
   fill(255);
   text("X: " + transX,width/4,height-indent-lineSize);
   text("Y: " + transY,width/2,height-indent-lineSize);
   text("Z: " + transZ,width*3/4,height-indent-lineSize);
   
}

// ***************************************************
void prepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center );
    translate( width/2, height/2, 0 );

    // turn on a white light placed at the camera position 
    // light direction is pointing towards the back of the screen, partially from the top left
    directionalLight( 255, 255, 255, .5, .5, -1 );
    
    // translate in all directions
    translate( transX, transY, transZ );
    
    // rotate in all directions
    rotX += rotDeltaX;
    rotY += rotDeltaY;
    rotZ += rotDeltaZ;
    
    rotateX( radians( rotX ) );
    rotateY( radians( rotY ) );
    rotateZ( radians( rotZ ) );
  
    // draw axis lines
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


