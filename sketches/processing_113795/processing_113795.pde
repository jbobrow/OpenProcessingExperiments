
// Amy Friedman
// copyright Amy Friedman October 2013
// 257/757  Fall 2013
// Homework #6
// Exploring 3D with tools from the first five homeworks

// global variables

float transX, transY, transZ        ;  // axis translation amounts
float rotX, rotY, rotZ          ;  // axis rotation amounts
float rotDeltaX, rotDeltaY, rotDeltaZ     ;  // amount of rotation change for each input

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
 strokeWeight(3);
 stroke(255);
 
 pushMatrix();
 fill(#2CCFFF, 100);
 translate (60,0,0);
 box(20,150,100);
 popMatrix();
 
 pushMatrix();
 fill(#93E7FF,100);
 translate(20,-65,0);
 box(50,20,80);
 popMatrix();
 
 pushMatrix();
 fill(#93E7FF,100);
 translate(20,0,0);
 box(50,20,50);
 popMatrix();

 pushMatrix();
 fill(#BFF0FF,150);
 translate(-27,0,0);
 box(35,20,120);
 popMatrix();
 
 pushMatrix();
 fill(#BFF0FF,150);
 translate(-27,-65,0);
 box(35,20,50);
 popMatrix();
 
 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,-65,0);
 box(20,20,125);
 popMatrix();

 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,-43,0);
 box(20,20,60);
 popMatrix();
  
 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,-21,0);
 box(20,20,100);
 popMatrix();

 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,0,0);
 box(20,20,80);
 popMatrix();

 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,21,0);
 box(20,20,100);
 popMatrix();
 
 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,43,0);
 box(20,20,125);
 popMatrix();
 
 pushMatrix();
 fill(#F5FDFF,150);
 translate(-60,65,0);
 box(20,20,20);
 popMatrix();
   
} 


// Do the required translations and rotations here before
// you draw anything.
void yourPrepareWindow( )
{
  translate(transX,0,0);
  rotateX(radians(rotX));
  rotX+=rotDeltaX;
  
  translate(0,transY,0);
  rotateY(radians(rotY));
  rotY+=rotDeltaY;
  
  translate(0,0,transZ);
  rotateZ(radians(rotZ));
  rotZ+=rotDeltaZ;
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
     
     else if (pmouseX > mouseX)
     {
       transX-=1;
     }
     
     else if (pmouseY < mouseY)
     {
       transY+=1;
     }
     
     else if (pmouseY > mouseY)
     {
       transY-=1;
     }
   
  }
  
  else if (mouseButton == RIGHT)
  {
    if (pmouseY < mouseY)
    {
      transZ+=1;
    }
    
    else if (pmouseY > mouseY)
    {
      transZ-=1;
    }
  }
} 

// Expand this to satisfy the specificaions:
void keyPressed( )
{
    if      (key=='X') rotDeltaX+=.5;
    else if (key=='x') rotDeltaX-=.5;
    else if (key=='Y') rotDeltaY+=.5;
    else if (key=='y') rotDeltaY-=.5;
    else if (key=='Z') rotDeltaZ+=.5;
    else if (key=='z') rotDeltaZ-=.5;
    else if (key=='s') 
    {
      rotDeltaX=0;
      rotDeltaY=0;
      rotDeltaZ=0;
    }
    else if (key == ' ')
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
   textSize( 15 );
   textAlign( CENTER );
   text("Rotation (X: "+abs(round(rotX))+", Y: "+abs(round(rotY))+", Z: "+abs(round(rotZ))+")", width*.5, height - 100);
   text("Translation (X: "+round(transX)+", Y: "+round(transY)+", Z: "+round(transZ)+")", width*.5, height - 75);
   
   
}


void jimsPrepareWindow( )
{
    // change these next two lines at your own risk -- to on... live dangerously... myhhhhaaaaaaaaaa
    background(random(255 ), random(255), random(255));  
    translate( width/2, height/2, 0 );
    

}


