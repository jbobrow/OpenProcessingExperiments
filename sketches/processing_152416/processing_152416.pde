
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

int num = 5;  // number of rows/cols
void setup() {
  size(700, 700);
  rectMode(CORNER);
  noStroke();
//  noLoop();
  frameRate(1);
  colorMode(HSB, 255, 255, 100);
  randomSeed(hour() + minute() + second() + millis());
  
  //random(n) //random number between 1 and n
}


void draw() {
  background(135, 25, 95);
  
  int num = 5;
  int gap = 10;  
  float cellsize = 130;
  
  println("cellsize = " + cellsize);
  println("gap = " + gap);
  
  int i=0;
  int j=0;
  for (i=0; i<num; i++) {
    for (j=0; j<num; j++) {
      
      float offsetX = random(-20, 10);
      float offsetY = random(-20, 10);
      
      int r = (int) random(10);
      int colour = (r == 0) ? 247 : 100;
      
      println("colour: " + r);
      
      fill(colour, 50, 50, 180); // rectangle
      rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);
      // save your drawing when you press keyboard 's'
    }
  }
  
  if (keyPressed == true && key=='s') {
    saveFrame("nicky" + i + j + ".jpg");
  }
  
  
} //end of draw 



