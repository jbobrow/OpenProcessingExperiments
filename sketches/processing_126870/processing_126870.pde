
/* This program draws a black outlined square with a red diagonal 
 line from the lower left corner toward the upper right corner; 
 and another red line from the lower right corner to the upper 
 left using limited set of Processing functions
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

  //line
  stroke(255, 0, 0);
  line(10, height-10, 200, 300);
  line(width/4, height/4, width-10, height-10);
}

