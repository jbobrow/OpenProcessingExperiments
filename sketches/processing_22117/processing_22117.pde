
// P_4_1_2_02.pde
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
 * image feedback process.
 * 
 * KEYS
 * del, backspace      : clear screen
 * s                   : save png
 */

import processing.pdf.*;
boolean savePDF = false;

float tileCountX = 1;
float tileCountY = 1;
float tileWidth, tileHeight;

int count = 0;
int colorStep = 20;
int circleCount;
float endSize, endOffset;

float tileCount = 20;
color moduleColor = color(0);
int moduleAlpha = 180;
int max_distance = 500; 


int actRandomSeed = 0;
PImage img;

void setup() {
  size(800, 800);
  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
  //img = loadImage(selectInput("select an image"));
  img = loadImage("tea.jpg");
  background(255);
  image(img,0,0);
}

void draw() {
  
  smooth();
  noFill();
  strokeWeight(1);
  stroke(#ffffff);
 
  int j1 = (int) random(0,width);
  int k1 = (int) random(0,height);

  int j2 = round(j1 + random(-10, 10));
  int k2 = round(k1 + random(-10, 10));

  int l = 150;
  int m = 50;

  copy(j1,k1, l,m, j2,k2, l,m);
  
  translate((width/tileCountX)/2, (height/tileCountY)/2);
  circleCount = mouseX/300 + 1;
  endSize = map(mouseX, 0,width, tileWidth/2.0,0);
  endOffset = map(mouseY, 0,height, 0,(tileWidth-endSize)/2);

  for (int gridY=0; gridY<=tileCountY; gridY++) {
    for (int gridX=0; gridX<=tileCountX; gridX++) {  
      pushMatrix();
      
      
      translate(tileWidth*gridX, tileHeight*gridY);
      scale(1, tileHeight/tileWidth);

      int toggle = (int) random(0,4);
      if (toggle == 0) rotate(-HALF_PI);  
      if (toggle == 1) rotate(0);  
      if (toggle == 2) rotate(HALF_PI);  
      if (toggle == 3) rotate(PI);  
      
      // draw module
      for(int p=0; p<circleCount; p++) {
        float diameter = map(p, 0,circleCount-1, tileWidth,endSize);
        float offset = map(p, 0,circleCount-1, 0,endOffset);
        ellipse(offset, 0, diameter,diameter);
       }
      popMatrix();
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
 
  
}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


