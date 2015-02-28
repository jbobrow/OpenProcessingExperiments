
//Source:http://www.generative-gestaltung.de/P_2_3_3_01
// P_2_3_3_01.pde
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
 * draw tool. shows how to draw with dynamic elements. 
 * 
 * MOUSE
 * drag                : draw with text
 * 
 * KEYS
 * del, backspace      : clear screen
 * arrow up            : angle distortion +
 * arrow down          : angle distortion -
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */

import processing.pdf.*;
boolean recordPDF = false;

float x = 0, y = 0;
float stepSize = 5.0;

PFont font;
String letters = "Alaa Abuamra, Project 3, 2012-2013, Interactivity 2, Exersise 2B, Sketch 2 ";
int fontSizeMin = 3;
float angleDistortion = 0.0;

int counter = 0;


void setup() {
  // use full screen size 
  size(500,500);
  background(0);
  smooth();
  colorMode(HSB);
  cursor(CROSS);

  x = mouseX;
  y = mouseY;

  //font = createFont("Arial",10);
  font = createFont("ArnhemFineTT-Normal",10);
  textFont(font,fontSizeMin);
  textAlign(LEFT);
  fill(255);


  /*
  // load an image in background
   PImage img = loadImage(selectInput("select a background image"));
   image(img, 0, 0, width, height);
   */
}
float Hue = random(1);

void draw() {

  colorMode(HSB, 600, 200, 300); // colormode range set to size of sketch
  filter(BLUR);
  strokeWeight(mouseX/80);
  strokeJoin(ROUND);
  stroke(Hue+mouseX/40, 100, 500); // change the stroke Hue
  line(pmouseX, pmouseY, mouseX, mouseY);
  if (mousePressed) {
    Hue=random(40, 600);
    filter(BLUR);
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
   Hue=random(40, 600);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);

  // ------ pdf export ------
  // press 'r' to start pdf recordPDF and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      textAlign(LEFT);
      fill(0);
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255); 
    }
  } 
}

void keyPressed() {
  // angleDistortion ctrls arrowkeys up/down 
  if (keyCode == UP) angleDistortion += 0.1;
  if (keyCode == DOWN) angleDistortion -= 0.1; 
   Hue=random(40, 600);
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


















