
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW6 Course 60257

// axis translation amounts
float transX, transY, transZ;
// axis rotation amounts
float rotX, rotY, rotZ;
// amount of rotation change for each input
float rotDeltaX, rotDeltaY, rotDeltaZ;

void setup( )
{
  size(600, 600, P3D);
    transX = 0;
    transY = 0;
    transZ = 0;
    rotX = 0;
    rotY = 0;
    rotZ= 0;
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
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
   lights();
   showStats( );
}
 
// DrawYour initial here
void drawInitial( )
{ 
  // remove the next four lines:
    noFill();
    stroke(255, 20);
    strokeWeight(5);
    strokeCap(PROJECT);
    strokeJoin(MITER);
    translate( 0, 0);
    box(300, 300, 300);
    
    noStroke();
    fill(255, 50);
    translate(-50, 0, 0);
    box(30, 200, 25);    
    
    fill(255, 30);
    translate(40, 35, 60);
    rotate(-150);
    box( 125, 20, 20); 

    fill(255, 70);
    translate(-65, -65, -120);
    rotate(PI/2.0);
    box( 125, 30, 30);
 
    fill(255, 10);
    translate(70, -100, 180);
    rotate(PI/3.0);
    box( 110, 20, 20);
 
    fill(255, 10);
    translate(70, 100, -240);
    rotate(100);
    box( 150, 30, 30);    
}
 
 
// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow( )
{
  directionalLight(51,102,126,-1,0,-1);
  translate(transX,0,0);
  translate(0,transY,0);
  translate(0,0,transZ);
  rotX += rotDeltaX;
  rotateX(radians(rotX));
   
  rotY += rotDeltaY;
  rotateY(radians(rotY));
   
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
}
 
// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  if (mouseButton == LEFT )
{
     if (pmouseX < mouseX )
       {transX+=1;}
     if (pmouseX > mouseX )
       {transX-=1;}
     if (pmouseY > mouseY)
       {transY-=1;}
     if (pmouseY < mouseY)
       {transY+=1;}
}
  
  if (mouseButton == RIGHT )
{
    if (pmouseY > mouseY)
       {transZ+=1;}
    if (pmouseY < mouseY)
       {transZ-=1;}
}}
 
// Expand this to satisfy the specificaions:
void keyPressed( )
{
    if ( key == 'X' )  rotDeltaX+=.2;
    else if (key =='x') rotDeltaX-=.2;
     
    if ( key == 'Y' )  rotDeltaY+=.2;
    else if (key =='y') rotDeltaY-=.2;
     
    if ( key == 'Z' )  rotDeltaZ+=.2;
    else if (key =='z') rotDeltaZ-=.2;
    
    else if ( key == ' ')
    {transX= 0;
    transY= 0;
    transZ= 0;
    }
    
     else if ( key =='s')
  {rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotDeltaX=0;
    rotDeltaY=0;
    rotDeltaZ=0;
  }} 
 
// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255, 90);
   textSize( 24 );
   textAlign( CENTER );
   text("K", width*.5, height*.9);
   textSize( 12 );
   text("Rotation X: " + abs(round(rotX)) +  ", Y: " + abs(round(rotY)) +  ", Z: " + abs(round(rotZ)), width*.5, height*.95);
   text("Translation X: " + round(transX) +  ", Y: " + round(transY) +  ", Z: " + round(transZ), width*.5, height*.975);
}
 
 
void jimsPrepareWindow( )
{
  // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 0 ); 
    translate( width/2, height/2, 0 );
  }



