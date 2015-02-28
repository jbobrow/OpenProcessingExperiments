
// HW6 Stephanie Jeong yujeongj Copyright 2014


// global variables

float transX;
float transY;
float transZ;
float rotX;
float rotDeltaX;
float rotY;
float rotDeltaY;
float rotZ;
float rotDeltaZ;
void setup( )
{
   size( 600, 600, P3D );
   textSize( 24 );
   textAlign( CENTER );
   
   rotDeltaX=0;
   rotDeltaY=0;
   rotDeltaZ=0;
}


void draw( )
{
   pushMatrix( );
     jimsPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   showStats( );
    
}


// Initial

void drawInitial( )
{  
  fill(random(0,255), random(0, 255), random(0, 255), 100);
   noStroke();
   box( 50 );   
    
   pushMatrix();
   translate(0,60,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-60,120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-120,120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(-120,60,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-60,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,0);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,60);
   box(50);
   popMatrix();
   
   pushMatrix();
   translate(0,-120,-60);
   box(50);
   popMatrix();
} 



void yourPrepareWindow( )
{
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  
  translate( 0, transY, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
  
  translate( 0, 0, transZ );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );
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
     
     if (pmouseY < mouseY )
     {
        transY+=1;
     }
     
     if (pmouseY > mouseY )
     {
        transY-=1;
     }
  }
  
  if (mouseButton == RIGHT )
  {
     if (pmouseY > mouseY )
     {
        transZ+=1;
     }
     
     if (pmouseY < mouseY )
     {
        transZ-=1;
     }
  }
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    // test to see if X axis rotation is increased in positive direction
    if ( key == 'X' )
    {
       rotDeltaX += 1;
    }
    
    
    if ( key == 'x' )
    {
       rotDeltaX -= 1;
    }
    
    
    if ( key == 'Y' )
    {
       rotDeltaY += 1;
    }
    
    
    if ( key == 'y' )
    {
       rotDeltaY -= 1;
    }
    
    
    if ( key == 'Z' )
    {
       rotDeltaZ += 1;
    }
    
    
    if ( key == 'z' )
    {
       rotDeltaZ -= 1;
    }
    
    
    if ( key == 's' )
    {
       rotDeltaX = 0;
       rotDeltaY = 0;
       rotDeltaZ = 0;
    }
    
    if ( key == ' ' )
    {
       transX = 0;
       transY = 0;
       transZ = 0;
    }
}  

// Change any part or all of this and expand it to
// satisfy the specifications:
void showStats( )
{
   fill( 0 );
   textSize ( 10 ) ;
   text("TransX value: " + transX,  width*.5, height *.1 );
   text("TransY value: " + transY,  width*.5, height *.12 );
   text("TransZ value: " + transZ,  width*.5, height *.14 );
    
   text("RotX value: " + rotX,  width*.25, height*.1 );
   text("RotY value: " + rotY,  width*.25, height*.12 );
   text("RotZ value: " + rotZ,  width*.25, height*.14 );
    
   text("RotDeltaX value: " + rotDeltaX,  width*.75, height*.1 );
   text("RotDeltaY value: " + rotDeltaY,  width*.75, height*.12 );
   text("RotDeltaZ value: " + rotDeltaZ,  width*.75, height*.14 );

}


void jimsPrepareWindow( )
{

    background(255);  
    translate( width/2, height/2, 0 );
    lights(); 
    
    // remove the follow when you are done
    // turn on a white light placed at the camera position pointing to the back of the window.
    //directionalLight( 255, 255, 255, 0, 0, -1 );
    
        // draw axis lines
    strokeWeight( 3 );
    stroke( 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 0 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


