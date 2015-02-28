
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

import java.util.Calendar;

PImage img;


void setup() {
  size(1024, 1024);
  //img = loadImage(selectInput("select an image"));
  img = loadImage("billedetest.jpg");
  background(255);
  image(img,0,0);  
}


void draw() {
  int x1 = (int) random(0,width);
  int y1 = (int) random(0,height);

  int x2 = round(x1 + random(-25, 20));
  int y2 = round(y1 + random(-25, 20));

  int w = 170;
  int h = 45;

  copy(x1,y1, w,h, x2,y2, w,h);
}


void mousePressed(){
  float tileCountX = mouseX/3+1;
  float tileCountY = mouseY/3+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 0; gridY < height; gridY += stepY){
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(img, gridX, gridY, stepX, stepY);
      redraw();
      }
    }
      
  }
  
  
//void keyReleased() {
 // if(keyCode == DELETE || keyCode == BACKSPACE) {
   // background(255);
    //image(img,0,100);
  //}
  //if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");  
  //}
  
 
  






