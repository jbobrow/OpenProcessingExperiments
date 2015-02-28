
// A custom modified version of the Generative Gestaltung's P_4_1_2_01.pde code
// Made for YSDN 2005 2011 Interactivity 2 Class: Project 2


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

void setup() {
  // establishes sketch size and loads image
  size(700, 700);
  background(255);
  img = loadImage("blendd.jpg");
  image(img,0,0);
}

void draw() {
  
  int x1 = (mouseX);
  int y1 = (mouseY);

  //re-interprets x1 and y1 for different use
  int x2 = round(x1 + random(-50, 10));
  int y2 = round(y1 + random(-40, 10));
  
  //established width and height for use in copy floats
  // w is set as a random range
  int w = (int) random(35, 50);
  int h = 40;
  
  // mouse activation
  if (mousePressed)  {
    copy(x1,y1, w,h, x2,y2, w,h);
  }
}


//Establishes key commands for reset and save frame. 
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


