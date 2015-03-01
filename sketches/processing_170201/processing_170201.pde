
// Processing Final Project
// Made by Mr. Mueller
// November 5, 2014

int spacing = 10;  // sets how far apart the lines will be along the edge

void setup() {
  size(401, 401); // extra pixel for line drawn to corner
}

void draw() {
  background(255); // erases the background to avoid streaks
  checkCenter(25); // changes color with a center size of 25px

  // draws lines from top/bottom edges to mouse
  for (int x = 0; x < width; x += spacing) {
    line(x, 0, mouseX, mouseY);      // top
    line(x, height, mouseX, mouseY); // bottom
  }
  
  // draws lines from left/right edges to mouse
  for (int y = 0; y < height; y += spacing) {
    line(0, y, mouseX, mouseY);      // left
    line(width, y, mouseX, mouseY);  // right
  }
}

// changes color of lines depending on central location of mouse, or if the mouse is pressed
void checkCenter(int centerSize) {
  if (mouseX > width/2-centerSize && mouseX < width/2+centerSize &&    // within centerSize of mouseX on either side 
      mouseY > height/2-centerSize && mouseY < height/2+centerSize) {  // within centerSize of mouseY above or below
    stroke(0, 0, 255);       // blue
  } else if (mousePressed) { // only occurs when mouse is not in the center
    stroke(255, 0, 0);       // red
  } else stroke(0);          // black
}

