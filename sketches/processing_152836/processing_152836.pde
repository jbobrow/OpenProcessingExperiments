
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Version of Juan C. Morales
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(10);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(random(0, 255), random(0, 255), random(0, 255)); // clear the screen to grey
  
  int num = (int) (5);   // select a random number of squares each frame
  int gap = (int) random(-10, 20); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width -(num + 1) * gap) / (float)num;

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        fill(random(0, 255), random(0, 255), random(0, 255), 200); // rectangle
        rect(random (-8,8) +gap * (i+1) + cellsize * i, random (-8,8) +gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
    if (keyPressed == true && key=='s') {
saveFrame("yourName.jpg");
    }
} //end of draw 



