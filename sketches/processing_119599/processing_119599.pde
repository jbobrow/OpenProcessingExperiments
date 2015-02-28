
// Copyright William Aldrich, Pittsburgh, PA September 17, 2013
//
//
//
// 257/757  Fall 2013
// Homework #6
// Exploring 3D with tools from the first five homeworks

// global variables

float transX        ;  // axis translation amounts
float transY        ;  
float transZ        ;

float rotX          ;  // axis rotation amounts
float rotDeltaX     ;  // amount of rotation change for each input
float rotY          ;
float rotDeltaY     ;
float rotZ          ;
float rotDeltaZ     ;

void setup( )
{
   size( 600, 600, P3D );

   rotDeltaX = 0;
   rotDeltaY = 0;
   
   

}

void draw( )
{
  directionalLight (255,0,0,1,0,0);
  directionalLight (0,255,0,0,-1,0);
  directionalLight (0,0,255,0,1,0);
  directionalLight (200,0,200,-1,0,0);
  directionalLight (30,30,30,0,0,-1);
   pushMatrix( );
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
    noStroke();
//first line
    pushMatrix();
     translate(-140,-140,150);
     box(30);
     popMatrix();
    pushMatrix();
     translate(-125,-105,125);
     box(15);
     popMatrix();
    pushMatrix();
     translate(-110,-70,100);
     box(30);
     popMatrix();
    pushMatrix();
     translate(-95,-35,75);
     box(15);
     popMatrix();
    pushMatrix();
     translate(-80,0,50);
     box(30);
     popMatrix();
    pushMatrix();
     translate(-65,35,25);
     box(15);
     popMatrix();
    pushMatrix();
     translate(-50,70);
     box(30);
     popMatrix();
//second line
    pushMatrix();
     translate(40,-140,-150);
     box(30);
     popMatrix();
    pushMatrix();
     translate(25,-105,-125);
     box(15);
     popMatrix();
    pushMatrix();
     translate(10,-70,-100);
     box(30);
     popMatrix();
    pushMatrix();
     translate(-5,-35,-75);
     box(15);
     popMatrix();
    pushMatrix();
     translate(-20,0,-50);  
     box(30);
     popMatrix();
    pushMatrix();
     translate(-35,35,-25);
     box(15);
     popMatrix();
//final line
    pushMatrix();
     translate(140,-140,-300);
     box(30);
     popMatrix();
    pushMatrix();
     translate(125,-105,-250);
     box(15);
     popMatrix();
    pushMatrix();
     translate(110,-70,-200);
     box(30);
     popMatrix();
    pushMatrix();
     translate(105,-35,-150);
     box(15);
     popMatrix();
    pushMatrix();
     translate(80,0,-100);
     box(30);
     popMatrix();
    pushMatrix();
     translate(65,35,-50);
     box(15);
     popMatrix();
    pushMatrix();
     translate(50,70);
     box(30);
     popMatrix();
    pushMatrix();
     translate(35,105,50);
     box(15);
     popMatrix();
    pushMatrix();
     translate(20,140,100);
     box(30);
     popMatrix();
} 

void yourPrepareWindow( )
{
  background(0);
  translate( width/2, height/2, 0 );
  //lights( );
  translate( transX, transY, transZ );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );
}

void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX ) transX+=1;
     else if (pmouseX > mouseX ) transX-=1;
     else if (pmouseY < mouseY ) transY+=1;
     else if (pmouseY > mouseY ) transY-=1;
  }
  
  if (mouseButton == RIGHT )
  {
     if (pmouseY > mouseY) transZ+=1;
     else if (pmouseY < mouseY) transZ-=1;
  }
}


void keyPressed( )
{
    if ( key == 'X' )  rotDeltaX+=.2;
    else if ( key == 'x' ) rotDeltaX-=.2;
    else if ( key == 'Y' ) rotDeltaY+=.2;
    else if ( key == 'y' ) rotDeltaY-=.2;
    else if ( key == 'Z' ) rotDeltaZ+=.2;
    else if ( key == 'z' ) rotDeltaZ-=.2;
    else if ( key == 's' )
    {
      rotDeltaX=0;
      rotX=0;
      rotDeltaY=0;
      rotY=0;
      rotDeltaZ=0;
      rotZ=0;
    }
    else if ( key == ' ' )
    {
      transX=0;
      transY=0;
      transZ=0;
    }
}  

void showStats( )
{
   fill( 255 );
   textSize( 24 );
   textAlign( LEFT );
//   print (rotX);
   text("ROTATION X: " + (rotX), width*.66, height-5 );
   text("ROTATION Y: " + (rotY), width*.66, height-30 );
   text("ROTATION Z: " + (rotZ), width*.66, height-55 );
   
   text("TRANSLATION X: " + (transX), 5, height-5);
   text("TRANSLATION Y: " + (transY), 5, height-30);
   text("TRANSLATION Z: " + (transZ), 5, height-55);
   
}


