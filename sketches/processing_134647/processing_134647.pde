
//copyright Yoon-ji Kim 2014
//51-257 A
// Homework #6

//GLOBAL VARIABLES
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
   size(600, 600, P3D);
      
   rotDeltaX  = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
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

//INITIAL = K
void drawInitial( )
{  
     fill( 134, 246, 255 );
     noStroke();
     //stroke(75, 187, 206); 
     
     //TOP DIAG OF K
     pushMatrix();
     translate(25, -50, -50);
     box(50);
     popMatrix();

     pushMatrix();
     translate(75, -100, -50);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(125, -150, -50);
     box(50);
     popMatrix();
     
     //BOTTOM DIAG OF K
     pushMatrix();
     translate(25, 50, 50);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(75, 100, 50);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(125, 150, 50);
     box(50);
     popMatrix();
     
     //K STEM     
     pushMatrix();
     translate(-30, -150, 0);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(-30, -75, 0);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(-30, 0, 0);
     box(50);
     popMatrix();
     
     pushMatrix();
     translate(-30, 75, 0);
     box(50);
     popMatrix();

     pushMatrix();
     translate(-30, 150, 0);
     box(50);
     popMatrix();
} 

void yourPrepareWindow( )
{
  background(0);
  lights();
  
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX(radians(rotX));
  
  translate(transY, 0, 0);
  rotY += rotDeltaY;
  rotateY(radians(rotY));
  
  translate(transZ, 0, 0);
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
  
  strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}

void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=1;
     }
  }
  if(mouseButton == LEFT)
  {
    if(pmouseX > mouseX)
    {
      transX -= 1;
    }
  }
    if(mouseButton == LEFT)
    {
      if(pmouseY > mouseY)
      {
        transY -= 1;
      }
    }
    if(mouseButton == LEFT)
    {
      if(pmouseY < mouseY)
      {
        transY += 1;
      }
    }
    if(mouseButton == RIGHT)
    {
      if(pmouseY > mouseY)
      {
        transZ += 1;
      }
    }
    if(mouseButton == RIGHT)
    {
      if(pmouseY < mouseY)
      {
        transZ -= 1;
      }
    }
} 

void keyPressed( )
{
    if(key == 'X')
    {
       rotDeltaX += 1;
    }    
    if(key == 'x')
    {
      rotDeltaX -= 1;
    }
    if(key == 'Y')
    {
      rotDeltaY += 1;
    }
    if(key == 'y')
    {
      rotDeltaY -= 1;
    }
    if(key == 'Z')
    {
      rotDeltaZ += 1;
    }
    if(key == 'z')
    {
      rotDeltaZ -= 1;
    }
    
    //PRESS "R" FOR RESET
    if (key == 'r')
    {
      rotX=0;
      rotY=0;
      rotZ=0;
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
    }
    
    //PRESS "SPACE" FOR RESET
    if(key == ' ')
    {
      transX=0;
      transY=0;
      transZ=0;
    } 
}  

void showStats( )
{
   textSize(16);
   fill( 255 );
   textAlign(LEFT);
   text("rotX= "+rotX+" rotY= "+rotY+" rotZ="+rotZ+"", 25, 25);
   text("transX= "+transX+" transY= "+transY+" transZ= "+transZ+"", 25, 50);
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk --  do so and... live dangerously... myhhhhaaaaaaaaaa
    background( 0 );  
    // moves (0, 0, 0 ) point to the window center );
    translate( width/2, height/2, 0 );

    // remove the follow when you are done
    // turn on a white light placed at the camera position pointing to the back of the window.
    directionalLight( 255, 255, 255, 0, 0, -1 );
}


