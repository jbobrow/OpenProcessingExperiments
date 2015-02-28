
// HW #6
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved

// X axis: 'X' and 'x' to rotate on axis
// Y axis: 'Y' and 'y' to rotate on axis 
// Z axis: 'Z' and 'z' to rotate on axis
// 'S' to reset translation and rotation
// Space to reset translation
// Right click and drag to zoom along Z plane
// Left click and drag to move shape X plane


float transX, transY, transZ;  // axis translation amounts
float rotX, rotY, rotZ;  // axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ;  // amount of rotation change for each input

float soc; // speed of change

void setup()
{
   size( 600, 600, P3D );
   background( 25, 20, 103);
   transX = 0;
   transY = 0;
   transZ = 0;
   rotX = 0;
   rotY = 0;
   rotZ= 0;
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   soc = 2;
}

void draw()
{
   pushMatrix();
     drawAxis();
     yourPrepareWindow();
     directionalLight(0, 102, 255, 0, -1, 0);
     drawInitial();
   popMatrix();
   lights();
   showStats();
}

// DrawYour initial here
void drawInitial()
{  
     strokeWeight(2);
     stroke(252, 150, 25);
     fill(203, 59, 6);
     

     float thick = 30;
     float distance = 30;
     translate(-thick*3, 0, 0);
     box(thick, thick*4, thick*4);
     translate(thick, -thick/2, thick/2);
     box(thick, thick, thick);
     translate(thick, thick, -thick);
     box(thick, thick, thick);
     translate(thick, thick, -thick);
     box(thick, thick, thick);
     translate(thick, -thick, thick);
     box(thick, thick, thick);
     translate(thick, -thick, thick);
     box(thick, thick, thick);
     translate(thick, thick/2, -thick/2);
     box(thick, 4*thick, thick*4);
} 


// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow()
{
   rotX = rotX + rotDeltaX;
   rotY = rotY + rotDeltaY;
   rotZ = rotZ + rotDeltaZ;

   rotateX(radians(rotDeltaX+rotX));
   rotateY(radians(rotDeltaY+rotY));
   rotateZ(radians(rotDeltaZ+rotZ)); 
   translate(transX, transY, transZ); 
}

// Expand this to satisfy the specificaions;
void mouseDragged() 
{
  if(mouseButton == LEFT) 
  {
    if(pmouseX < mouseX)
      transX = transX + soc;
    else if(pmouseX > mouseX) 
      transX = transX - soc;
    if(pmouseY < mouseY) 
      transY = transY + soc;
    else if(pmouseY > mouseY) 
      transY = transY - soc;
  }
  if(mouseButton == RIGHT) 
  {
    if(pmouseY < mouseY) 
      transZ = transZ + 2*soc;
    else if(pmouseY > mouseY) 
      transZ = transZ - 2*soc;
  }
}

// Expand this to satisfy the specificaions:
void keyPressed()
{
    if ( key == 'X' )  
      rotDeltaX = rotDeltaX + soc;
    if ( key == 'x' )  
      rotDeltaX = rotDeltaX - soc;
    if ( key == 'Y' )  
      rotDeltaY = rotDeltaY + soc;
    if ( key == 'y' )  
      rotDeltaY = rotDeltaY - soc;
    if ( key == 'Z' )  
      rotDeltaZ = rotDeltaZ + soc;
    if ( key == 'z' )  
      rotDeltaZ = rotDeltaZ - soc;
    if(key == 's') 
    {
      rotX = 0;
      rotY = 0;
      rotZ = 0;
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
    if(key == ' ') 
    {
      transX = 0;
      transY = 0;
      transZ = 0;
    }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats()
{
  fill( 255 );
  textSize(15);
  textAlign( CENTER );
  text("Rotation X: " + abs(round(rotX)) +  ", Y: " + abs(round(rotY)) +  ", Z: " + abs(round(rotZ)), width*.5, height*.87);
  text("Translation X: " + round(transX) +  ", Y: " + round(transY) +  ", Z: " + round(transZ), width*.5, height*.9);
}

void drawAxis()
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    translate( width/2, height/2, 0 );
    
    // remove the follow when you are done
    // draw axis lines
    /*
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
    */
}
