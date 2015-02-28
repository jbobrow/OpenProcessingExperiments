
// ----------------------------------------------------------------
// Igor Odriozola Sustaeta, 2014-03-03 (Bilbao, Basque Country)
// Week 5, Assignment 4
// ----------------------------------------------------------------
// In this work the generation of a tubular form is shown along the
// z axis. The tube is composed of parallel circles, which are, at
// the same time, composed of several pearls.
// Each circle appears when a mouse button is pressed, and its
// radius depends on the distance of the mouse to the center of the
// screen.
// ----------------------------------------------------------------
// There are also a control button by means of the keybord:
// - 's' or 'S' keys: to save the current image as a png file.
// ----------------------------------------------------------------

// Global variables:
// - Background image:
PImage img;
// - Number of pearls in each circle:
int numElements = 36;
// - Array to store the points of the last drawn circle:
PVector[] v = new PVector[numElements];
// - Step along the z axis:
int zStep = 100;
// - Initial value of z:
int zInit = 0;
// - z variable:
int z = zInit;

// 'setup' code block
void setup(){
  // size and background color:
  size(1000, 700, P3D);
  background(#000000);
  img = loadImage("maxresdefault.jpg");
  image(img, 0, 0);
  
  // Initialize point vector:
  for (int i=0; i<numElements; i++){
    v[i] = new PVector();
    v[i].x = width/2;
    v[i].y = height/2;
    v[i].z = 0;
  }
}

// 'draw' code block
void draw(){
  directionalLight(126, 126, 126, 0, 0, -1);
}

void mouseClicked() {
  // Set eye's point of view:
  camera((width/2)-300, height/2, 300, (width/2)-150, height/2, 0, 0, 1, 0);
  // Calculate circle's points:
  float r = sqrt(sq(mouseX-(width/2)) + sq(mouseY-(height/2)));
  float x = 0;
  float y = 0;
  float prevX = 0;
  float prevY = 0;
  float prevZ = 0;
  for (int i=0; i<=numElements; i++){
    // Calculate pearls' coordinates:
    x = width/2 + r*sin(i*(TWO_PI/numElements));
    y = height/2 + r*cos(i*(TWO_PI/numElements));
    // Draw line from prev to next:
    if (i != 0){
      stroke(#FFFFFF, 100);
      strokeWeight(1);
      line(prevX, prevY, prevZ, x, y, z);
    }
    // Draw a line to the previous linked point:
    if ((i != numElements)&&(z != zInit)){
      line(x, y, z, v[i].x, v[i].y, v[i].z);
    }
    // Draw a pearl in the circle:
    if (i != numElements){
      stroke(#FFFFFF, 100);
      strokeWeight(2);
      noFill();
      pushMatrix();
      translate(x, y, z);
      sphere(3);
      popMatrix();
    }
    // Save previous point:
    prevX = x;
    prevY = y;
    prevZ = z;
    // Save point in the PVector array:
    if (i != numElements){
      v[i].x = x;
      v[i].y = y;
      v[i].z = z;
    }
  }
  z -= zStep;
}

// Key inputs:
void keyReleased(){
  switch(key){
    case 's': case 'S':
      saveFrame("picture.png");
      break;
  }
}



