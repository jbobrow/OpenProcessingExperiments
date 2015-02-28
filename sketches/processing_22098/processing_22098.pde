
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

float tileCount = 5;
color circleColor = color(147,187,222,70);
int circleAlpha = 100;
int actRandomSeed = 0;

void setup(){
  size(600, 600);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  frameRate (300);
  
  PImage img;
  img = loadImage("shower.png"); 
  image(img, 0, 0, 600, 600);

  translate(300, 330);

  smooth();
  fill (119, 149,176,70);
  
randomSeed(actRandomSeed);

  stroke(circleColor, circleAlpha);
  strokeWeight(mouseY*0.5);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

     float shiftX = random(++mouseX, ++mouseX)/10;
      float shiftY = random(++mouseX, ++mouseX)/10;
      
      smooth(); 
      beginShape(); 
      vertex(15, 30);
      bezierVertex(posX+shiftX, 12, mouseY/15, 10, 40, 35); 
      bezierVertex(50, 70, posX-shiftX, posY+shiftY, mouseY/15, mouseY/15); 
      endShape();

    }
  }
  
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




