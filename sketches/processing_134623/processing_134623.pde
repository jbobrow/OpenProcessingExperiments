
//HW6
//©Scott Alberstein 2014

float transX; 

float rotX; 
float rotDeltaX;  

float transY;
float rotY;
float rotDeltaY;
 
float transZ;
float rotZ;
float rotDeltaZ;


void setup()
{
   size( 600, 600, P3D );
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   rectMode(CENTER);
}


void draw()
{
   pushMatrix( );
     jimsPrepareWindow( );
     yourPrepareWindow( );
     drawInitial( );
   popMatrix( );
   showStats( );
}


void drawInitial()
{  
    //Letter
    fill( 52, 232, 167);
    noStroke();
    pushMatrix();
    translate(-80, 0, 0);
    box(80, 320, 80);
    popMatrix();
    
    pushMatrix();
    translate(80, 0, 0);
    box(80, 320, 80);
    popMatrix();
    
    pushMatrix();
    translate(0, 40, 0);
    box(80, 40, 80);
    popMatrix();
    
    pushMatrix();
    translate(0, -180, 0);
    box(160, 40, 80);
    popMatrix();
    
    //Feet
    pushMatrix();
    translate(-80, 140, 40);
    box(80, 40, 40);
    popMatrix();
    
    pushMatrix();
    translate(80, 140, 40);
    box(80, 40, 40);
    popMatrix();
    
    pushMatrix();
    translate(-80, 140, -40);
    box(80, 40, 40);
    popMatrix();
    
    pushMatrix();
    translate(80, 140, -40);
    box(80, 40, 40);
    popMatrix();
} 


void yourPrepareWindow()
{
  lights();
  translate(transX, 0, 0);
  rotateX(radians(rotX));
  rotX += rotDeltaX;
  
  translate (0, transY, 0);
  rotateY (radians(rotY));
  rotY += rotDeltaY;
 
  translate (0, 0, transZ);
  rotateZ (radians(rotZ));
  rotZ += rotDeltaZ;
}


void mouseDragged()
{
  if (mouseButton == LEFT)
  {
     if (pmouseX < mouseX )
     {
        transX+= 2;
     }
  }
  if (mouseButton == LEFT)
  {
    if (mouseX < pmouseX)
    {
      transX-= 2;
    }
  }
  if (mouseButton == LEFT)
  {
    if (pmouseY > mouseY)
    {
      transY-= 2;
    }
  }
  if (mouseButton == LEFT)
  {
    if (mouseY > pmouseY)
    {
      transY+=2;
    }
  }
  if (mouseButton == RIGHT)
  {
    if (pmouseY >  mouseY)
    {
      transZ+=2;
    }
  }
  if (mouseButton == RIGHT)
  {
    if (mouseY > pmouseY)
    {
      transZ-=2;
    }
  }
}



void keyPressed()
{
  if ( key == 'X' ) rotDeltaX+=.2;
  else if ( key == 'x') rotDeltaX-=.2;
  else if ( key == 'Y') rotDeltaY+=.2;
  else if ( key == 'y') rotDeltaY-=.2;
  else if ( key =='Z') rotDeltaZ+=.2;
  else if ( key =='z') rotDeltaZ-=.2;
  else if ( key == ' ')
  {
    transX=0;
    transY=0;
    transZ=0;
  }
  else if ( key =='s')
    {
      rotX = 0;
      rotY = 0;
      rotZ = 0;
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
    }
} 


void showStats()
{
  fill( 52, 232, 167);
  textAlign( LEFT );
  textSize(15);
  text("ROTATION (X " + abs(round(rotX)) + ", Y " + abs(round(rotY)) + ", Z " + abs(round(rotZ)) + ")", 20, 560, 0);
  text("TRANSLATION (X " + round(transX) + ", Y " + round(transY) + ", Z " + round(transZ) + ")", 20, 580, 0);
}


void jimsPrepareWindow()
{
    background( 255 );  
    translate( width/2, height/2, 0 );
}


