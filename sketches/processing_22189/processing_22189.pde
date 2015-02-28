
// M_1_2_01.pde
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
 * order vs random! 
 * how to interpolate beetween a free composition (random) and a circle shape (order)
 * 
 * MOUSE
 * position x          : fade between random and circle shape
 * 
 * KEYS
 * p                   : save pdf
 * s                   : save png
 */

import processing.pdf.*;
boolean savePDF = false;
PImage b;
PImage c;
// Images must be in the "data" directory to load correctly



int actRandomSeed = 0;
int count = 150;

void setup() {
  size(600,403); 

  smooth();
  b = loadImage("DSC_0077.JPG");
  c = loadImage("saltshaker.png");
      cursor(c, 10/2, 10/2);
}



void draw() {

  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
image(b, 0, 0);
  noStroke();

  float faderX = (float)mouseX/width;

  randomSeed(actRandomSeed);
  float angle = radians(360/float(count));
  for (int i=0; i<count; i++){
    // positions
      float randomX = random(20, 500); 
    float randomY = random(20, 500);
    float circleX = width/80 + cos(angle*i)*400;
    float circleY = height/80 + sin(angle*i);

    float x = lerp(randomX,180, faderX);
    float y = lerp(randomY,250, faderX);

    fill(2);
    ellipse(x,y,4,4);
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void mouseReleased() {
  actRandomSeed = (int) random(20);
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}






