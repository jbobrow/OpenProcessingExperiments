
// P_2_1_2_03.pde
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
 * changing size of circles in a rad grid depending the mouseposition
 *   
 * MOUSE
 * position x/y        : module size and offset z
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */
 
//Revised by Jeremy Sarachan

int actRandomSeed = 0;
int max_distance = 600; //change this file.

void setup(){
  size(600, 600, P3D);
}

void draw() {

  background(255);
  smooth();
  noFill();

  randomSeed(actRandomSeed);

  stroke(0,180);
  strokeWeight(3);

  for (int gridY=0; gridY<width; gridY+=25) {
    for (int gridX=0; gridX<height; gridX+=25) {

      float diameter = dist(mouseX, mouseY, gridX, gridY);
      diameter = diameter/max_distance * 40;
      pushMatrix();
      translate(gridX, gridY, diameter*5);
      //translate(gridX, gridY, 10);
      ellipse(0, 0, diameter, diameter);    //// also nice: rect(...)
      popMatrix(); 
    }
  }

}

