



// please use mouse to pan the sculpture 
// in the middle of the screen and to 
// rotate it.

// use strg-e to export 


import eu.fluidforms.utils.*;
import eu.fluidforms.processing.*;
import eu.fluidforms.geom.*;
import eu.fluidforms.primitives.*;
import eu.fluidforms.io.*;
import eu.fluidforms.parser.*;

/**
 *  Example by Guillaume LaBelle
 *     for superCAD exporter
 */

import superCAD.*;

float x1 = 400;
float y1 = 400;

float dx; 
float dy;

float fillValX = 2.9;  
float fillValY = height/2.0;
float CameraAngleAdd =  0.1; // 0.1; 

float oldX=0;
float oldY=0;
float oldZ=0; 

float oldX1=0;
float oldY1=0;
float oldZ1=0; 

boolean FirstTime = true; 
boolean record = false;

// =================================================================================

void setup()
{ 
  size( 600, 600, P3D );
  FluidForms.setup(this);
} // setup

void draw()
{ 
  background(0);
  stroke(111, 110, 110);
  fill(111, 110, 110);  
  float x=200;  // or 310
  dx = 171.0;
  dy = - 348.0; 

  if(record) {
    beginRaw("superCAD."+"ObjFile", "output.obj");   
  }

  if (fillValX<0.1) { 
    fillValX=0.01;  
  }
  if (fillValX>15) { 
    fillValX=15;  
  }    

  while(x<602) {

    float y = dx * sin ( x/50 );
    fill( x,y,0);   
    MyBox ( 1*( x+1+1), 1*( y+440+1), 1*(x+dy), 
    530-y+1, x+210+1, 2*y-dy, 14, 
    color (255,0,0));   
    x += fillValX ; 

  }   //  While

  if (record) {
    endRaw();
    record = false;
  }

} // draw 

void keyPressed() {

  // use strg-e

  if (key == CODED) {

    if (keyCode == UP) {
      fillValX += CameraAngleAdd;
    } 
    else if (keyCode == DOWN) {
      fillValX += -CameraAngleAdd;
    } 
    else if (keyCode == RIGHT) {
      fillValY += CameraAngleAdd;
    } 
    else if (keyCode == LEFT) {
      fillValY += -CameraAngleAdd;
    } 
    else {

    }
  } 
  else {   
    // not key == CODED 
    // 
    record = true;
  }
}

void MyBox(float x1, float y1, float z1, float x2, float y2, float z2, float weight, color strokeColour)
// was called drawLine; programmed by James Carruthers
// see http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9
{
  PVector p1 = new PVector(x1, y1, z1);
  PVector p2 = new PVector(x2, y2, z2);
  PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
  float rho = sqrt(pow(v1.x,2)+pow(v1.y,2)+pow(v1.z,2));
  float phi = acos(v1.z/rho);
  float the = atan2(v1.y,v1.x);
  v1.mult(0.5);

  pushMatrix();
  translate(x1,y1,z1);
  // normally just   translate(v1.x, v1.y, v1.z);
  translate(v1.x-300, v1.y-500, v1.z-850);
  rotateZ(the);
  rotateY(phi);
  noStroke();
  fill(strokeColour);
  // box(weight,weight,p1.dist(p2)*1.2);
  box(weight,weight,p1.dist(p2)*1.2);
  popMatrix();
}


