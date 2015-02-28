
// bars that change color according to mouse position

void setup() {
  size(900, 255);  
  noStroke();
}

//--------------------------------------------------------
void draw() {
  // calculate the number of iterations for the loop based on 
  // the width of each bar and the width of the window
  int barWidth = 50; 
  int numBars = width/barWidth;
  
  // use a loop to draw a bunch of rectangles 
  for (int i=0; i < numBars; i++) {
    // the x position is the count * the size of each rectangle
    int x = i * barWidth;
  
    int c = abs(mouseX - x); // take the absolute value of the difference

    // map 'c' from a value that varies between 0 and width
    // to a value that varies between 0 and 255 usable for colors
    c = int( map(c, 0, width, 0, 255) );
    fill(mouseX, c, mouseY);

    rect(x, 0, barWidth, height);
  } 
}




