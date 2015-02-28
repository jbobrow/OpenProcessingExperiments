
// Copyright Mina Kim 2014
// minakim0128@gmail.com
// 
// 257/757  Spring 2014
// Homework #6
// Exploring 3D with tools from the first five homeworks



//Press
//X for positive x-axis rotation
//x for negative x-axis rotation
//Y for positive y-axis rotation
//y for negative y-axis rotation
//Z for positive z-axis rotation
//z for negative z-axis rotation
//s for stop rotation
//Space-bar for translation reset
//
//Mouse Movement:
//
//Left button
//Drag up: M moves up
//Drag down: M moves down
//Drag left: M moves to the left
//Drag right: M moves to the right
//
//Right button
//Drag up: M moves closer
//Drag down: M moves further away




// global variables

float transX;  
float transY;
float transZ;
float rotX;  
float rotY;
float rotZ; 
float rotXDelta;  
float rotYDelta;
float rotZDelta;

void setup( )
{
   size( 600, 600, P3D ); //P3D gives 3D , open graphics language.
   textSize( 15 );
   textAlign( CENTER );
   
   rotXDelta = 0;
   rotYDelta = 0;
   rotZDelta = 0;
  
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

// DrawYour initial here
void drawInitial( )
{  
   
     fill( 255, 200, 0 );
     noStroke();
     lights ();
     translate (0,0,0);
     sphere (30);
     
     
     pushMatrix ();
     translate (30,-30,10);
     sphere (30);
     popMatrix ();
     
     pushMatrix ();
     translate (60,-60,20);
     sphere (30);
     popMatrix ();
     
     pushMatrix ();
     translate (90,0,30);
     box (30,180,30);
     popMatrix ();
     
     
     pushMatrix ();
     translate (-30,-30,-10);
     sphere (30);
     popMatrix ();
     
     pushMatrix ();
     translate (-60,-60,-20);
     sphere (30);
     popMatrix ();
     
     pushMatrix ();
     translate (-90,0,-30);
     box (30,180,30);
     popMatrix ();
    
     
       
} 

void yourPrepareWindow( )
{
  translate( transX, 0, 0 );
  rotX += rotXDelta;
  rotateX( radians( rotX ) );
  
  translate( 0, transY, 0 );
  rotY += rotYDelta;
  rotateY( radians( rotY ) );
  
  translate( 0, 0, transZ );
  rotZ += rotZDelta;
  rotateZ( radians( rotZ) );

}


void keyPressed ()
{
if (key == 'X') {rotXDelta+=1;}
if (key == 'x') {rotXDelta-=1;}
if (key == 'Y') {rotYDelta+=1;}
if (key == 'y') {rotYDelta-=1;}
if (key == 'Z') {rotZDelta +=1;}
if (key == 'z') {rotZDelta -=1;}

if (key == 's') {rotXDelta = 0; rotYDelta = 0; rotZDelta = 0;}
if (key == ' ') 
{
transX=0;
transY=0;
transZ=0;
}

}


void mouseDragged( )
{
  
  if (mouseButton == LEFT )
  {
     if (pmouseX < mouseX )
     {
        transX+=3;
     }
     else if (pmouseX > mouseX)
      {transX-=3;}
     
     else if (pmouseY > mouseY)
    { transY-=3;} 
  
    else if (pmouseY < mouseY)
    {transY+=3;}
  }
  
  if (mouseButton == RIGHT)
  {
    if (pmouseY < mouseY)
    {transZ+=8;}
    
    else if (pmouseY > mouseY)
    {transZ-=8;}
  
  }


}


void showStats( )
{
    fill( 255, 0, 0 );
   
    fill( 0, 255, 0 );
    text( "rotX = " + rotX, 50, height - 100 );
    text( "delta-X = " + rotXDelta, 50, height - 80 );
    text( "rotY=" + rotY, 50, height -60);
    text( "delta-Y = " + rotYDelta, 50, height -40);
    text( "rotZ = " + rotZ, 50, height -20); 
    text( "delta-Z = " + rotZDelta, 50, height );
    
    text( "transX = " + transX, 350, height -100);
    text ("transY = " + transY, 350, height - 80);
    text ("transZ=" +transZ, 350, height -60);
  

}  


void jimsPrepareWindow( )
{
    
    background(0 );  
    translate( width/2, height/2, 0 );


  
    strokeWeight( 3 );
    stroke( 200, 200, 0 ); 
    line( 0, 0, 200, 0, 0, -200 );  // Z axis line
    stroke( 0, 200, 200 );
    line( 0, 200, 0, 0, -200, 0 );  // Y axis line
    stroke( 200, 0, 200 );
    line( 200, 0, 0, -200, 0, 0 );  // X axis line
}



