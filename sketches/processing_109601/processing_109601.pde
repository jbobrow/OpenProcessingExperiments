
float yPos = 0.0;
float xPos = 0.0;


void setup() {  // setup() runs once

  size(200, 200);
  frameRate(12);
}
 
void draw() {  // draw() loops forever, until stopped
  yPos = random(height);
    xPos = random(width);

  if (yPos < 0) {
    yPos = height;
  }
  if (xPos < 0) {
      xPos = width;
  }
  
    line(xPos, 0, height, yPos);

  line(0, yPos, width, yPos);
}
