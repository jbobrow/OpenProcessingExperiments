
// This is a recreation of Mondrian Composition III
// adding structures to my original program
// by schien@mail.ncku.edu.tw

void setup() {
  // setup canvas size 800x784
  size(800, 784);
  // setup background (use white)
  background(255);
}

void draw() {
  // draw the black lines
  drawBlackLines();
  
  // draw rectangles
  drawRectangles();
}

void drawBlackLines () {
// vertical line at 367 (width from 362-373)
  strokeWeight(11);
  line(367, 0, 367, height);
  // top horizontal line at 316 (width from 309-327)
  strokeWeight(19);
  line(0, 316, width, 316);
  // bottom horizontal line at 508 (width from 500-517)
  strokeWeight(17);
  line(0, 508, width, 508);
  // left vertical disecting line at 80 (width from 74-86)
  strokeWeight(12);
  line(80, 508, 80, height);
  // right vertical disecting line at 614 (width from 607-619)
  line(614, 508, 614, height);
  // lower horizontal disecting line at 747 (width from 741-755)
  strokeWeight(14);
  line(369, 747, 612, 747);
}

void drawRectangles () {
  noStroke();
  // draw the red rectangle (width 362, height 309)
  fill(255, 0, 0);
  rect(0, 0, 362, 307);
  // draw the yellow rectangle (width 74, height 517)
  fill(230, 200, 0);
  rect(0, 517, 74, height-517);
  // draw the blue rectangle (x 373, y 517, height at 741, width at 607)
  fill(0, 0, 150);
  rect(373, 517, 609-373, 741-517);

}
