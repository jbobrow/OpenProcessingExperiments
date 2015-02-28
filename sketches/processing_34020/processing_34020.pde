
// P_4_3_1_02.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * pixel mapping. each pixel is translated into a new element (svg file).
 * take care to sort the svg file according to their greyscale value.
 * see also "_4_3_1_02_analyse_svg_grayscale.pde" 
 * 
 * KEYS
 * 1-4                     : for behaviour
 * s                       : save png
 * p                       : save pdf
 */
// *right-click or left-click:  respawn
//Agent follows the Light where it finds maximum brightness.



///////////////////////Variables/////////////////////
import processing.pdf.*;
boolean recordPDF = false;

int formResolution = 15;
int stepSize = 4;
float distorsionFactor = 5;
float initRadius = 150;
float centerX, centerY;
float[] x = new float[formResolution];
float[] y = new float[formResolution];

boolean filled = false;
boolean freeze = false;
int mode = 0;

//////////library loaded to turn on video camera/////////////////

import processing.video.*;
Capture myCapture;

//define "base" to be an image that is processed by the agents
PImage base;

PShape[] shapes;
int shapeCount = 0;

    float multi = 2;


void setup() {
  size(800,800); 
  smooth();
  
  ////camera/////
  myCapture = new Capture(this, width, height, 30);
  
  // init form
  centerX = width/2; 
  centerY = height/2;
  float angle = radians(360/float(formResolution));
  for (int i=0; i<formResolution; i++){
    x[i] = cos(angle*i) * initRadius;
    y[i] = sin(angle*i) * initRadius;  
  }

  stroke(245,151,176,100);
  background(0);
  frameRate(30);
  
}

void draw() {
    println(frameCount);
    
    
    /////screen is to refresh after every 900 frames, since frameRate is 30 per second so screen refreshes after every 30s/////
    if(frameCount % 900 == 0)
    background(0);

   myCapture.loadPixels();
   base = myCapture; // this is the PImage for the agents to useF
   //background(255);
   
   
   ////alogrithm to calculate maximum brightness on screen//////////////////

  float hLuma = 0;
  int lumaX = 0;
  int lumaY = 0;

  //loadPixels();
  for (int gridX = 0; gridX < base.width; gridX++) {
    for (int gridY = 0; gridY < base.height; gridY++) {
     
      // get current color
      color c = base.pixels[gridY*base.width+gridX];
      // greyscale conversion
      int greyscale = round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);
      
         if((0.3 * red(c) + 0.59 * green(c) + 0.11 * blue(c)) * multi > hLuma){
           hLuma = (0.3 * red(c) + 0.59 * green(c) + 0.11 * blue(c)) * multi;
           lumaX = width-gridX;
           lumaY = gridY;
       }
    }
  }

  // floating towards mouse position
  if (lumaX != 0 || lumaY != 0) {
    centerX += (lumaX-centerX) * 0.01;
    centerY += (lumaY-centerY) * 0.01;
  }

  // calculate new points
  for (int i=0; i<formResolution; i++){
    x[i] += random(-stepSize,stepSize);
    y[i] += random(-stepSize,stepSize);
    // ellipse(x[i], y[i], 5, 5);
  }

  strokeWeight(0.75);
  if (filled) fill(245,151,176,100);
  else noFill();

  if (mode == 0) {
    beginShape();
    // start controlpoint
    curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

    // only these points are drawn
    for (int i=0; i<formResolution; i++){
      curveVertex(x[i]+centerX, y[i]+centerY);
    }
    curveVertex(x[0]+centerX, y[0]+centerY);

    // end controlpoint
    curveVertex(x[1]+centerX, y[1]+centerY);
    endShape();
  }

  if (mode == 1) {
    beginShape();
    // start controlpoint
    curveVertex(x[0]+centerX, y[0]+centerY);

    // only these points are drawn
    for (int i=0; i<formResolution; i++){
      curveVertex(x[i]+centerX, y[i]+centerY);
    }

    // end controlpoint
    curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);
    endShape();
  }
 
}


void captureEvent(Capture myCapture) {
  myCapture.read();
}




void mousePressed() {
  // init forms on mouse position
  centerX = mouseX; 
  centerY = mouseY;

  // circle
  if (mode == 0) {
    centerX = mouseX;
    centerY = mouseY;
    float angle = radians(360/float(formResolution));
    float radius = initRadius * random(0.5,1.0);
    for (int i=0; i<formResolution; i++){
      x[i] = cos(angle*i) * radius;
      y[i] = sin(angle*i) * radius;
    }
  } 

  // line
  if (mode == 1) {
    centerX = mouseX;
    centerY = mouseY;
    float radius = initRadius * random(0.5,5.0);
    float angle = random(PI);
    radius = initRadius*4;
    angle = 0;
    
    float x1 = cos(angle) * radius;
    float y1 = sin(angle) * radius;
    float x2 = cos(angle-PI) * radius;
    float y2 = sin(angle-PI) * radius;
    for(int i=0; i<formResolution; i++) {
      x[i] = lerp(x1, x2, i/(float)formResolution);
      y[i] = lerp(y1, y2, i/(float)formResolution);
    }
  }
}


void keyPressed() {
  if (keyCode == UP) stepSize++;
  if (keyCode == DOWN) stepSize--;
  stepSize = max(stepSize, 1);
  println("stepSize: " + stepSize);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);

  if (key == '1') filled = false;
  if (key == '2') filled = true;
  if (key == '3') mode = 0;
  if (key == '4') mode = 1;

  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      stroke(245,151,176,100);
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255); 
    }
  } 

  // switch draw loop on/off
  if (key == 'f' || key == 'F') freeze = !freeze;
  if (freeze == true) noLoop();
  else loop();
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

















