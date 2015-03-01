
/*
 * Written for the FutureLearn Creative Coding Course of Monash University
 * Week 2, 03 - n squares
 * 
 * Challenge:  try changing the display window size to be 800 wide by 600 high 
 * and still distribute the squares uniformly on the grid.
 * (also including a 20% probability of randomic colour choice for each square)
 * 
 */

void setup() {
  size(800, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(240); // clear the screen to grey
  
  int numH = (int) random(3, 12); // select a random number of squares for each row
  int gapH = (int) random(5, 50); // select a random horizontal gap between each square in a row
  
  // calculate the size of each square for the given and gap between them
  float cellsize = ( width - (numH + 1) * gapH ) / (float)numH;
  
  // calculate the max number of squares in a column given the size
  int numV = (height - gapH) / ((int)cellsize + gapH);
  
  // calculate the resulting vertical gap between each square in a column
  int gapV = (height - numV * (int)cellsize)/(numV + 1);
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<numH; i++) {
      for (int j=0; j<numV; j++) {
        
        // shadow
        fill(140, 180); 
        rect(gapH * (i+1) + cellsize * i + offsetX, gapV * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

       // rectangle
       // inserting the randomizing of colours
       int c = (int) random(10);
       if (c <= 8) {
       fill(245, 0, 57, 180); 
       }
       else {
       fill(random(255), random(255), random(255), 180);
       }
       rect(gapH * (i+1) + cellsize * i, gapV * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
      
} //end of draw 

