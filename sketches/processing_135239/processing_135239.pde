
float transX;  // X translation amounts
float rotX;  // X axis rotation amounts
float rotDeltaX;  // amount of X axis rotation change for each input

float transY;  // Y translation amounts
float rotY;  // Y axis rotation amounts
float rotDeltaY;  // amount of y axis rotation change for each input

float transZ;  // Z translation amounts
float rotZ;  // Z axis rotation amounts
float rotDeltaZ;  // amount of y axis rotation change for each input

void setup( )
{
   size( 600, 600, P3D );
   textSize( 15 );
   textAlign( CENTER );
   transX=0;
   rotX=0;
   rotDeltaX=0;
   transY=0;
   rotY=0;
   rotDeltaY=0;
   transZ=0;
   rotZ=0;
   rotDeltaZ=0;
   
   rectMode (CENTER);
}

void draw( )
{
   pushMatrix( );
     prepareWindow( );
     drawInitial( );
   popMatrix( );
   showStats( );
   lights ( );
}

// DrawYour initial here
void drawInitial( )
{  
     
     fill( 255, 200, 0 );
     noStroke ( );
     box( 40 );
 
     pushMatrix ( );
     translate ( 50, 0, 0);
     box (40);
     popMatrix ( ); 
  
     pushMatrix ( );
     translate ( 50, 0, -50);
     box (40);
     popMatrix ( );   
    
     pushMatrix ( );
     translate ( 50, 0, -100);
     box (40);
     popMatrix ( ); 
     
     pushMatrix ( );
     translate ( 50, 0, 50);
     box (40);
     popMatrix ( ); 
     
     pushMatrix ( );
     translate ( 50, 0, 100);
     box (40);
     popMatrix ( );
     
     pushMatrix ( );
     translate (-50, 0, 0);
     box (40);
     popMatrix ( );
     
     pushMatrix ( );
     translate ( -50, -50, 0);
     box (40);
     popMatrix ( );
     
     pushMatrix ( );
     translate ( -50, -100, 0);
     box (40);
     popMatrix ( );
     
     pushMatrix ( );
     translate ( -50, 50, 0);
     box (40);
     popMatrix ( );
     
     pushMatrix ( );
     translate ( -50, 100, 0);
     box (40);
     popMatrix ( );
} 


void prepareWindow( )
{
  background (50);
  strokeWeight (2);
  stroke (255, 255, 0);
  translate (width/2, height/2, 0); 
  
  line (0, 0, 150, 0, 0, -150);
  stroke ( 0, 255, 255 );
  line (0, 150, 0, 0, -150, 0);
  stroke (200, 0, 200);
  line (150, 0, 0, -150, 0, 0);
   
  translate( transX, 0, 0 );
  rotX += rotDeltaX;
  rotateX( radians( rotX ) );
  
  translate( 0, transY, 0 );
  rotY += rotDeltaY;
  rotateY( radians( rotY ) );
  
  translate( 0, 0, transZ );
  rotZ += rotDeltaZ;
  rotateZ( radians( rotZ ) );
  
  
  directionalLight (255,255,255, 0, 0, -1);
}

void mouseDragged( )
{ 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
     if (pmouseX < mouseX )  //move right
     {
        transX+=1;
     }
     if (pmouseX > mouseX) //move left
     {
         transX-=1;
     }
     if (pmouseY < mouseY) //move up
     {
         transY+=1;
     }
     if (pmouseY > mouseY) //move down
     {
         transY-=1;
     }
  }

  else if (mouseButton == RIGHT)
  {
     if (pmouseY > mouseY) //move up
     {
         transZ+=1;
     }
     if(pmouseY < mouseY) //move down
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
    else if ( key == 'x' )
    {
       rotDeltaX -=1;
    }
    else if ( key == 'Y' )
    {
       rotDeltaY += 1;
    }
    else if ( key == 'y' )
    {
       rotDeltaY -= 1;
    }
    else if ( key == 'Z' )
    {
       rotDeltaZ +=1;
    } 
    else if ( key == 'z' )
    {
        rotDeltaZ -=1;
    }
    else if ( key == 's' )
    {
        rotDeltaX = 0;
        rotDeltaY= 0;
        rotDeltaZ= 0;
    }
    else if ( key == ' ' )
    {
        transX = 0;
        transY = 0;
        transZ = 0;
    } 
}

void showStats( )
{
   fill( 255 );

   
   text ("TransX Value: " + transX,  width*.5, height - 50 );
   text ("TransY Value: " + transY,  width*.5, height - 30 );
   text ("TransZ Value: " + transZ,  width*.5, height - 10 );

   text ("RotX Value: " + rotX,  width*.15, height - 50 );
   text ("RotY Value: " + rotY,  width*.15, height - 30 );
   text ("RotZ Value: " + rotZ,  width*.15, height - 10 );

   text ("RotDeltaX Value: " + rotDeltaX,  width*.85, height - 50 );
   text ("RotDeltaY Value: " + rotDeltaY,  width*.85, height - 30 );
   text ("RotDeltaZ Value: " + rotDeltaZ,  width*.85, height - 10);
}


