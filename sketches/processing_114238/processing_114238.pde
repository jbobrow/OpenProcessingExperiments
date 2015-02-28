
//letter M 3D
//Madeline Chan Copyright 2013
//HW 6
  
float transX;
  
float rotX;
float rotDeltaX; 
  
float transY;
float rotY;
float rotDeltaY;
  
float transZ;
float rotZ;
float rotDeltaZ;
  
void setup( )
{
  size(600, 600, P3D);
  rotDeltaX= 0;
  rotDeltaY= 0;
  rotDeltaZ=0;
  rectMode(CENTER);
}
  
void draw( )
{
  pushMatrix( );
  jimsPrepareWindow( );
  myPrepareWindow( );
  drawInitial( );
  pointLight(255, 255, 255, 35, 40, 36);
  popMatrix( );
  showStats( );
}
  
void drawInitial( )
{
  //farthest left rect
  stroke(255);
  strokeWeight(2);
  pushMatrix();
  translate(-70, 0, 0);
  fill(144,238,144,50);
  box (30, 180, 75);
  popMatrix();
  
  //2nd left cube
  pushMatrix();
  translate(-40, -75, 0);
  box (30, 30, 30);
  popMatrix();
  
  //3rd left cube
  pushMatrix();
  translate(-25, -37, 0);
  box (30, 30, 30);
  popMatrix();
  
  //center cube
  pushMatrix();
  translate(0, 0, 0);
  box (30, 30, 30);
  popMatrix();
  
  //fourth cube from left
  pushMatrix();
  translate(25, -37, 0);
  box (30, 30, 30);
  popMatrix();
  
  //fifth cube from left
  pushMatrix();
  translate(35, -75, 0);
  box (30, 30, 30);
  popMatrix();
  
  //long right rect
  pushMatrix();
  translate(70,0,0);
  fill(144,238,144,50);
  box(30,180,75);
  popMatrix();
  
  //shadow
  pushMatrix();
  stroke(255);
  strokeWeight(.5);
  translate(70,180,0);
  noFill();
  box(30,180,75);
  popMatrix();
  
  noFill ();
  pushMatrix();
  translate(-70,180, 0);
  box (30, 180, 75);
  popMatrix();
  
  //second cube from left
  pushMatrix();
  translate(-40, 180, 0);
  box (30, 30, 30);
  popMatrix();
  
  //3rd left cube
  pushMatrix();
  translate(-25, 145, 0);
  box (30, 30, 30);
  popMatrix();
  
  //center cube
  pushMatrix();
  translate(0, 105, 0);
  box (30, 30, 30);
  popMatrix();
  
  //fourth cube from left
  pushMatrix();
  translate(25, 145, 0);
  box (30, 30, 30);
  popMatrix();
  
  //fifth cube from left
  pushMatrix();
  translate(35, 180, 0);
  box (30, 30, 30);
  popMatrix();
  

}
  
void myPrepareWindow( )
{
  lights();
  translate (transX, 0, 0);
  rotateX (radians(rotX));
  rotX += rotDeltaX;
  
  translate (0, transY, 0);
  rotateY (radians(rotY));
  rotY += rotDeltaY;
  
  translate (0, 0, transZ);
  rotateZ (radians(rotZ));
  rotZ += rotDeltaZ;
}
  
void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
    if (pmouseX < mouseX )
    {
      transX+=5;
    }
  
    else if (pmouseX > mouseX )
    {
      transX-=2;
    }
  
    else if (pmouseY > mouseY)
    {
      transY-=5;
    }
  
    else if (pmouseY < mouseY)
    {
      transY+=5;
    }
  }
    
  if (mouseButton == RIGHT )
  {
    if (pmouseY < mouseY) transZ-=5;
    else if (pmouseY > mouseY) transZ+=5;
    
  }
}
  
// Expand this to satisfy the specificaions:
void keyPressed( )
{
  if ( key == 'X' ) rotDeltaX+=.5;
  else if ( key == 'x') rotDeltaX-=.5;
  else if ( key == 'Y') rotDeltaY+=.5;
  else if ( key == 'y') rotDeltaY-=.5;
  else if ( key =='Z') rotDeltaZ+=.5;
  else if ( key =='z') rotDeltaZ-=.5;
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
  
void showStats( )
{
  fill( 255 );
  textAlign( LEFT );
  textSize(15);
  text("Rotation (X:"+abs(round(rotX))+", Y:"+abs(round(rotY))+", Z:"+abs(round(rotZ))+")", 20, 560, 0);
  text("Translation (X:"+round(transX)+", Y:"+round(transY)+", Z:"+round(transZ)+")", 20, 580, 0);
}
  
  
void jimsPrepareWindow( )
{
  background( 60, 179, 113 );
  translate( width/2, height/2, 0 );
}



