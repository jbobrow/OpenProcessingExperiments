
void setup() { // Starts the program
  size(500,500); // Sets the size of the window 
  background(255); // White background
}

void draw(){ // This Draws however in this case nothing will be drawn
}

// Mouse code 
void mousePressed() { // Whenever the user clicks the mouse any ellipse will appear. The shape will appear wherever the mouse is at the time.
  stroke(0); // border thickness of the ellipse and colour
  fill(31,76,252); // Colour of the ellipse 
  rectMode(CENTER); // The ellipse center point
  ellipse(mouseX,mouseY,30,30); // Ellipse is the shape that will appear when the mouse is clicked.
                     // X and Y. These position the mouse in the X and Y axis and also the size of the ellipse
                          
}

// Key code
void keyPressed() { // Clears what has been drawn and brings up a fresh blank page. 
  background(255); // White background colour 
}
