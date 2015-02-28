
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
boolean savePDF = false;


float tileCount = 20;
color circleColor = color(255,20);
int circleAlpha = 60;
int actRandomSeed = 30;

void setup(){
  size(667, 500);
 PImage img1;
  img1 = loadImage("100_3119cd.jpg");
    background(img1); //load snowman picture, set it up as background
    
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  translate(width/tileCount/2, height/tileCount/2);
  smooth();
  randomSeed(actRandomSeed);
  stroke(circleColor, circleAlpha);//determines colour of circle's stroke and glow
  strokeWeight(6); //how widespread the glow is

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX)/2;
      float shiftY = random(-mouseX, mouseX)/2;

      ellipse(posX+shiftX, posY+shiftY, 2, 2);
    }
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mousePressed() {
 
actRandomSeed = (int) random(10);
PImage img1;
  img1 = loadImage("100_3119cd.jpg");
    background(img1);
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




