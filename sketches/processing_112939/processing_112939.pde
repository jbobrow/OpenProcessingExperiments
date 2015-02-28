
// Copyright: Angela Kolosky, Pittsburgh, PA 2013.

// 257/757  Fall 2013
// Homework #6

// global variables

float transX        ;
float transY        ;
float transZ        ;  // axis translation amounts

float rotX          ;  // axis rotation amounts
float rotDeltaX     ;  // amount of rotation change for each input

float rotY          ;  // axis rotation amounts
float rotDeltaY     ;  // amount of rotation change for each input

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
     // remove the next four lines:
     fill( 120,42,232 );
     stroke( 0 );
     noStroke();
     
     translate(-20,0);
     box( 20,200,20 );    
     
     translate(20,-50,-80);
     rotateZ(radians(-60));
     rotateY(radians(60));
     box(210,20,20);
     
     translate(20,50,-80);
     rotateZ(radians(60));
     rotateY(radians(30));
     box(130,20,20);  
     
} 


// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow( )
{
  lights();
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
       {
        transX+=1;
       }
     
     if (pmouseX > mouseX )
       {
        transX-=1;
       }
     
     if (pmouseY > mouseY)
       {
        transY-=1;
       }
     
     if (pmouseY < mouseY)
       {
        transY+=1;
       }
  }
  if (mouseButton == RIGHT )
  {
     if (pmouseY > mouseY)
       {
        transZ+=1;
       }
     
     if (pmouseY < mouseY)
       {
        transZ-=1;
       }
  }
  
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    if ( key == 'X' )  rotDeltaX+=.2;
    else if (key =='x') rotDeltaX-=.2;
    
    if ( key == 'Y' )  rotDeltaY+=.2;
    else if (key =='y') rotDeltaY-=.2;
    
    if ( key == 'Z' )  rotDeltaZ+=.2;
    else if (key =='z') rotDeltaZ-=.2;
    
    if ( key == 's' )  
    {
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
    } 

    if ( keyCode == ' ')
        {
        transX=0;
        transY=0;
        transZ=0; 
        }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 255 );
   textSize( 24 );
   textAlign( CENTER );
   text("ESCHER-ESQUE Blocks", 
          width*.5, height - 50 );
   textSize(12);
   textAlign(CORNER);
   text("ROTATION X:  " + rotX + "  Y:  " + rotY + "  Z:  " +rotZ,width*.05,height*.05);
   text("TRANSLATION X:  " + transX + "  Y:  " + transY + "  Z:  " + transZ,width*.05,height*.1);   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    translate( width/2, height/2, 0 ); 
}


