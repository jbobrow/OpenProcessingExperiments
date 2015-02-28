
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

PImage img;
PImage img2;

void setup() {
  size(600, 580);
  //img = loadImage(selectInput("select an image"));
  img = loadImage("pic.png");
  img2 = loadImage("pictwo.png");
  background(255);
  image(img,0,0);
}

void draw() {
  int x1 = (int) random(0,width);
  int y1 = (int) random(0,height);

  int x2 = round(x1 + random(-50, 70));
  int y2 = round(y1 + random(-70, 30));

  int w = 50;
  int h = 50;
  

  copy(x1,y1, w,h, x2,y2, w,h);
}

void keyReleased() {
  if(keyCode == ENTER) {
    image(img,0,0);
    image(img2,0,0);
    tint(255,10);
  }
}


