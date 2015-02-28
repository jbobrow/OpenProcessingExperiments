
// exercise 2011-09-29
// draw lines: Create a program to draw many lines based on the mouse position
// schien@mail.ncku.edu.tw

void setup() {
  size(150, 480);
  smooth();
}

void draw() {
  // reset the background
  background(255, 255, 200);
  // reset pen color
  stroke(0);
  // draw two lines following the mouse
  strokeWeight(2);
  line(mouseX, mouseY, 80, 80);
  line(mouseX, mouseY, 0, 0);
  // draw a thick line
  strokeWeight(8);
  line(width, height, mouseX-10, mouseY-10);
  // draw a bunch of lines around the mouse
  stroke(255,0,0);
  strokeWeight(1);
  int offset = 20;
  int starEdge = 50;
  line(mouseX-offset-starEdge, mouseY-offset-starEdge, mouseX-offset, mouseY-offset);
  line(mouseX+offset+starEdge, mouseY+offset+starEdge, mouseX+offset, mouseY+offset);
  line(mouseX+offset+starEdge, mouseY-offset-starEdge, mouseX+offset, mouseY-offset);
  line(mouseX-offset-starEdge, mouseY+offset+starEdge, mouseX-offset, mouseY+offset);
}


