
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
 * Move mouse horizontally to multiply the image.
 */

//indicating an image will be included. 
PImage img;

//initial image size and selection. 
void setup(){
  size(450, 220);
  img = loadImage("trees.jpg");
}

//the amount of tiles multiply as the cursor floats along the horizontal axis.
// the smaller the number mouseX/(?) the more tiles multiply. 

void draw(){
  float tileCountX = mouseX/90;
  float tileCountY = mouseY/90;
  float stepX = width/tileCountX;
     
//got rid of multiplying tiles on the vertical axis.
//changed the float gridX to -10 (as opposed to a positive number). 

  float stepY = height;
      for (float gridY = 0; gridY < width; gridY += stepY){
       for (float gridX = -10; gridX < width; gridX += stepX){
        image(img, gridX, gridY, stepX, stepY);
    }
  }
}

//got rid of the key "s" which saved png files because I thought it wasn't necessary for the approach I took. 


