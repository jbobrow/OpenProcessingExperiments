


// ----------------------------------------------------------
// imports

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

// ----------------------------------------------------------
// consts 

final float width1=5;
final float height1=7;

// ----------------------------------------------------------
// vars 

float animate = 0;
boolean reversee = true;
PeasyCam pc; 
int [][] colors1 = new int [260][260] ; 
int i1=0;

// ----------------------------------------------------------
// Main routines 

void setup() {

  size(500, 500, P3D);

  // camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  /*camera(300, 700, 400, 
   width/2.0, height/2.0, 0, 
   0, 1, 0);*/

  // cam 
  pc = new PeasyCam(this, 0, 0, 0, 200);
  pc.pan (250, 250); 
  pc.setDistance(460);  // distance from looked-at point
  pc.rotateX(radians(-45));

  // pre-def colors for each box
  for (int y =0; y < 250; y += 20) {
    for (int x = 0; x < 250;  x += 20) {
      colors1 [y][x]= int(random(x+y));
    }
  }
}

void draw() {
  noStroke();
  background (0); 

  if (animate > 1) {
    reversee = !reversee;
  } 
  else if (animate < 0) {
    reversee = !reversee;
    i1++; 
    if (i1>100) {
      i1=0;
    }
  }

  if (reversee) {
    animate = animate + .01;
  } 
  else {
    animate = animate - .01;
  }

  for (int y =0; y < 250; y += 20) {
    for (int x = 0; x < 250;  x += 20) {

      // different ways to set the color
      fill((x+y)*animate/1.7, 1*33, 1*111);
      //fill(x, 1*33, 1*111);
      //fill ( colors1 [y][x]+(x+y)*animate/5.7, 1*33, 1*111);
      //use only the pre-defined random color
      //fill ( colors1 [y][x], 1*33, 1*111);

      // stroke or noStroke:
      noStroke(); 
      // stroke(254);

      BoxMaker(x, y, 0, width1, height1, (x+y)*animate);
      BoxMaker(width-x-10, y, 0, width1, height1, (x+y)*animate);
      BoxMaker(x, height-y-10, 0, width1, height1, (x+y)*animate);
      BoxMaker(width-x-10, height-y-10, 0, width1, height1, (x+y)*animate);
    }
  }
}

// ----------------------------------------------------------
// Minor routines 

void BoxMaker(
float x1, float y1, float z1, 
float w, float h, float d) {
  // function designed to make the box-command more accessible 
  pushMatrix();
  translate(x1, y1, z1); 

  if (i1 % 3 == 0) {
    box(d*.1);
  }
  else if (i1 % 2 == 0) {
    rotateX(radians(90));
    ellipse (1, 1, w*2.1, d);
  }
  else {
    box(w, h, d);
  }
  popMatrix();
}


