
/*
This code goes with Day06_forloops_02 so you can compare. 
*/

int line_y = 0;
int space_between_lines = 10;

void setup() {
  size(600, 600);
  //White background for high contrast
  background(255);
  //low frameRate to watch the computer draw
  frameRate(10);
}

void draw() {
  //don't keep drawing if the computer is drawing off screen
  if (line_y < height) {
    
    //draw a horizontal line all the way across the screen
    line(0, line_y, width, line_y);
    
    //draw the next line "space_between_lines" down from the last one
    line_y = line_y + space_between_lines;
  } 
}

