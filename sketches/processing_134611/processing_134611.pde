
// 257/757 Spring 2014
// Homework #6
// Risa Hiyama
// Exploring 3D with tools from the first five homeworks

// Strongly urge you to do your initial FIRST before you
// begin to explore the translation and rotation stuff.
// Explore translations first and satisfy the specifications; then
// explore the rotations.

// " " and s doesnt work
//z is it rotating in the right way?

// global variables

float transX ; // SX xis translation amounts

float rotX ; // X axis rotation amounts
float rotDeltaX ; // amount of X axis rotation change for each input

float transY ; // SX xis translation amounts

float rotY ; // X axis rotation amounts
float rotDeltaY ; // amount of X axis rotation change for each input

float transZ ; // SX xis translation amounts

float rotZ ; // X axis rotation amounts
float rotDeltaZ ; // amount of X axis rotation change for each input

color colBlue , colRed, colOrange;

void setup( )
{
size( 600, 600, P3D );
textSize( 18 );
textAlign( CENTER );
colBlue = color(60, 178, 170);
colRed = color(205, 38, 38);
colOrange = color(238, 118, 33);

rotDeltaX = 0; // intially there is no rotation
rotDeltaY = 0; // intially there is no rotation
rotDeltaZ = 0; // intially there is no rotation
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

void drawInitial( )
{       
// remove these lines and add your code to draw your initial:
//rectMode(CENTER);
noStroke();
fill( colBlue, 200);

pushMatrix();
translate(-100,-130, 0);
box(180,80,60); 
popMatrix();

pushMatrix();
translate(100,130, 0);
box(180,80,60); 
popMatrix();

pushMatrix();
translate(-100,130, 0);
box(180,80,60); 
popMatrix();

pushMatrix();
translate(-95,0, 0);
fill( colRed, 200);
box(80,250,60); 
popMatrix();

pushMatrix();
translate(-135,0, 0);
fill( colBlue, 200);
box(.25,250,60); 
popMatrix();


//cubes

pushMatrix();
fill( colRed, 200);
translate(40,-130,0);
box(80,80,60); 
popMatrix();

pushMatrix();
fill( colRed, 150);
translate(120,-70,0);
box(65,65,60); 
popMatrix();

pushMatrix();
fill( colRed, 140);
translate(50,0,0);
box(50,50,60); 
popMatrix();

pushMatrix();
fill( colRed, 130);
translate(-15 ,0 ,0);
box(50,50,60); 
popMatrix();

pushMatrix();
translate(50,30, 0);
box(30,30,60); 
popMatrix();

pushMatrix();
translate(90,70, 0);
box(30,30,60); 
popMatrix();

// little r
noStroke();
fill( colBlue, 200);
pushMatrix();
translate(-100,-90, -200);
sphere(40); 
popMatrix();

pushMatrix();
translate(-100,-160, -150);
sphere(40); 
popMatrix();

pushMatrix();
translate(-100,-140, -80);
sphere(40); 
popMatrix();

}

// Mantra for hw 6: 
// translate, rotate, draw... translate, rotate, draw... translate, rotate, draw... 
// Do the required translations and rotations here before you draw anything.

// Delete, edit, or alter this code as you wish
void yourPrepareWindow( )
{
translate( transX, 0, 0 );
rotX += rotDeltaX;
rotateX( radians( rotX ) ); //this is where it is making it rotate

translate( 0, transY, 0 );
rotY += rotDeltaY;
rotateY( radians( rotY ) ); //this is where it is making it rotate

translate( 0, 0 , transZ );
rotZ += rotDeltaZ;
rotateZ( radians( rotZ ) ); //this is where it is making it rotate

//lights(); //play with lights 
}

// Expand this to satisfy the specificaions;
void mouseDragged( )
{
  //if your LEFT mouse is clicked
  if (mouseButton == LEFT )  {

    //go right/left
    if (pmouseX < mouseX )  {
      transX+=3; } //go right
    if (pmouseX > mouseX )  {
      transX-=3; } //go left  

    //go up/down
    if (pmouseY > mouseY )  {
      transY-=3; }
    if (pmouseY < mouseY )  {
      transY+=3; }
  }

  //if your RIGHT mouse is clicked
  if (mouseButton == RIGHT )  {

    //go in 
    if (pmouseY > mouseY )  {
      transZ+=3; }
    if (pmouseY < mouseY )  { 
      transZ-=3; }
   }
}

// Expand this to satisfy the specificaions:
void keyPressed( )
{
// test to see if X axis rotation is increased in positive direction
if ( key == 'X' )  {
   rotDeltaX += 1;  }
if ( key == 'x' )  {
   rotDeltaX -= 1;  }

if ( key == 'Y' )  {
   rotDeltaY += 1;  }
if ( key == 'y' )  {
   rotDeltaY -= 1;  }

if ( key == 'Z' )  {
   rotDeltaZ += 1;  }
if ( key == 'z' )  {
   rotDeltaZ -= 1;  }

if ( key == 's' ) {
   rotDeltaX = 0; // intially there is no rotation
   rotDeltaY = 0; // intially there is no rotation
   rotDeltaZ = 0; // intially there is no rotation
   }

if ( key == ' ' )  {
   rotX = 0;
   rotY = 0;
   rotZ = 0;   
   }
   
if ( key == 'a' ) {
   transX = 0;
   transY = 0;
   transZ = 0; 
   
   }

}


// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255, 99, 80 );
   text("TansX Value:" + int(transX) + "pixels", width*.5, height - 100 );
   text( "rotX = " + rotX, 100, height - 40 );
   text( "rotY= " + rotY, 100, height - 20 );
   text( "rotZ = " + rotZ, 100, height-60 );
   //text("press x to rotate x axis ", 200, 80 );
   //text("press X to rotate x axis in the other direction", 200, 100  );
   //text("press x to rotate x axis "  );
  
}


void jimsPrepareWindow( ) 
{
  // change these next two lines at your own risk -- do so and... live dangerously... myhhhhaaaaaaaaaa
  background( 224, 255, 255 ); //dont change it. 
  // moves (0, 0, 0 ) point to the window center );
  translate( width/2, height/2, 0 ); //dont change it.

  // remove the follow when you are done
  // turn on a white light placed at the camera position pointing to the back of the window.
  directionalLight( 255, 255, 255, 0, 0, -1 ); //make it prettier 
  //(light color,light color,light color,xand which side is it casting on,y,z)
  //draw two rectagle and do a fake shadow?

  // draw axis lines draw it!! then move it ! 
  strokeWeight( 0.5 );
  stroke( 200, 200, 0 ); 
  line( 0, 0, 200, 0, 0, -200 ); // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 ); // Y axis line
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 ); // X axis line
}





