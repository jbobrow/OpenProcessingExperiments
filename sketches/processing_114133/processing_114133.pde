
// Coral Pais, Carnegie Mellon University
//Reproduction of the program without consent is strictly prohibited

// 257/757  Fall 2013
// Homework #6
// Exploring 3D with tools from the first five homeworks

// global variables

float transX, transY,transZ ;  // axis translation amounts
float rotX,rotY,rotZ;  // axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ     ;  // amount of rotation change for each input
float x, y;
float radius=150;
int i;
float col;

void setup( )
{
   size( 600, 600, P3D );

   rotDeltaX     = 0;
   rotDeltaY     = 0;
   rotDeltaZ     = 0;
   x=0;
   y=0;
   col=20;
   noStroke ( );

}

void draw( )
{
   pushMatrix( );
     prepScreen( );
     prepDrawWindow( );
     drawInitial( );
   popMatrix( );
   // The pushMatrix( ) / popMatrix( ) pair are used
   // so the stats will always be drawn in the same place on
   // the graphics window.
   showStats( );
    
}

void prepScreen( )
{
    background( 0);
    translate( width/2, height/2, 0 ); //Moves the 0,0,0 point o the middle of the window
       
    
}


void prepDrawWindow( )
{
  lights ( );
  directionalLight (160,0,240,-1,-1,0);
  translate ( transX, transY,transZ);
  rotX+=rotDeltaX;
  rotateX (radians (rotX));
  
  rotY+=rotDeltaY;
  rotateY (radians (rotY));
  
  rotZ+=rotDeltaZ;
  rotateZ (radians (rotZ));
}


void drawInitial( )
{   
    colorMode(HSB, 240);
    int d=10, col=40;
    for (i=35; i<= 320; i +=15)
    {
      pushMatrix( );
      stroke (col, 240, 80);
      strokeWeight (0.25);
      fill(col,240,122);
      translate (x + radius * cos (radians (i)),  y + radius * sin (radians (i)),i*0.6);
      rotateX (radians (frameCount));
      rotateY (radians (frameCount/2));
      sphere (d);
      col=col+10;
      if (i<=175)
      d+=1;
      else
      d-=1;
      popMatrix ( );
    }
       
}




void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=1;
     }
     
     else
     {
        transX-=1;
     }
     
     if (pmouseY < mouseY )
     {
        transY+=1;
     }
     
     else
     {
        transY-=1;
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
    if ( key == 'X' )  
    { 
      rotDeltaX+=.2;
    }
    
    else if (key =='x') 
    { 
      rotDeltaX-=0.2;
    }
    
    if ( key == 'Y' )  
    { 
      rotDeltaY+=.2;
    }
    
    else if (key =='y') 
    { 
      rotDeltaY-=0.2;
    }
    
    if ( key == 'Z' )  
    { 
      rotDeltaZ+=.2;
    }
    
    else if (key =='z') 
    { 
      rotDeltaZ-=0.2;
    }
    
    else if (key =='s') 
    { 
      rotX=0;
      rotY=0;
      rotZ=0;
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
            
    }
    else if (key ==' ') 
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
   float xr, yr;
   xr=width*0.5;
   yr=height*0.5;
   
   fill( 160,0,240 );
   textSize( 16 );
   text("ROTATION       | X: " + int (rotX) + "  Y: " + int (rotY) + "  Z: " + int (rotZ) , xr-width*0.45, yr+height*0.44 );
   text("TRANSLATION | X: " + int (transX) + "  Y: " + int (transY) + "  Z: " + int (transZ) , xr-width*0.45, yr+height*0.47  );
   
}





