
/*
 * made for the online course
 * Creative Coding
 * by Indae Hwang and Jon McCormack
 * 2014 Monash University
 * provided on futurelearn.com
 * Week 2, 25 Squares
 * This is a first try to make a generator for pictures like 25 Squares by Vera Molnar
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  // there is no noStroke, because I like the comicy appearance ;)
  frameRate(1);
  background(255); // clear the screen to white
}

int saves = 0; // initialiizing count for saved pictures

void draw() {

  background(255); // clear the screen to white
  int num = 5;
  int cellsize = 100;
  int gap = cellsize / 10;
  for (int rows=0; rows<num; rows++) {
    for (int columns=0; columns<num; columns++) {
      int colour = (int) random(1, 4);
      int offsetX = (int) random(30);
      int offsetY = (int) random(30);
      if (colour == 1) {
        fill(200, 0, 0, 200);
        rect((rows + 1)* gap + rows * cellsize + offsetX, (columns +1) * gap + columns * cellsize + offsetY, cellsize, cellsize);
      } else {
        fill(250, 0, 0, 200);
        rect((rows + 1)* gap + rows * cellsize + offsetX, (columns +1) * gap + columns * cellsize + offsetY, cellsize, cellsize);
      }
    }
  }
  // saving all the pictures with differing names
  // commented out, because saving pictures on the web is pointless
  // saveFrame(str(saves) + "25sq.jpg");
  // saves = saves +1;
}



