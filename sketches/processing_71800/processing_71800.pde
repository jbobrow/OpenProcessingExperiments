
int chairSeatHeight      = 100;
int chairWidth           = 50;
int chairDepth           = 50;
int chairBackHeight      = 100;
int chairFrameThickness  = 10;

void setup() {
  size(1024, 1024, P3D);

  smooth();
  fill(0);
  stroke(0);
  noLoop();
}

void draw() {
  background(0);
  ortho(0, width, 0, height, 0, 300);
  fill(213,20,20);
  pushMatrix();
  translate(width, height);
  rotateX(-PI / 9);
  rotateY(PI / 8);

  scrambleChair();
  drawChair();
  popMatrix();
}

void drawChair() {
  // back
  pushMatrix();
  translate(chairWidth/2, chairBackHeight/2);
  box(chairWidth, chairBackHeight, chairFrameThickness);
  popMatrix();

  // seat
  pushMatrix();
  translate(chairWidth/2, chairBackHeight + chairFrameThickness/2, chairDepth/2 - chairFrameThickness/2);
  box(chairWidth, chairFrameThickness, chairDepth);
  popMatrix();


  // legs
  pushMatrix();
  translate(chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, 0);
  box(chairFrameThickness, chairSeatHeight, chairFrameThickness);
  popMatrix();

  pushMatrix();
  translate(chairWidth - chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, 0);
  box(chairFrameThickness, chairSeatHeight, chairFrameThickness);
  popMatrix();

  pushMatrix();
  translate(chairWidth - chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, chairDepth - chairFrameThickness);
  box(chairFrameThickness, chairSeatHeight, chairFrameThickness);
  popMatrix();

  pushMatrix();
  translate(chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, chairDepth - chairFrameThickness);
  box(chairFrameThickness, chairSeatHeight, chairFrameThickness);
  popMatrix();
}

void scrambleChair() {
  chairSeatHeight = floor(random(10, 200));
  chairWidth      = floor(random(10, 200));
  chairDepth      = floor(random(10, 200));
  chairBackHeight = floor(random(10, 200));
}

void mousePressed() {
  redraw();
}


