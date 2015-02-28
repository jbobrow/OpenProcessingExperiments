
/*
Name : Firadaus Khazis
 This is my experiment on Peasy Cam
 Mouse Left Click Button to rotate the model
 Mouse Right Click Button to retract individual cubes from its grid
 Mouse Right Click Button (Hold) to zoom in and out
 */

//import peasy cam
import peasy.*;
PeasyCam cam;
int cubeWidthSwitch = 0;
int distanceFactor = 1;


// setup
void setup() {
  size (1000, 500, P3D);
  //call the peasy Cam, and set the default view by 1000 pxl from center
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  frameRate (5);
}

void draw () {
  //rotate in X and Y direction using Peasy Cam features
  rotateX(-.5);
  rotateY(-.5);
  background(255);
  //add stroke to cubes
  stroke(100, 100, 100);
  //grid start at -200 and end at 200, this will allow 0 value to be
  //center of the object
  for ( int gridX = -250 ; gridX <250 ; gridX = gridX +80 ) {
    for (int gridY = -250 ; gridY < 250 ; gridY = gridY +80) {
      for (int gridZ = -250 ; gridZ < 250 ; gridZ = gridZ+80) {



        //the 3D definition start here
        pushMatrix ();
        // grid factor by distanceFactor and correspond to mouse click
        translate (gridX*distanceFactor/2, gridY*distanceFactor/2, gridZ*distanceFactor/2);
        // fill(255, random(8, 118),0,90);
        fill (100, 100, 100, 100);
        box(30, 30, 30);
        popMatrix();
      }
    }
  }
}

// for each mouse press at right button, distanceFactor value add or
// or reduce
void mousePressed() {
  if ( mouseButton == RIGHT && distanceFactor == 1 ) {
    distanceFactor = 2 ;
  }
  else if ( distanceFactor ==2  && mouseButton == RIGHT) {
    distanceFactor = 1 ;
  }
}


