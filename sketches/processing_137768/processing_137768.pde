
//Rachel Ciavarella 2014
//HW6


float transX        ;  // SX xis translation amounts
float rotX          ;  // X axis rotation amounts
float rotDeltaX     ;  // amount of X axis rotation change for each input

float transY        ;  // SX xis translation amounts
float rotY          ;  // X axis rotation amounts
float rotDeltaY     ;  // amount of X axis rotation change for each input

float transZ        ;  // SX xis translation amounts
float rotZ          ;  // X axis rotation amounts
float rotDeltaZ     ;  // amount of X axis rotation change for each input


void setup( )
{
  size( 600, 600, P3D );
  textSize( 24 );
  textAlign( CENTER );

  rotDeltaX = 0;
  rotDeltaY = 0; 
  rotDeltaZ = 0;
}


void draw( )
{
  pushMatrix( );
  jimsPrepareWindow( );
  yourPrepareWindow( );
  drawInitial( );
  popMatrix( );
  showStats( );
}

 //initial
void drawInitial( )
{  
 
  fill( #0DFA41 );
  noStroke();
  box( 50 );
  
  pushMatrix();
  translate(0, 55, 0);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(0, 110, 0);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(0, -55, 0);
  box(50);
  popMatrix();
   
  pushMatrix();
  translate(0, -110, 0);
  box(50);
  popMatrix();
  
  
  pushMatrix();
  translate(55, -110, -50);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(55, 0, -50);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(110, 0, -100);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(110, -110, -100);
  box(50);
  popMatrix();
    
  pushMatrix();
  translate(110, -55, -100);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(55, 55, -50);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(110, 110, -100);
  box(50);
  popMatrix();
  
  pushMatrix();
  translate(165, 165, -150);
  box(50);
  popMatrix();
  
} 



void yourPrepareWindow( )
{
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

//translations
void mouseDragged( )
{
  // check for mouse button 
  if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
    if (pmouseX < mouseX )
    {
      transX+=1;
    }
  }
  
   if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from left to right
    if (pmouseX > mouseX )
    {
      transX-=1;
    }
  }
  
    if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from top to bottom
    if (pmouseY < mouseY )
    {
      transY+=1;
    }
  }
  
   if (mouseButton == LEFT )
  {
    // check to see if mouse was dragged from bottom to top
    if (pmouseY > mouseY )
    {
      transY-=1;
    }
  }
  
    if (mouseButton == RIGHT )
  {
    // check to see if mouse was dragged from top to bottom
    if (pmouseY < mouseY )
    {
      transZ+=1;
    }
  }
  
   if (mouseButton == RIGHT )
  {
    // check to see if mouse was dragged from bottom to top
    if (pmouseY > mouseY )
    {
      transZ-=1;
    }
  }
} 


//rotations
void keyPressed( )
{
  // test to see if X axis rotation is increased in positive direction
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
  if ( key == 'z' )
  {
    rotDeltaZ -= 1;
  }
  
  //stop rotation
  if ( key == ' ' )
  {
    transX = 0;
    transY = 0;
    transZ = 0;
  } 
  
  //translation set to original
    if ( key == 's' )
  {
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  } 
  
}  


void showStats( )
{
  fill( 255 );
  textAlign( CENTER );
  
    text( "rotDeltaZ = " + rotDeltaZ, width/2, height - 40 );
    text( "rotZ = " + rotZ, width/2, height - 20 );
    text( "transZ = " + transZ, width/2, height-60 );
    text( "rotDeltaY = " + rotDeltaY, width/2, height - 80);
    text( "rotY = " + rotY,width/2, height - 100);
    text( "rotDeltaX = " + rotDeltaX + rotZ, width/2, height - 120);
    text( "rotX = " + rotX, width/2, height - 140);
}


void jimsPrepareWindow( )
{
  background( 0 );  
  translate( width/2, height/2, 0 );


  directionalLight( 255, 255, 255, 0, 0, -1 );

  // draw axis lines
  strokeWeight( 3 );
  stroke( 200, 200, 0 ); 
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 200, 0, 200 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line
}



