
/*
 * Creative Coding
 * Week 2
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey

  int num = 5; //(int) random(3, 12);   // select a random number of squares each frame
  int gap = 4; //(int) random(5, 20); // select a random gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // print out the size of each square
  println("cellsize = " + cellsize);


  fill(247, 57, 57, 180); // rectangle
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {

    if (random(10) < 1)
      fill(255, 20, 20, 180);
    else
      fill(100, 60, 60, 180); // rectangle

      rect(gap * (i+1) + cellsize * i + random(-5, 5), gap * (j+1) + cellsize * j + random(-5, 5), cellsize, cellsize);
    }
  }
} //end of draw 

