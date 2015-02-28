
// Copyright, Shanna Chan, Pittsburgh PA
// HW 6
// Fall 2013

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// You may use, alter, or delete any of this..

// global variables

float transX, transY, transZ;  
      

float rotX, rotY, rotZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;

void setup( )
{
   size( 600, 600, P3D );
   rotDeltaX     = 0;
   rotDeltaY     = 0;
   rotDeltaZ     = 0;

}

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
  
    strokeWeight(1);
    stroke( 0, 200, 200 );
    noFill();
   
    box(50,50,150);
    translate(55,0,55);
    box(50);
    translate(0,55,-55);
    box(50,50,10);
    fill(255,50);
    translate(0,55,-55);
    box(50,50,300);
    noFill();
    translate(-55,0,110);
    box(50,50,10);
    translate(-55,0,-30);
    box(50);
    translate(0,-110,-80);
     fill(255,50);
    box(50,50,300);
    translate(0,-55,-20);
    noFill();
    box(50,50,150);
    translate(0,-55,-35);
    box(50);
     fill(255,50);
    translate(55, 0,75);
    box(50,50,10);
     fill(255,50);
    translate(55, 0, -55);
    box(50,50,150);
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

void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=2;
     }
   
  
  else if (pmouseX > mouseX )
    {
      transX-=2;
    }
 
    else if (pmouseY > mouseY)
    {
      transY-=2;
    }
 
    else if (pmouseY < mouseY)
    {
      transY+=2;
    }
  }
   
  if (mouseButton == RIGHT )
  {
    if (pmouseY < mouseY) transZ-=2;
    else if (pmouseY > mouseY) transZ+=2;
  }
}


void keyPressed( )
{
    if ( key == 'X' )  rotDeltaX+=.2;
    else if (key == 'x') rotDeltaX-=.2;
    else if (key == 'Y') rotDeltaY+=.2;
    else if (key == 'y') rotDeltaY+=.2;
     else if (key == 'Z') rotDeltaZ+=.2;
    else if (key == 'z') rotDeltaZ+=.2;
    else if (key == ' ')
    {
    transX=0;
    transY=0;
    transZ=0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
    }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255 );
   fill( 255 );
  textSize(15);
  textAlign( CENTER );
  text("Rotation X: " + abs(round(rotX)) +  ", Y: " + abs(round(rotY)) +  ", Z: " + abs(round(rotZ)), width*.5, height*.87);
  text("Translation X: " + round(transX) +  ", Y: " + round(transY) +  ", Z: " + round(transZ), width*.5, height*.9);

   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    translate( width/2, height/2, 0 );
    
    // remove the follow when you are done
    // draw axis lines
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
   // line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
   // line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
   // line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


