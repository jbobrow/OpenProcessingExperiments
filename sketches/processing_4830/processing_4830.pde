
/**
 Based on Exercise 6-5 (p. 94) of _Learning Processing_ by
 Daniel Shiffman. Added moving dot and delay of drawing lines
 to illustrate difference between draw loop and the inner line
 drawing loop.
*/
int endY;  // y value of last of a series of lines
int bx;    // x value of moving dot

void setup() {
  size(200, 200);
  stroke(255);
  fill(255);
  frameRate(30);
  
  // Start endY with a negative value to delay appearance
  // of lines
  endY = -100;
  bx = 0;
}

void draw() {
  background(0);

  // Draw a series of lines starting at the top, going down
  // to endY, which increase each frame.
  for (int y = 0; y <= endY; y += 5) {
    line(0, y, width, y);
  }
  
  // draw the dot
  ellipse(bx, 40, 5, 5);
  
  // Increase the y value of the last line, which increases
  // the number of lines.
  if (endY < height) {
    endY += 5;
  }
  bx += 2;
}

