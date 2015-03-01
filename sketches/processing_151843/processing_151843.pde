
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */
 
 /*
 * From the workshop at Monash University in FutureLearn
 * Adjustemets by Pablo Rosero 
 * www.pablorosero.com
 */

float xRandom;
float yRandom;
int colSel;
PImage img;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  stroke(0, 50);
  strokeWeight(2);
  frameRate(1);  // set the frame rate to 1 draw() call per second
  img = loadImage("grain.png");
  img.resize(112, 112);
 
  
}


void draw() {
 img.resize(112, 112);

  background(195, 211, 239); // clear the screen to grey

  int num = 5;   // select a random number of squares each frame
  int gap = 6; // select a random gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // print out the size of each square
  println("cellsize = " + cellsize);

  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;


  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {

      xRandom = random(-10, 10);
      yRandom = random(-10, 10);

      colSel = (int)random(10);

      if (colSel <= 4) {
        colSel = 1;
      }
      else {
        colSel = 2;
      }

      switch(colSel) {
      case 1: 
        fill(random(125, 130), 11, 23, 250);
        break;
      case 2: 
        fill(random(38, 58), 9, 16, random(240, 250));
        break;
      }
      // rectangle
      rect(gap * (i+1) + cellsize * i+xRandom, gap * (j+1) + cellsize * j+yRandom, cellsize, cellsize);
      image(img, gap * (i+1) + cellsize * i+xRandom, gap * (j+1) + cellsize * j+yRandom);
    }
  }
} //end of draw 

void keyPressed() {
  
    // save your drawing when you press keyboard 's'
  if (key == 's') {
    saveFrame("yourName.jpg");
  }
  
  if (key == 'c') {
    noLoop();
  }
  if (key == 'v') {
    loop();
  }
}


