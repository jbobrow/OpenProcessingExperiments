
// A custom modified version of the Generative Gestaltung's P_4_3_1_01.pde code
// Made for YSDN 2005 2011 Interactivity 2 Class: Project 2


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
 * pixel mapping. each pixel is translated into a new element
 * 
 * MOUSE
 * position x/y        : various parameters (depending on draw mode)
 * 
 * KEYS
 * 1-9                 : switch draw mode
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
boolean savePDF = false;

PImage img;

void setup() {
  size(700, 525);
  smooth();
  img = loadImage("room1.jpg");
  println(img.width+" x "+img.height);
}


void draw() {
  //Begin savePDF 'if' set true
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(255);

  float mouseXFactor = map(mouseX, 0,width, 0.05,1);
  float mouseYFactor = map(mouseY, 0,height, 0.05,1);
  
  //fills background with a rect which shift to yellow
  //as the mouse X value  reaches 0 based on the mouse's 
  //proximity to the window
  fill(230,mouseY+120,mouseX,150);     
  rect(0,0,700,525);  

  for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // Grid position + tile size
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // Get current color
      color c = img.pixels[gridY*img.width+gridX];
      // Greyscale conversion functions
      int greyscale =round(red(c)*0.22+green(c)*0.707+blue(c)*0.071);

        // greyscale to stroke weight
        float w1 = map(greyscale, 0,255, 40,0.1);
        stroke(0);
        strokeWeight(w1 * mouseXFactor);
        line(posX, posY, posX+mouseX-mouseY/3, posY+11);    
  
    }
  }
  //end savePDF 'if' function as false
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

//establishes key commands for output as png and pdf format
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}






























