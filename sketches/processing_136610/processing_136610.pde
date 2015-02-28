
// copyright Faryal Khalid 2014
// Homework #6
 
 
float transX;     //x translation amounts
float rotX;       //x rotation amounts
float rotDeltaX;  //amount of X axis rotation change for each input
 
float transY;     //y translation amounts
float rotY;       //y rotation amounts
float rotDeltaY;  //amount of y axis rotation change for each input
 
float transZ;     //z translation amounts
float rotZ;       //z rotation amounts
float rotDeltaZ;  //amount of X axis rotation change for each input
 
void setup( )
{
   size( 600, 600, P3D );
   textSize( 15 );
   textAlign( CENTER );
    
   rotDeltaX = 0;
    
}
 
void draw( )
{
   pushMatrix( );
     yourPrepareWindow( );
     drawF( );
   popMatrix( );
   showStats( );
}
 
void drawF( )
{ 
     fill( 37, 245, 219, 100 );
     stroke( 255 );
      
     //y direction stem
     pushMatrix();
     translate( 0, -100, 0 );
     box( 50 );
     popMatrix();
      
     pushMatrix();
     translate( 0, -50, 25);
     box( 50 );
     popMatrix();
      
     pushMatrix();
     translate( 0, 0, 50);
     box( 50 );   
     popMatrix();
      
     pushMatrix();
     translate( 0, 50, 75 );
     box( 50 );
     popMatrix();
      
     pushMatrix();
     translate( 0, 100, 100 );
     box( 50 );
     popMatrix();
      
     //x direction stem 1
     pushMatrix();
     translate( 50, -100, 0);
     box( 50 );
     popMatrix();
      
     pushMatrix();
     translate( 100, -100, 25 );
     box( 50 );
     popMatrix();
     
      pushMatrix();
     translate( 150, -100, 50);
     box( 50 );
     popMatrix();
     
      //x direction stem 2
     pushMatrix();
     translate( 50, 0, 0);
     box( 50 );
     popMatrix();
      
     pushMatrix();
     translate( 100, 0, 25 );
     box( 50 );
     popMatrix();
 
      
 
}
 
void yourPrepareWindow( )
{
  background( 50 ); 
  translate( width/2, height/2, 0 );
   
  directionalLight( 255, 255, 255, 0, 0, -1 );
     
  // axis lines
  strokeWeight( 2 );
  stroke( 200, 200, 0 );
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
   
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
  if (mouseButton == LEFT )
  {
    //dragged from left to right
    if (pmouseX < mouseX )
     {
        transX+=1;
     }
    //dragged from right to left
    if (pmouseX > mouseX )
     {
       transX-=1;
     }
    //dragged from top to bottom
    if (pmouseY < mouseY )
     {
       transY+=1;
     }
    //dragged from bottom to top
    if(pmouseY > mouseY )
     {
      transY-=1;
     }
  }
  else if( mouseButton == RIGHT )
  {
    if(pmouseY > mouseY )
    {
      transZ+=1;
    }
    if (pmouseY < mouseY )
    {
      transZ-=1;
    }
  }
}
 
void keyPressed( )
{
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
   if (key == 'z' )
   {
     rotDeltaZ -= 1;
   }
} 
 
void showStats( )
{
   fill( 255 );
    
   text("TransX value:" + transX, width*.25, height - 75 );
   text("TransY value:" + transY, width*.25, height - 50 );
   text("TransZ value:" + transZ, width*.25, height - 25 );
    
   text("RotX value:" + rotX, width*.75, height - 75 );
   text("RotY value:" + rotY, width*.75, height - 50 );
   text("RotZ value:" + rotZ, width*.75, height - 25 );
    
   text("RotDeltaX value:" + rotDeltaX, width*.5, height - 575 );
   text("RotDeltaY value:" + rotDeltaY, width*.5, height - 550 );
   text("RotDeltaZ value:" + rotDeltaZ, width*.5, height - 525 );
}



