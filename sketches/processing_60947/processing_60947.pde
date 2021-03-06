
// M_3_2_01.pde
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
 * draws a grid with a horizontal wave
 * 
 * MOUSE
 * click + drag        : rotate
 * 
 * KEYS
 * p                   : save pdf
 */
 
import processing.pdf.*;

// number of grid points horizontal
int xCount = 7;
// number of grid points vertical
int yCount = 5;

// view rotation
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = 0, rotationY = 0, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY; 

// image output
boolean savePDF = false;


void setup() {
  size(800, 800, P3D);
}


void draw() {
  if (savePDF) beginRaw(PDF, timestamp()+".pdf");

  background(255);
  fill(255);
  strokeWeight(2);  

  setView();

  scale(80);

  // Draw mesh
  for (int y = 0; y < yCount; y++) {
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= xCount; x++) {

      float z = sin(x);

      vertex(x, y, z);
      vertex(x, y+1, z);
    }
    endShape();
  }

  // image output
  if(savePDF == true) {
    endRaw();
    savePDF = false;
  }
}



void keyPressed(){
  if(key=='p' || key=='P') savePDF = true; 
}


void mousePressed(){
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}



void setView() {
  translate(width*0.2,height*0.2);

  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX)*0.25; 
    rotationY += (targetRotationY-rotationY)*0.25;  
  }
  rotateX(-rotationY); 
  rotateY(rotationX); 
}


String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}




