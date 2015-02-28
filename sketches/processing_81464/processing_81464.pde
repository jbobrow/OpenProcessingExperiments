
// P_4_3_3_02.pde
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



PImage img;
PImage img2;


int pixelIndex;
color c;

float x1, x2, x3, y1, y2, y3;
float curvePointX = 0; 
float curvePointY = 0;

int counter;
int maxCounter = 1000;

void setup() {
  size(600, 450);
  
  img= loadImage("sharpie.png");
  img2= loadImage("paper.png");
  
  background(img2);
  cursor(img);
  

  background(img2);
  x1 = 0;
  y1 = height/2;
  x2 = width/2;
  y2 = 0;
  x3 = width;
  y3 = height/2;
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  smooth();
  noFill();




  // first line


  float hueValue = hue(c);
  strokeWeight(hueValue/5);
  stroke(c);

  beginShape();
  curveVertex(x1, y1);
  curveVertex(x1, y1);
  for (int i = 0; i < 10; i++) {
    curvePointX = constrain(x1+random(-100, 100), 0, width-1);
    curvePointY = constrain(y1+random(-100, 100), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x1 = curvePointX;
  y1 = curvePointY;


  // second line


  float saturationValue = saturation(c);
  strokeWeight(saturationValue/2);
  stroke(c);

  beginShape();
  curveVertex(x2, y2);
  curveVertex(x2, y2);
  for (int i = 0; i < 10; i++) {
    curvePointX = constrain(x2+random(-100, 100), 0, width-1);
    curvePointY = constrain(y2+random(-100, 100), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x2 = curvePointX;
  y2 = curvePointY;


  // third line


  float brightnessValue = brightness(c);
  strokeWeight(brightnessValue/100);
  stroke(c);

  beginShape();
  curveVertex(x3, y3);
  curveVertex(x3, y3);
  for (int i = 0; i < 10; i++) {
    curvePointX = constrain(x3+random(-100, 100), 0, width-1);
    curvePointY = constrain(y3+random(-100, 100), 0, height-1);
    curveVertex(curvePointX, curvePointY);
  }
  curveVertex(curvePointX, curvePointY);
  endShape();
  x3 = curvePointX;
  y3 = curvePointY;


  counter++;
  if (counter>=maxCounter) noLoop();
}

void keyPressed(){
  switch(key){
  case BACKSPACE:
    background(img2);
    break;
  }
}



