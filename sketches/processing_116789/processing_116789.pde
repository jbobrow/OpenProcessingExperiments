
// HW 6
// Copyright Melissa Mak, October 2013, Pittsburgh, PA
// Exploring 3D with tools from the first five homeworks

float transX;  // axis translation amounts
float rotX;  // axis rotation amounts
float rotDeltaX;  // amount of rotation change for each input

float transY;
float rotY; 
float rotDeltaY;  

float transZ;
float rotZ; 
float rotDeltaZ; 


void setup( )
{
  size( 600, 600, P3D );
  rotDeltaX= 0;
  rotDeltaY= 0;
  rotDeltaZ=0;
  rectMode(CENTER);
}

void draw( )
{
  pushMatrix( );
    jimsPrepareWindow( );
    yourPrepareWindow( );
    drawInitial( );
    pointLight(255, 255, 255, 40, 40, 40);
  popMatrix( );
   showStats( );   
}

// DrawYour initial here
void drawInitial( )
{ 
  strokeWeight(3);
  stroke(0);
  
  //first stroke
  fill(202, 199, 224);
  pushMatrix();
  translate(-100, 75, 0);
  box(40, 15, 75);
  popMatrix();
 
  pushMatrix();
  translate(-100, 60, 0);
  box(40, 14, 75);
  popMatrix();

  pushMatrix();
  translate(-100, 45, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(136, 122, 232);
  pushMatrix();
  translate(-100, 30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(-100, 15, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(-100, 0, 0);
  box(40, 14, 75);
  popMatrix();
   
  pushMatrix();
  translate(-100, -15, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(97, 76, 242);
  pushMatrix();
  translate(-100, -30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(-100, -45, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(-100, -60, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(-100, -75, 0);
  box(40, 14, 75);
  popMatrix();
  
  // second stroke
  fill(202, 199, 224);
  pushMatrix();
  translate(0, 75, 0);
  box(40, 15, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, 60, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, 45, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(136, 122, 232);
  pushMatrix();
  translate(0, 30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, 15, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, -15, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(97, 76, 242);
  pushMatrix();
  translate(0, -30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, -45, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(0, -60, 0);
  box(40, 14, 75);
  popMatrix();
  
  // third stroke
  
  fill(202, 199, 224);
  pushMatrix();
  translate(100, 75, 0);
  box(40, 15, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, 60, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, 45, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(136, 122, 232);
  pushMatrix();
  translate(100, 30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, 15, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, 0, 0);
  box(40, 14, 75);
  popMatrix();
   
  pushMatrix();
  translate(100, -15, 0);
  box(40, 14, 75);
  popMatrix();
  
  fill(97, 76, 242);
  pushMatrix();
  translate(100, -30, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, -45, 0);
  box(40, 14, 75);
  popMatrix();
  
  pushMatrix();
  translate(100, -60, 0);
  box(40, 14, 75);
  popMatrix();

  // connectors
  fill(97, 76, 242);
  pushMatrix();
  translate(-60, -35, 0);
  rotate((PI/3), 0, 0, 1);
  box(15, 100, 70);
  popMatrix();
  
  pushMatrix();
  translate(40, -35, 0);
  rotate((PI/3), 0, 0, 1);
  box(15, 100, 70);
  popMatrix();
 
}

// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow( )
{
  lights();
  translate (transX, 0, 0);
  rotateX (radians(rotX));
  rotX += rotDeltaX;
 
  translate (0, transY, 0);
  rotateY (radians(rotY));
  rotY += rotDeltaY;
 
  translate (0, 0, transZ);
  rotateZ (radians(rotZ));
  rotZ += rotDeltaZ;
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
    if (pmouseX < mouseX )
    {
      transX+=mouseX/25;
    }
  
    else if (pmouseX > mouseX )
    {
      transX-=mouseX/25;
    }
  
    else if (pmouseY > mouseY)
    {
      transY-=5;
    }
  
    else if (pmouseY < mouseY)
    {
      transY+=5;
    }
  }
    
  if (mouseButton == RIGHT )
  {
    if (pmouseY < mouseY) transZ-=5;
    else if (pmouseY > mouseY) transZ+=5;
    
  }
}

 
// Expand this to satisfy the specificaions:
void keyPressed( )
{
  if ( key == 'x' ) rotDeltaX+=.3;
  else if (key == 'X') rotDeltaX-=.3;
  else if (key == 'y') rotDeltaY+=.3;
  else if (key == 'Y') rotDeltaY-=.3;
  else if (key == 'z') rotDeltaZ+=.3;
  else if (key == 'Z') rotDeltaZ-=.3;
  else if ( key == ' ')
  {
    transX= 0;
    transY= 0;
    transZ= 0;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }
}

void showStats( )
{
  fill(255);
  textAlign(LEFT);
  textSize(14);
  text("rotation (X " + abs(round(rotX)) + ", Y " + abs(round(rotY)) + ", Z " + abs(round(rotZ)) + ")", 20, 560, 0);
  text("translation (X " + round(transX) + ", Y " + round(transY) + ", Z " + round(transZ) + ")", 20, 580, 0);
}

void jimsPrepareWindow( )
{
    background(0);  
    translate(width/2, height/2, 0);
}


