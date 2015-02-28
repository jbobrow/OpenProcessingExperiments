
// Copyright Leslie Bloomfield, lbloomfi, HW#6


float transX;  
float transY;
float transZ;

float rotX;
float rotY;
float rotZ;

float rotDeltaX;
float rotDeltaY;
float rotDeltaZ;

void setup( )
{
   size( 600, 600, P3D );
   textSize( 18 );
   
   rotDeltaX  = 0;  
   rotDeltaY  = 0; 
   rotDeltaZ  = 0;   
}

// Strongly suggest you do not alter the draw( ) function...
void draw( )
{
   pushMatrix( );
   jimsPrepareWindow( );
   yourPrepareWindow( );
   drawInitial( );
   popMatrix( );
   showStats( );
    
}

void drawInitial( )
{  
   
    fill( 255, 211, 240);
    noStroke();
    pushMatrix();
    translate(0, 0, 0);
    box(40, 200, 40);
    popMatrix();
     
    pushMatrix();
    translate(30, 115, 0);
    box(145, 35, 40);
    popMatrix();
    
    pushMatrix();
    translate(120, 115, 0);
    box(35, 35, 80);
    popMatrix();
    
    pushMatrix();
    translate(0, -115, 0);
    box(80, 35, 40);
    popMatrix();
    
     

} 

void yourPrepareWindow( )
{
  lights();
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

void mouseDragged( )
{
  if (mouseButton == LEFT ){
     if (pmouseX < mouseX ){
        transX+=1;
     }
      else if ( pmouseX > mouseX ){
        transX-=1;
     }
     else if ( pmouseY < mouseY ){
        transY+=1;
     }
     else if ( pmouseY > mouseY ) {
        transY-=1;
     }
  }
  
  if (mouseButton == RIGHT){
     if ( pmouseY > mouseY ) {
        transZ+=1;
     }
     else if ( pmouseY < mouseY ){
        transZ-=1;
     }
 } 
} 

void keyPressed( )
{
    if ( key == 'X' ){
       rotDeltaX += 1;
    }
    if ( key == 'x' ){
       rotDeltaX -= 1;
    }
     if ( key == 'Y' ){
       rotDeltaY += 1;
    }
     if ( key == 'y' ){
       rotDeltaY -= 1;
    }
     if ( key == 'Z' ){
       rotDeltaZ += 1;
    }
     if ( key == 'z' ){
       rotDeltaZ -= 1;
    } 
    if ( key == 's' ){
       rotDeltaX = 0;
       rotDeltaY = 0;
       rotDeltaZ = 0;
    }  
    if ( key == ' ' ){
       transX = 0;
       transY = 0;
       transZ = 0;
    }
}  


void showStats( )
{
   fill( 0 );
   
   text("ROTATIONS ",  width*.05, height - 560 );
   text("X: " + rotX,  width*.05, height - 540 );
   text("Y: " + rotY,  width*.05, height - 520 );
   text("Z: " + rotZ,  width*.05, height - 500 );
    
   text("delta X: " + rotDeltaX,  width*.05, height - 480 );
   text("delta Y : " + rotDeltaY,  width*.05, height - 460 );
   text("delta Z: " + rotDeltaZ,  width*.05, height - 440 );

   text("TRANSLATIONS ",  width*.7, height - 560 );   
   text("trans X: " + transX,  width*.7, height - 540 );
   text("trans Y: " + transY,  width*.7, height - 520 );
   text("trans Z: " + transZ,  width*.7, height - 500 );
   
   
}


void jimsPrepareWindow( )
{
    background( 255 );  
    translate( width/2, height/2, 0 );
    
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}


