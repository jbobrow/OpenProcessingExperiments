
// P_4_0_01.pde
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
 * draw a grid of streched copies of an image 
 * 
 * MOUSE
 * position x           : tile count horizontally
 * position y           : tile count vertically
 * 
 * KEYS
 * s                    : save png
 */

PImage img;

void setup(){
  size(750, 750);
  img = loadImage("mai.jpg");
}

void draw(){
  float tileCountX = mouseY/100+1;
  float tileCountY = mouseX/400+1;
  float stepX = width/tileCountY;
  float stepY = height/tileCountX;
  for (float gridY = 0; gridY < height; gridY += stepY){
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(img, gridX, gridY, stepX, stepY);
    }
  }
}

void keyReleased(){
  if (key=='r' || key=='R') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


