
//Copyright Colleen Clifford Pittsburgh PA Sept 2013
// Homework #6

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// global variables

float transX ;  // axis translation amounts
float transY;
float transZ;
float rotX;         // axis rotation amounts
float rotY;
float rotZ;
float rotDeltaX;  // amount of rotation change for each input
float rotDeltaY;
float rotDeltaZ;

void setup( )
{
   size( 600, 600, P3D );

   rotDeltaX     = 0;
   rotDeltaY     = 0;
   rotDeltaZ     = 0;
   rotX = 0;
   rotY = 0;
   rotZ = 0;

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
  fill(186, 255, 13);
  stroke(255, 203, 13);
  strokeWeight(2);
  box(10, 10, 110);
  
  pushMatrix();
  translate(-20, -10, 10);
  box(10, 10, 90);
  translate(-20, 10, 12);
  box(10, 10, 70);
  translate(-20, 15, 12); 
  box(10, 10, 50);
  translate(-10, 15, 10); 
  box(10, 10, 30);
  translate(0, 20, 10); 
  box(10, 10, 10);
  
  popMatrix();
  translate(0, 100, 6);
  box(10, 10, 90);
  translate(-20, 10, 10);
  box(10, 10, 70);
  translate(-20, -10, 12);
  box(10, 10, 50);
  translate(-20, -15, 12); 
  box(10, 10, 30);
  translate(-10, -15, 12); 
  box(10, 10, 10);     
} 

void yourPrepareWindow( ) //rotation and translation setup for intials
{
  translate( transX, 0 , 0); 
  rotX += rotDeltaX;
  rotateX( radians(rotX));
  
  translate( 0, transY, 0);
  rotY+= rotDeltaY;
  rotateY( radians(rotY));
  
  translate( 0, 0, transZ);
  rotZ+= rotDeltaZ;
  rotateZ( radians(rotZ));
  
}

void mouseDragged( ) //translates initial
{
  if (mouseButton == LEFT && pmouseX < mouseX)   transX+= 1;
  else if (mouseButton == LEFT && pmouseX > mouseX)  transX-= 1;
  
  if (mouseButton == LEFT && pmouseY < mouseY)   transY+= 1;
  else if (mouseButton == LEFT && pmouseY > mouseY)  transY-= 1;
  
  if (mouseButton == RIGHT && pmouseY < mouseY) transZ+= 1;
  else if (mouseButton == RIGHT && pmouseY > mouseY)  transZ-= 1;
} 


void keyPressed( ) //rotates initial
{
    if ( key == 'X' )  rotDeltaX+=.2; //increases rotation speed
    else if (key== 'x') rotDeltaX-=.2; //decrease speed
    if ( key == 'Y') rotDeltaY += .2; //increase Y rotation speed
    else if (key == 'y') rotDeltaY -= .2; //decrease Y speed
    if (key == 'Z') rotDeltaZ += .2; 
    else if( key == 'z') rotDeltaZ -= .2;
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255 );
   textSize( 14 );
   textAlign( CENTER );
   text ("ROTATIONS (x= " +(round(rotX)) + ")" +
                 " (y= " + (round(rotY)) + ")" +
                 " (z= " + (round(rotZ)) + ")"
                 , width*.5, height* .95 );
   text ( "TRANSLATIONS (x= " + (round(transX)) + ")" +
                      " (y= " + (round(transY)) + ")" +
                      " (z= " + (round(transZ)) + ")" 
                      , width* .5, height* .9 );
   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    translate( width/2, height/2, 0 );
    
    // remove the follow when you are done
    // draw axis lines
    //strokeWeight( 3 );
    //stroke( 200, 200, 0 ); 
    //line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    //stroke( 0, 200, 200 );
    //line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    //stroke( 200, 0, 200 );
    //line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


