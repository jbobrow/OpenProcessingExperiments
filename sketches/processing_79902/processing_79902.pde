
// Credit: http://www.generative-gestaltung.de/P_2_1_2_01
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
 */
 
float tileCount = 15;
color circleColor = color(255,30);
int circleAlpha = 50;
int actRandomSeed = 30;
 
void setup(){
  size(800, 533);
   PImage img;
   img = loadImage("freezer.jpg");
   background(img); 
}
 
void draw() {
  translate(width/tileCount/2, height/tileCount/2);
  smooth();
  randomSeed(actRandomSeed);
  stroke(circleColor, circleAlpha);//determines colour of circle's stroke and glow
  strokeWeight(10); //the width of glow
 
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
       
      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;
 
      float shiftX = random(-mouseX, mouseX)/2;
      float shiftY = random(-mouseX, mouseX)/2;
      ellipse(posX+shiftX, posY+shiftY, 1, 1);
    }
  }
      if(mousePressed){
          PImage img;
          img = loadImage("freezer.jpg");
          background(img);
      }
}
 



