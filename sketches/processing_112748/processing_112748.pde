
// Required stuff goes here:
//
//
//
// 257/757  Fall 2013
// Homework #6
// Exploring 3D with tools from the first five homeworks

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// You may use, alter, or delete any of this..

// global variables

float transX        ;  // axis translation amounts

float rotX          ;  // axis rotation amounts
float rotDeltaX     ;  // amount of rotation change for each input

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
  pointLight(255, 255, 255, 35, 40, 36);
  popMatrix( );
  // The pushMatrix( ) / popMatrix( ) pair are used
  // so the stats will always be drawn in the same place on
  // the graphics window.
  showStats( );
}

// DrawYour initial here
void drawInitial( )
{  
  // remove the next four lines:
  fill( 239, 89, 85);
  noStroke();
  pushMatrix();
  translate(-90, 0, 0);
  box (10, 200, 80);
  popMatrix();

  pushMatrix();
  translate(-50, 0, 0);
  box (10, 200, 80);
  popMatrix();

  pushMatrix();
  translate(-10, -100, 0);
  box (230, 10, 80);
  popMatrix();

  pushMatrix();
  translate(-10, 100, 0);
  box (230, 10, 80);
  popMatrix();

  pushMatrix();
  translate(-25, 0, 0);
  box (50, 10, 80);
  popMatrix();
  
  //serifs
  pushMatrix();
  translate(95, -80, 0);
  box (20, 40, 80);
  popMatrix();

  pushMatrix();
  translate(95, 80, 0);
  box (20, 40, 80);
  popMatrix();

  pushMatrix();
  translate(10, 0, 0);
  box (20, 40, 80);
  popMatrix();
  
  //panel
  fill(200);
  pushMatrix();
  translate(-70,0,0);
  box (40, 200, 5);
  popMatrix();



  //spheres
  fill(20);
  noStroke();
  pushMatrix();
  translate(-70, 80, -30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, 40, -30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, 0, -30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, -40, -30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, -80, -30);
  sphere (9);
  popMatrix();

  //spheres 2
  pushMatrix();
  translate(-70, 80, 30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, 40, 30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, 0, 30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, -40, 30);
  sphere (9);
  popMatrix();

  pushMatrix();
  translate(-70, -80, 30);
  sphere (9);
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

// Expand this to satisfy the specificaions:
void keyPressed( )
{
  if ( key == 'X' ) rotDeltaX+=.2;
  else if ( key == 'x') rotDeltaX-=.2;
  else if ( key == 'Y') rotDeltaY+=.2;
  else if ( key == 'y') rotDeltaY-=.2;
  else if ( key =='Z') rotDeltaZ+=.2;
  else if ( key =='z') rotDeltaZ-=.2;
  else if ( key == ' ')
  {
    transX=0;
    transY=0;
    transZ=0;
  
  }
  else if ( key =='s') 
  {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }
}  

// Change any part or all of this and expand it to
// satisfy the spe]cifications:
void showStats( )
{
  fill( 255 );
  textAlign( LEFT );
  textSize(15);
  text("ROTATION (X " + abs(round(rotX)) + ", Y " + abs(round(rotY)) + ", Z " + abs(round(rotZ)) + ")", 20, 560, 0);
  text("TRANSLATION (X " + round(transX) + ", Y " + round(transY) + ", Z " + round(transZ) + ")", 20, 580, 0);
}


void jimsPrepareWindow( )
{
  // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
  background( 20 );  
  translate( width/2, height/2, 0 );
}



