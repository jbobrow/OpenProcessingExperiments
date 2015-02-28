
// HW #6
// eunkichung

/* Key Presses:
X: rotate in positive x direction
x: rotate in negative x direction
Y: rotate in positive y direction
y: rotate in negative y direction
Z: rotate in positive z direction
z: rotate in negative z direction
s: stop rotations
spacebar: return to initial position and rotation continues
r: reset initial to original position and set all rotation values to zero
 
Mouse Dragged:
Left Button: drag initial left/right/up/down
Right Button drag up: + z translation (moves closer)
Right Button drag down: - z translation (moves away)
*/

float transX, transY, transZ;        
float rotX, rotY, rotZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;
float size, dist;


void setup( )
{
   size( 600, 600, P3D );
   
   rotX = 0;
   rotY = 0;
   rotZ = 0;
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   
   size = 30;
   dist = size*2;

}

void draw( )
{
   pushMatrix( );
     prepareWindow( );
     drawInitial( );
   popMatrix( );
   showStats( );
}

void drawInitial( )
{  
  noStroke ();
  fill (0, 195, 232, 150);
  
  //center
  pushMatrix ();
   translate(0,0,0);
   sphere(size);
  popMatrix ();
  
  //left
  pushMatrix();
   translate(-50,-175,0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
   translate(0, 50, 0);
   sphere(size);
  popMatrix();
   
  //upper right
  pushMatrix(); 
   translate(30, -30, 0);
   sphere(size);
   translate(30, -30, 15);
   sphere(size);
   translate(30, -30, 15);
   sphere(size);
   translate(30, -30, 15);
   sphere(size);
   translate(30, -30, 15);
   sphere(size);
  popMatrix();
  
  //lowerleft
  pushMatrix();
   translate(30, 30, 0);
   sphere(size);
   translate(25, 30, -15);
   sphere(size);
   translate(25, 30, -15);
   sphere(size);
   translate(25, 30, -15);
   sphere(size);
   translate(25, 30, -15);
   sphere(size);
  popMatrix();
  
} 


void mouseDragged( )
{
  if (mouseButton == LEFT )
  {
    if (pmouseX < mouseX ){
      transX+=1;
    }
    if(pmouseX > mouseX){
      transX-=1;
    }
    if(pmouseY > mouseY){
      transY-=1;
    }
    if(pmouseY < mouseY){
      transY+=1;
    }
  }
   
  if (mouseButton == RIGHT){
      if(pmouseY > mouseY){
      transZ+=1;
      }if(pmouseY < mouseY){
        transZ-=1;
      }
  }
}

void keyPressed( )
{
    if ( key == 'X'){
       rotDeltaX += 1;
    }
    if ( key == 'x'){
       rotDeltaX -= 1;
    }
    if ( key == 'Y'){
       rotDeltaY += 1;
    }
    if ( key == 'y'){
       rotDeltaY -= 1;
    }
    if ( key == 'Z'){
       rotDeltaZ += 1;
    }
    if ( key == 'z'){
       rotDeltaZ -= 1;
    }
    if ( key == 's'){
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
    if ( key == ' '){
      transX = 0;
      transY = 0;
      transZ = 0;
    }
    if ( key == 'r'){
      transX = 0;
      transY = 0;
      transZ = 0;
      rotX = 0;
      rotY = 0;
      rotZ = 0;
      rotDeltaX = 0;
      rotDeltaY = 0;
      rotDeltaZ = 0;
    }
} 
 
void showStats( )
{
    fill( 158, 13, 236 );
    text( "rotX = " + rotX, 15, 60);
    text( "rotDeltaX = " + rotDeltaX, 15, 80);
    text( "rotY = " + rotY, 15, 100);
    text( "rotDeltaY = " + rotDeltaY, 15, 120);
    text( "rotZ = " + rotZ, 15, 140);
    text( "rotDeltaZ = " + rotDeltaZ, 15, 160);
    text( "transZ = " + transZ, 15, 180);
}
 
void prepareWindow( )
{
    background(255 ); 
    translate( width/2, height/2, 0 );
    directionalLight( 255, 200, 255, 1, 1, 1 );
     
    translate( transX, transY, transZ );
     
    rotX += rotDeltaX;
    rotY += rotDeltaY;
    rotZ += rotDeltaZ;
     
    rotateX( radians( rotX ) );
    rotateY( radians( rotY ) );
    rotateZ( radians( rotZ ) );
   
    strokeWeight( 3 );
    stroke( 200, 200, 0 );
    line( 0, 0, 200, 0, 0, -200 );  
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  
}


