
// Copyright Stephanie Cheung and the terrifying void
// 257/757  Fall 2013
// Homework #6
// Exploring 3D with tools from the first five homeworks

// global variables

float transX        ;  // axis translation amounts
float transY        ;
float transZ        ;

float rotX          ;  // axis rotation amounts
float rotY          ;
float rotZ          ;

float rotDeltaX     ;  // amount of rotation change for each input
float rotDeltaY     ;
float rotDeltaZ     ;

float angle         ;


void setup( )
{
   size( 600, 600, P3D );

   rotDeltaX     = 0;
   rotDeltaY     = 0;
   rotDeltaZ     =0;
   sphereDetail(5);
   
   angle = 0;
}

void draw( )
{
  background(0);
   pushMatrix( );
     PrepareWindow( );
     drawInitial( );
     orbits( );
   popMatrix( );

   showStats( );
   
}

// Draw initial here
void drawInitial( )
{ 
  for (float angle=-PI*(5/4); angle <= 0; angle += 0.05*PI){
    pushMatrix();
    translate(110*sin(angle), 80*(angle),40*angle);
    fill(255);
    sphere(30);
    popMatrix();
  }   
for (float angle=0; angle <= PI*(5/4); angle += 0.05*PI){
    pushMatrix();
    translate(110*sin(angle), 80*(angle),-100*angle);
    fill(255);
    sphere(30);
    popMatrix();
  }    
}


// Do the required translations and rotations here before
// you draw anything.
void PrepareWindow( )
{
  background( 229 ); 
  translate( width/2, height/2, 0 );
  
  translate(transX,0,0);
  translate(0,transY,0);
  translate(0,0,transZ);
  rotX += rotDeltaX;
  rotateX(radians(rotX));
  rotZ += rotDeltaZ;
  rotateZ(radians(rotZ));
  rotY += rotDeltaY;
  rotateY(radians(rotY));
 
  directionalLight(111,162,183,0,1,0);
  directionalLight(134,0,105,1,0,0);
  directionalLight(83,93,196,0,0,1);
  directionalLight(94,107,240,-1,0,0);
  directionalLight(13,21,100,0,-1,0);
  directionalLight(44,1,80,0,0,-1);
}

//mouse controls
void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=3;
     }
     if (pmouseX > mouseX) {
       transX-=3;
     }
     if (pmouseY > mouseY) {
      transY-=3;
     }
     if (pmouseY < mouseY){
      transY+=3;
     }
  }
  if (mouseButton == RIGHT){
    if (pmouseY > mouseY){
     transZ-=3;
    }
    if (pmouseY < mouseY){
     transZ+=3;
    }
  }
}

// key controls
void keyPressed( )
{
    if ( key == 'X' ) rotDeltaX+=.2;
    if ( key == 'x' ) rotDeltaX-=.2;
    if ( key == 'Y' ) rotDeltaY+=.2;
    if ( key == 'y' ) rotDeltaY-=.2;
    if ( key == 'Z' ) rotDeltaZ+=.2;
    if ( key == 'z' ) rotDeltaZ-=.2;
    if ( key == 's' ) {
      rotDeltaZ = 0;
      rotDeltaY = 0;
      rotDeltaX = 0;
    }
    if ( key == ' ' ) {
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
   textSize( 16 );
   textAlign( CENTER );
   text("X Rotation: " + rotDeltaX + ", Y Rotation: " + rotDeltaY + ", Z Rotation: " + rotDeltaZ + "\n"+
             " X Translation: " + transX + " Y Translation: " + transY + " Z Translation: " + transZ,
          0, height - 100, width, 200 );
  
}

void orbits() {
  pushMatrix();
  translate(100*cos(angle), 100*sin(angle));
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(0,100*sin(angle), 100*cos(angle));
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(100*sin(angle), 100*cos(angle));
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(0,100*cos(angle), 100*sin(angle));
  sphere(10);
  popMatrix();
  angle = angle + .01; 
}



