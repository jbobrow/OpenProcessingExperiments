
/*
  Ka Kit Cheong
  Parameterized Chair
  03/01/2012
*/

// libraies
import peasy.*;

// objects
PeasyCam cam;

PFont myFont;

// global variables
int camDistance = 450;

int chairWidth = 150;
int chairThickness = 15;
int chairDepth = 160;

int chairBackHeight = 240;

int chairLegWidth = 15;
int chairLegDepth = chairLegWidth;
int chairLegHeight = 170;

void setup(){
  size(500, 500, P3D);
  smooth();
  
  noFill();
  stroke(255);
  strokeWeight(0.4);
  
  cam = new PeasyCam(this, camDistance);
  
  myFont = loadFont("Helvetica.vlw");
  textFont(myFont, 12);
  textAlign(LEFT, BASELINE);
}

void draw(){
  background(0);
  
  renderChair();
}

void renderChair(){
    // seat
  box(chairWidth, chairThickness, chairDepth);
  
  // back
  pushMatrix();
  translate(0, -chairBackHeight/2+chairThickness/2,-chairDepth/2-chairThickness/2);
  box(chairWidth, chairBackHeight, chairThickness);
  popMatrix();
  
  // front legs
  // left
  pushMatrix();
  translate(-chairWidth/2+chairLegWidth/2, chairLegHeight/2+chairThickness/2, chairDepth/2-chairLegDepth/2);
  box(chairLegWidth, chairLegHeight, chairLegDepth);
  popMatrix();
  
  // right
  pushMatrix();
  translate(chairWidth/2-chairLegWidth/2, chairLegHeight/2+chairThickness/2, chairDepth/2-chairLegDepth/2);
  box(chairLegWidth, chairLegHeight, chairLegDepth);
  popMatrix();
  
  // back legs
  // left
  pushMatrix();
  translate(-chairWidth/2+chairLegWidth/2, chairLegHeight/2+chairThickness/2, -chairDepth/2-chairLegDepth/2);
  box(chairLegWidth, chairLegHeight, chairLegDepth);
  popMatrix();
  
  // right
  pushMatrix();
  translate(chairWidth/2-chairLegWidth/2, chairLegHeight/2+chairThickness/2, -chairDepth/2-chairLegDepth/2);
  box(chairLegWidth, chairLegHeight, chairLegDepth);
  popMatrix();
}

void randomize(){
  chairWidth = floor(random(20, 220));
  chairDepth = floor(random(40, 200));
  chairBackHeight = floor(random(50, 250));
  chairLegHeight = floor(random(50, 200));
}


void keyPressed(){
  if (key == 'r'){
    randomize();
  }
}


