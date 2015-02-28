
/* This program draws a black outlined square with a 
 red horizontal line centered on the axis between the 
 midpoint of the left side and the midpoint of the right 
 side and a red diagonal line centered on the axis 
 between the lower left and upper right corners using 
 limited set of Processing functions
 Created by Olaf Keller
 */

void setup() { 
  size (500, 500);
  background(255);
  smooth();
}

void draw() {
  //squere
  stroke(0);
  strokeWeight(1);
  rect(10, 10, 480, 480);

  //lines
  stroke(255, 0, 0);
  strokeWeight(40);
  strokeCap(SQUARE);
  line(80, height/2, 480, height/2);
  strokeWeight(120);
  strokeCap(SQUARE);
  line(60, 440, 360, 140);
}

