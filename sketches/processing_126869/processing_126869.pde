
/* This program draws a black outlined square with a 
 red horizontal line from the midpoint of the left 
 side toward the middle of the right side using limited set of
 Processing functions
 Created by Olaf Keller
 */

void setup() { 
  size (500, 500);
  background(255);
}

void draw() {
  //squere
  stroke(0);
  strokeWeight(1);
  rect(10, 10, 480, 480);

  //line
  stroke(255, 0, 0);
  strokeWeight(400);
  strokeCap(SQUARE);
  line(11, height/2, 222, height/2);
}

