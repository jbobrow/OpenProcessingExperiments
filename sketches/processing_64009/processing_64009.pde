
float radian;
// current rotation value
float currRotation;
// last rotated value
float prevRotation;
float normalPos;
float rotateCounter;

void setup() {
  size(400, 400);
  smooth();
}

void draw() { 
  background(255);
  // point at mouse, width/2 & height/2 is arrow position
  int dx = mouseX - width/2;
  int dy = mouseY - height/2;
  radian = atan2(dy, dx);

  println(degrees(radian + PI));
  arrow(width/2, height/2);
}

void arrow(int x, int y) {
  // fill it flamingo pink
  fill(255, 178, 255);
  // set current rotation, convert to degrees
  currRotation = degrees(radian+PI);
  pushMatrix();
  translate(x, y);
  rotation();
  // draw an arrow
  beginShape();
  vertex(-40, 0);
  vertex(0, -40);
  vertex(0, 40);
  endShape(CLOSE);
  popMatrix();
}

// if current rotation is between a certain value then rotate
// and save the rotation value in prevRotation. If it isn't between
// the value then rotate to prevRotation (so it won't snap back to 0).
void rotation() {
  if (currRotation < 60) {
    rotate(radians(currRotation));
    prevRotation = currRotation;
    normalPos = .5; // count down to 0
  }
  else if (currRotation > 300) {
    rotate(radians(currRotation));
    normalPos = -.5; // count to 0
    prevRotation = currRotation;
  }
  else {
    rotate(radians(prevRotation));
    // rotate back to standard position
    if (prevRotation >= 1 && prevRotation <= 360) {
      prevRotation -= normalPos;
    }
  }
}


