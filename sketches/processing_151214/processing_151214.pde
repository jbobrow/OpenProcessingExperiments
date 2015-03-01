
/*
 * Creative Coding
 * Week 2, Exercise 1 - 25 Squares
 * by Muhammad Faheem Sarani
 *
 * This program is my interpretation of Vera Molnar's 25 Squares.
 *
 * It draws 5 rows of 5 squares in the display window
 * at slightly random position every two seconds.
 */

void setup() {
  size(560, 560);
  rectMode(CORNER);
  frameRate(0.5); // the draw function is called once every two seconds
  randomSeed(hour() + minute() + second() + millis());
}

void draw() {

  background(237, 234, 239);

  int num = 5; // number of squares in each row and column
  int cellsize = 100; // the size of each square

  for(int i = 0; i < num; i++) {
    for(int j = 0; j < num; j++) {

      int colour = (int) random(2);

      // choose a colour for each square at random
      if (colour == 0) {
        fill(133, 67, 59, 200);
        stroke(129, 65, 54, 200);
      } else if (colour == 1) {
        fill(173, 31, 31, 200);
        stroke(167, 18, 18, 200);
      }

      int gap = (int) random(4, 15); // select a random gap between each square
      rect(20 + gap + cellsize * i, 20 + gap + cellsize * j, cellsize, cellsize);

    }
  }

  // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("Muhammad Faheem Sarani.jpg");
  }

} // end of draw



