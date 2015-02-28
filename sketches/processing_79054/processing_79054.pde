
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

 

float tileCount = 10;
color circleColor = color(0);
int circleAlpha = 180;
int actRandomSeed = 0;

void setup(){
  size(700, 700);
}

void draw() {
 fill(random(0), random(255), random(0), 0);
  stroke(random(0), random(0), random(0), 05);

  line(mouseX, mouseY, pmouseX, pmouseY);
  randomSeed(actRandomSeed);

  stroke(circleColor, circleAlpha);
  strokeWeight(mouseY/1000);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX)/0.5;
      float shiftY = random(-mouseX, mouseX)/0.5;

      ellipse(posX+shiftX, posY+shiftY, mouseY/1, mouseY/1);
    }
  }
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


class Bubble {
  color c;
  //velocity and accelerator
  float v, ac;
  //initial position
  float x0, y0;
  // dimension
  float di, d;
   
  Bubble(float tempX, float tempY){
    c = color(255);
    v = 25;
    ac = 0.1;
    x0 = tempX;
    y0 = tempY;
    di = 1;
 }
   
  void display(){
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    if (di <= 80 && mousePressed){
    ellipse(x0, y0, di, di);
      di++;
    }
    }
  }
 
  void drop(float tempD){







     }


