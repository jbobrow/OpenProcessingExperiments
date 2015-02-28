
//sam friedlander
// copywrite 2013




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

float transY        ;  // axis translation amounts
float rotY          ;  // axis rotation amounts
float rotDeltaY     ;

float transZ        ;  // axis translation amounts
float rotZ          ;  // axis rotation amounts
float rotDeltaZ     ;
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
  fill( 255, 250, 116);
  noStroke();

  pushMatrix();
  translate(-20, -20, 0);
  box (20, 60, 40);
  popMatrix();

  pushMatrix();
  translate(20, 20, 0);
  box (20, 60, 40);
  popMatrix();

  //horizonals
  pushMatrix();
  translate(10, -40, 0);
  box (40, 20, 40);
  popMatrix();

  pushMatrix();
  translate(0, 0, 0);
  box (20, 20, 40);
  popMatrix();

  pushMatrix();
  translate(-10, 40, 0);
  box (40, 20, 40);
  popMatrix();

  //background box

    fill( 174, 255, 255);
  pushMatrix();
  translate(8, -11, -30);
  box (80, 130, 20);
  popMatrix();

  fill( 174, 255, 255);
  pushMatrix();
  translate(106, -11, -50);
  box (80, 130, 20);
  popMatrix();

  fill( 174, 255, 255);
  pushMatrix();
  translate(-90, -11, -60);
  box (80, 130, 20);
  popMatrix();
} 


// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow( )
{
   directionalLight(255, 255, 255, -25, 0, -500);
  
  translate (transX, transY, transZ);
  rotateX (radians (rotX) );
  rotX += rotDeltaX;
  

 
  rotateY (radians (rotY) );
  rotY += rotDeltaY;
 
  
  
  rotateZ (radians (rotZ) );
  rotZ += rotDeltaZ;

}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
   if (pmouseX < mouseX )
   {
      transX+=1;
   }
    else if (pmouseX > mouseX )
    {
      transX-=1;
    }
    if (pmouseY < mouseY )
    {
      transY+=1;
    }
    else if (pmouseY > mouseY )
    {
      transY-=1;
    }
  }
  
  if (mouseButton == RIGHT )
  {
    if (pmouseY> mouseY)
    {
      transZ+=1;
    }
    else if (pmouseY< mouseY)
    {
      transZ-=1;
    }
  }
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
  if ( key == 'X' )  
  {
    rotDeltaX+=.2;
  }
  else if (key == 'x') 
  {
    rotDeltaX-=.2;
  }
  else if (key == 'Y') 
  {
    rotDeltaY+=.2;
  }
  else if (key == 'y')
  {
    rotDeltaY-=.2;
  }
  else if (key == 'Z') 
  {
    rotDeltaZ+=.2;
  }
  else if (key == 'z')
  {
    rotDeltaZ-=.2;
  }
  else if  (key == ' ')
  {
    transX=0;
    transY=0;
    transZ=0;
  }
  else if (key == 's')
  {
    rotX= 0;
    rotY= 0;
    rotZ= 0;

    rotDeltaX= 0;
    rotDeltaY= 0;
    rotDeltaZ= 0;
  }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
  fill( 255 );
  textSize( 12);
textAlign( LEFT );
   fill( 174, 255, 255 );
   text("Distance:",                     width*.01666667, height* .83333333 );
   text("LEFT OR RIGHT:    " + int(transX),      width*.01666667, (height* .83333333)+20 );
   text("ABOVE OR BELOW:    " + int(transY),      width*.01666667, (height* .83333333)+40 );
   text("TOWARDS OR AWAY:    " + int(transZ),      width*.01666667, (height* .83333333)+60 ); 
   text("TRANSLATION RATES: ",                 width*.333333, (height* .83333333));
   text( "X: " + (rotDeltaX), width*.333333, (height* .83333333)+20);
   text( "Y: " + (rotDeltaY), width*.333333, (height* .83333333)+40);
   text( "Z: " + (rotDeltaZ), width*.333333, (height* .83333333)+60);
   text("ROTATION:",                     width*.6666666, (height* .83333333) );
   text("X: " + int(rotX%360),       width*.6666666,(height* .83333333)+20 );
   text("Y: " + int(rotY%360),       width*.6666666, (height* .83333333)+40 );
   text("Z: " + int(rotZ%360),       width*.6666666, (height* .83333333)+60); 
}


void jimsPrepareWindow( )
{
  // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
  background( 150 );  
  translate( width/2, height/2, 0 );

 
}


   
 
   
   




