
// Source code from:

// P_2_3_1_02.pde
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
 * drag                : draw
 * 
 * KEYS
 * 1-4                 : switch default colors
 * c                   : clear screen
 */

PImage img1;
color col = color(181,157,0,100);

 void setup(){
   size (600,397);
   background(255);
   img1 = loadImage("paint.jpg");
   noStroke();
   smooth();
   image(img1,0,0);
   frameRate(120);
   // img variable will be this image
 }
 
 void draw(){
   float sizex = (15);
   float sizey = (15);
     if (mousePressed) {
    ellipse(mouseX,mouseY,sizex,sizey);
    fill(col);
     }   else {}
 }
 
 void keyReleased() {
  if (key == '1') col = color(181,157,0,100);
  if (key == '2') col = color(0,130,164,100);
  if (key == '3') col = color(87,35,129,100);
  if (key == '4') col = color(197,0,123,100);
  if (key == 'c') image(img1,0,0);
 }

