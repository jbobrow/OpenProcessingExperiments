
/*
This code goes with Day06_forloops_01 so you can compare. 

This demonstrates how for loops run every time the program runs.
*/

int line_y = 0;
int space_between_lines = 10;

void setup() {
  size(600, 600);
  //White background for high contrast
  background(255);
  //low frameRate so you can see the computer draw
  frameRate(10);
}

void draw() {
  //Starting with line_y set to 0; 
  //repeat while line_y is < the height of the screen;
  //set line_y to itself + space_between_lines
  for (line_y = 0; line_y < height; line_y = line_y + space_between_lines) {
    //draw a horizontal line all the way across the screen
    line(0, line_y, width, line_y);
  }
}

