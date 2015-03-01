
/*
 * Written for the FutureLearn Creative Coding Course of Monash University
 * Week 2, 03 - n squares
 * This version selects a random number of squares
 * and a random gap between them. 
 * From this it calculates the width of each square 
 * then draws the squares using two nested 'for' loops.
 * Both colour and position of each square is somewhat randomized.
 *
 * Modified by Luvi, June 15th 2014
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call every 2 seconds
  randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(240); // clear the screen to grey
  
  int numH = (int) random(3, 12); // select a random number of squares per row
  int gapH = (int) random(5, 50); // select a random horizontal gap between each square in a row
  
  // calculate the size of each square for the given number and gap between them
  float cellsize = ( width - (numH + 1) * gapH ) / (float)numH;
  
  // calculate the max number of squares in a column
  int numV = (height - gapH) / ((int)cellsize + gapH);
  
  // calculate the resulting vertical gap between each square in a column
  int gapV = (height - numV * (int)cellsize)/(numV + 1);
 

    for (int i=0; i<numH; i++) {
      for (int j=0; j<numV; j++) {
        
       // draw the squares
       // inserting the randomizing of colours
       int c = (int) random(10);
       if (c <= 8) {
       fill(250, 120, 27, 180); 
       }
       else {
       fill(random(255), random(255), random(255), 180);
       }
       // inserting the randomizing of position
       rect(gapH+random(-5,5) * (i+1) + cellsize * i, gapV+random(-5,5) * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
       
} //end of draw 
