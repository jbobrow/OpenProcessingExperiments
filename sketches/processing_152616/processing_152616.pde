
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
* CHALLENGE - imitate "25 SQUARES" image by VERA MOLNAR
* ---5 by 5 grid, slightly random "wiggle" (+ or -) positioning of each square
*/

int num = 5;                       // number of squares in row/line : 5 x 5 = 25 squares all the time
int gap = (int) random(5, 10);     // select a random gap between each square

int selectRed = 5;       //  5 out of 25 probability = red,     
color red  = color(247, 57, 57, 200);
color dark = color(83, 27, 24, 180);
   
void setup() { 
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(.5);  // set the frame rate to 1 draw() call per 2 seconds
  randomSeed(hour() + minute() + second() + millis());  // set up random seed
  
}

void draw() {

  background(228,226,239); // clear the screen to grey
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        
        int boxColor;   //which color fill to choose 
        boxColor = (int) random (25);   // picking random number out of 25 
        
        if (boxColor < selectRed) {    // if its less than 5, then fill red  (5 out of 25 squares should be red) 
          fill (red) ;
        }
        else {
          fill(dark);
        }

        rect(gap * (i+1) + cellsize * i + random(-10,10), gap * (j+1) + cellsize * j + random(-10,10), cellsize, cellsize);

      }
    }
} //end of draw 

