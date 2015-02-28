
// Credit: http://www.generative-gestaltung.de/P_2_3_3_01
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
 * MOUSE
 * draw text with mouse position
 * 
 * KEYS
 * del, backspace      : clear screen
 * arrow up            : angle distortion +
 * arrow down          : angle distortion -
 */
float x = 0, y = 0;
float stepSize = 5.0;

PFont font;
String letters = "Mmmmmmm chocolate.";
int fontSizeMin = 2;
float angleDistortion = 0.0;
int counter = 0;

void setup() {
  size(583, 375);
  smooth();

  x = mouseX;
  y = mouseY;

  font = loadFont("Arvo-48.vlw");
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(#FFFAD3);

  // load an image in background
   PImage img = loadImage("store.jpg");
   image(img, 0, 0);
}

void draw() {
 if (mousePressed){
  float d = dist(x,y, mouseX,mouseY);
    textFont(font,fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

      if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize; 
    }
  }
}
void mousePressed() {
  x = mouseX;
  y = mouseY;
}


void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down 
  if (keyCode == UP) angleDistortion += 0.2;
  if (keyCode == DOWN) angleDistortion -= 0.2; 
  
  //delete text
    if (keyPressed) {
       if(key == BACKSPACE || key == DELETE) {
      PImage bg;
      bg = loadImage("store.jpg");
      background(bg);
      }
    }
}



















