
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

void setup() {
  size(450, 500);
  rectMode(CORNER);
  noStroke();
  frameRate(4);  // set the frame rate to 1 draw() call per second
}


void draw() {

  int r;
  int g;
  int b;
  int al;
  r = (int) random (10,250);
  g = (int) random (10,250);
  b = (int) random (10,250);
  al = (int) random(0,255);
  background(r/2,g/2,b/2);
  
  int num = 5;   // select a random number of squares each frame
  int gap = (int) random(8, 20); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsizeX = ( width - (num + 1) * gap ) / (float)num;
  float cellsizeY = ( height - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsizeX = " + cellsizeX);
  println("cellsizeY = " + cellsizeY);
  
  // calculate shadow offset
 
 float offsetX = random (4,8);
 float offsetY = random(2,10);
 
 println("offsetY = " + offsetY);
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(r*2,g*3,b*4, 250); // shadow
        rect(gap * (i+1) + cellsizeX * i + offsetX, gap * (j+1) + cellsizeY * j + offsetY, cellsizeX, cellsizeY);

        fill(r*2, g, b*2,al); // rectangle
        rect(gap * (i+1) + cellsizeX * i, gap * (j+1) + cellsizeY * j, cellsizeX, cellsizeY);
      }
    }
    
    if (keyPressed == true) {
      saveFrame("picture+####.png");
    };
} //end of draw 



