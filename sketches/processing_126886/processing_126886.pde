
/* This program draws a black outlined square with a red 
 diagonal line centered on the axis between the upper left 
 and lower right corners and another red diagonal line centered 
 on the axis between the lower left and upper right corners using 
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
  strokeWeight(100);
  strokeCap(SQUARE);
  line(100, 100, 300, 300);
  strokeWeight(1);
  strokeCap(SQUARE);
  line(100, 400, 460, 40);
}

