
// P_2_1_2_01.pde
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
 * changing size and position of circles in a grid
 * 	 
 * MOUSE
 * position x          : circle position
 * position y          : circle size
 * left click          : random position
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

float tileCount = 20;
color circleColor = color(0);
int circleAlpha = 100;
int actRandomSeed = 5;
float x=0.5;
float y=2;
float a = 500;
float b = 360;
float r = 3;
float t = 0;
float dt = 0.01;

void setup(){
  size(1080,720);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

//  translate(width/tileCount/2, height/tileCount/2);

  background(30);
  smooth();
  noFill();
  if (t>=0) {
    t += dt;
    
     float Xposition=a+(a-r/2)*sin(t);
     
     randomSeed(actRandomSeed);

  stroke(abs(255*cos(t*x)), abs(255*cos(4*t*x)), abs(255*cos((x*t)/2)), circleAlpha);
  strokeWeight(2);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-Xposition, Xposition)/20;
      float shiftY = random(-Xposition, Xposition)/20;

      ellipse(posX+shiftX, posY+shiftY, (a+(a-r/2)*sin(t))/15, (a+(a-r/2)*sin(t))/15);
    }
  }
      
      
   
    
  } else {
    exit();
  }
  
  

//  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}





