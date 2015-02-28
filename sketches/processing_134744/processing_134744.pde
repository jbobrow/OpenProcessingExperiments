
// HW #6
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved

// 3-D rotational Controls
    // X = positive x-axis rotation
    // x = negative x-axis rotation
    // Y = positive y-axis rotation
    // y = negative y-axis rotation
    // Z = positive z-axis rotation
    // z = negative z-axis rotation
    // s = all change in rotation values are reset to 0
    // SPACE = Object is reset to start position, but rotation will continue
    // left mouse click and drag rightward = initial moves to the right
    // left mouse click and drag leftward = initial moves to the left
    // left mouse click and drag upward = initial moves upward
    // left mouse click and drag downward = initial moves downward
    // right mouse click and drag upward = initial moves closer
    // right mouse click and drag downward = initial moves further away
    
// Global Variables
float rotX, rotXDelta, transX, transXDelta;
float rotY, rotYDelta, transY, transYDelta;
float rotZ, rotZDelta, transZ, transZDelta;
float x, xDist;
float y, yDist;
float z, zDist;
float unitW, nom,denom;
float mouseXDelta, mouseYDelta, mouseZDelta;


void setup ( )
{
  size( 600, 600, P3D );
  rotX = 0;
  rotXDelta = 0;
  transX = 0;
  transXDelta = 0;
  rotY = 0;
  rotYDelta = 0;
  transY = 0;
  transYDelta = 0;
  rotZ = 0;
  rotZDelta = 0;  
  transZ = 0;
  transZDelta = 0;
  xDist = 0;
 
  //textSize( 18 );
  //textAlign( CENTER );
  
  rectMode( CENTER );
}

void draw ( )
{
  pushMatrix( );
    prepareScreen( );
    drawFigure( );
  popMatrix( );
  showStats( );
}

void drawFigure( )
{
  nom = 1;
  denom = 15;
  unitW = (nom / denom) * width;
  noStroke();
  pushMatrix( );
   fill( 30, 90, 165, 200 );
   //center
   translate(-40,0,0);
   box(unitW);
   //upper right
   translate(40,-40,15);
   box(unitW);
   translate(35,-40,15);
   box(unitW);
   translate(35,-40,15);
   box(unitW);
   translate(35,-40,15);
   box(unitW);
  popMatrix();
  //lowerleft
  pushMatrix();
   translate(35,0,-15);
   box(unitW);
   translate(25,40,-15);
   box(unitW);
   translate(25,40,-15);
   box(unitW);
   translate(25,40,-15);
   box(unitW);
   translate(25,40,-15);
   box(unitW);
  popMatrix();
  //left vertical
  pushMatrix();
   //translate(-40,0,0);
   //box(40);
   translate(-60,-160,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   //box(40);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
   translate(0,40,0);
   box(unitW);
  popMatrix();
 
  
}

void prepareScreen()
{
  background( 0 );
  lights( );
  translate( width/2, height/2,transZ + zDist);
  stroke( 200, 200, 0 );
  line( -200, 0, 0, 200, 0, 0 );
  rotX += rotXDelta;
  rotateX( radians( rotY) );
  noFill();
  line( 0,-200,0,0,200,0);
  rotY += rotYDelta;
  rotateY( radians( rotX ) );
  line( -200, 0, 0, 200, 0, 0 );
  lights( );
  line(0,0,-200,0,0,200);
  rotZ += rotZDelta;
  rotateZ( radians( rotZ));
}

void showStats() {
    fill( 255, 0, 0 );
    fill( 0, 255, 0 );
    text( "rotZDelta = " + rotZDelta, 20, height - 40 );
    text( "rotZ = " + rotZ, 20, height - 20 );
    text( "transZ = " + transZ, 20, height-60 );
    text( "rotYDelta = " + rotYDelta, 20, height - 80);
    text( "rotY = " + rotY,20, height - 100);
    text( "rotXDelta = " + rotXDelta + rotZ, 20, height - 120);
    text( "rotX = " + rotX, 20, height - 140);
}  

void mouseDragged() {
  if (mouseButton == LEFT){
    x = x + xDist;
    xDist = mouseX - x;
    rotX += xDist;
    y = y + yDist;
    yDist = mouseY - y;
    rotY -= yDist;
  }
  else if (mouseButton == RIGHT) {
    y = y + zDist;
    zDist = (mouseY - y);  
    transZ -= zDist;
  }
}


void keyPressed() {
  if (key == 'X') {
    rotXDelta += 1;
  }
  else if (key == 'x') {
    rotXDelta -= 1;
  }
  else if (key == ' ') {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    zDist = 0;
    transZ = 0;
  }
  else if (key == 's') {
    rotXDelta = 0;
    rotYDelta = 0;
    rotZDelta = 0;
    xDist = 0;
  }
  else if (key == 'Y') {
    rotYDelta += 1;
  }
  else if ( key == 'y') {
    rotYDelta -= 1;
  }
  else if ( key == 'Z') {
    rotZDelta += 1;
  }
  else if (key == 'z') {
    rotZDelta -= 1;
  }
}





