
// Lauren Hartman
// lmhartma@andrew.cmu
// copyright Lauren Hartman, Sept. 2013
 
// global variables
 
float transX;
 
float rotX; 
float rotDeltaX;  
 
float transY;
float rotY;
float rotDeltaY;
 
float transZ;
float rotZ;
float rotDeltaZ;
 
void setup( )
{
  size(600, 600, P3D);
  rotDeltaX= 0;
  rotDeltaY= 0;
  rotDeltaZ=0;
  rectMode(CENTER);
}
 
void draw( )
{
  pushMatrix( );
  jimsPrepareWindow( );
  myPrepareWindow( );
  drawInitial( );
  pointLight(255, 255, 255, 35, 40, 36);
  popMatrix( );
  showStats( );
}
 
// L
void drawInitial( )
{ 
  noFill ();
  stroke( 255 );
  strokeWeight(1);
  pushMatrix();
  translate(-70, 0, 0);
  box (10, 180, 75);
  popMatrix();
 
  pushMatrix();
  translate(0, 86, 0);
  box (150, 10, 75);
  popMatrix(); 
}
 
void myPrepareWindow( )
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
      transX+=5;
    }
 
    else if (pmouseX > mouseX )
    {
      transX-=2;
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
  if ( key == 'X' ) rotDeltaX+=.5;
  else if ( key == 'x') rotDeltaX-=.5;
  else if ( key == 'Y') rotDeltaY+=.5;
  else if ( key == 'y') rotDeltaY-=.5;
  else if ( key =='Z') rotDeltaZ+=.5;
  else if ( key =='z') rotDeltaZ-=.5;
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
 
void showStats( )
{
  fill( 255 );
  textAlign( LEFT );
  textSize(15);
  text("Rotation (X:"+abs(round(rotX))+", Y:"+abs(round(rotY))+", Z:"+abs(round(rotZ))+")", 20, 560, 0);
  text("Translation (X:"+round(transX)+", Y:"+round(transY)+", Z:"+round(transZ)+")", 20, 580, 0);
}
 
 
void jimsPrepareWindow( )
{
  background( 48, 140, 200 ); 
  translate( width/2, height/2, 0 );
}
