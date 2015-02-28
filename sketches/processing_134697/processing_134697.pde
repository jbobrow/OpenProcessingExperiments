
// Charlotte Stiles cc 2014
//cstiles
//hw#6
/*
Keys:
X= positive x-axis rotation
x= negative x-axis rotation
Y= positive y-axis rotation
y= negative y-axis rotation
Z= positive z-axis rotation
z= negative z-axis rotation
s= stop rotation
Space-bar= translation reset

Mouse Movement:

Left button
Drag up= inc Y
Drag down= dec Y
Drag right= inc X
Drag right= dec X

Right mouse button
Drag up= inc Z
Drag down= dec Z 
*/

float sx, sy, sz, ss; // The size and spacing of initials corresponds with window size
float rotX, rotY, rotZ; //rotations for x,y&z
float rotDeltaX, rotDeltaY, rotDeltaZ;//change of rotation x,y&z
float transX, transY, transZ;//translation for x,y&z

void setup() {
  size(600, 700, P3D);
  // the spacing of each sphere will adjust with the size window
  sx=width; 
  sy=height/1.1;
  sz=height/2;
  // the size will adjust as well
  ss=width/16;
  //there is no rotation to start
  rotX  = 0; 
  rotY = 0;
  rotZ = 0;
  rotDeltaX = 0;
  rotDeltaY = 0;
  rotDeltaZ = 0;
}
void draw() {
  pushMatrix();
  prepareWindow();
  drawSpheres();
  popMatrix();
}

void drawSpheres() {
  Sphere(sx*.1, sy*-.22, sz*-.4, ss);
  Sphere(sx*0, sy*-.27, sz*-.3, ss);
  Sphere(sx*-.09, sy*-.2, sz*-.2, ss);
  Sphere(sx*-.1, sy*-.1, sz*-.1, ss);
  Sphere(sx*0, sy*-.05, sz*0, ss);
  Sphere(sx*.09, sy*0, sz*.1, ss*.9);
  Sphere(sx*.12, sy*.09, sz*.2, ss*.85);
  Sphere(sx*.05, sy*.15, sz*.3, ss*.8);
  Sphere(sx*-.04, sy*.15, sz*.4, ss*.75);
  Sphere(sx*-.1, sy*.10, sz*.5, ss*.7);
  // axis lines


  strokeWeight( 3 );
  stroke( 200, 200, 0 );
  line( 0, 0, 200, 0, 0, -200 );  // Z axis line
  stroke( 0, 200, 200 );
  line( 0, 200, 0, 0, -200, 0 );  // Y axis line
  stroke( 250, 0, 0 );
  line( 200, 0, 0, -200, 0, 0 );  // X axis line

}

void Sphere (float x, float y, float z, float s) {
  noStroke();
  pushMatrix();
  translate(x, y, z);
  //rotateY(mouseX * 0.005);
  // stroke(166, 0, mouseX/3);
  fill(150);
  //sphereDetail(mouseX / 80);
  sphere(s);
  popMatrix();
}

void keyPressed( )
{
  // x-axis rotation in positive direction
  if ( key == 'X') {
    rotDeltaX += 1;
  }

  // x-axis rotation in negative direction
  if ( key == 'x') {
    rotDeltaX -= 1;
  }

  // y-axis rotation in positive direction
  if ( key == 'Y') {
    rotDeltaY += 1;
  }

  // y-axis rotation in negative direction
  if ( key == 'y') {
    rotDeltaY -= 1;
  }

  // z-axis rotation in positive direction
  if ( key == 'Z') {
    rotDeltaZ += 1;
  }

  // z-axis rotation in negative direction
  if ( key == 'z') {
    rotDeltaZ -= 1;
  }
  
  

  // stop rotation
  if ( key == 's') {
    rotDeltaX = 0;
    rotDeltaY = 0;
    rotDeltaZ = 0;
  }

  // set translation variables to zero
  if ( key == ' ') {
    transX = 0;
    transY = 0;
    transZ = 0;
  }

  // reset all
  if ( key == 'r') {
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


void mouseDragged( )
{
  // mouse button?
  if ( mouseButton == LEFT )
  {
    // was the mouse dragged?
    if ( pmouseX < mouseX ) //move right
    {
      transX+=1;
    }
    else if ( pmouseX > mouseX ) // move left
    {
      transX-=1;
    }
    else if ( pmouseY < mouseY ) // move up
    {
      transY+=1;
    }
    else if ( pmouseY > mouseY ) // move down
    {
      transY-=1;
    }
  }
  //mouse button?
  if ( mouseButton == RIGHT )
  {
    //where dragged?
    if (pmouseY > mouseY)//move up
    {
      transZ +=1;
    }
    else if (pmouseY < mouseY)
      transZ -= 1;
  }
}

void showStats( ){
  fill(255);
  textSize(17);

  // translations
  text("Translations", width/4, height-65);
  text("X: "+transX+"    Y: "+transY+"    Z: "+transZ, width/4, height-40);
  //top rotation
  text("Rotations", width/4, 40);
  text("    X: "+rotX+"    Y: "+rotY+"    Z: "+rotZ, width/4, 65);
  text("Delta-X: "+rotDeltaX+"    Delta-Y "+rotDeltaY+"    Delta-Z "+rotDeltaZ, width/4, 95);
}
void prepareWindow() {
  background(0);
  showStats();
  translate( width/2, height/2, 0 );
  translate(transX, transY, transZ);
  rotX+=rotDeltaX;
  rotY+=rotDeltaY;
  rotZ+=rotDeltaZ;
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  directionalLight( 255, 255, 255, .5, .5, -1 );
}

