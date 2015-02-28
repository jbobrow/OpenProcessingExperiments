
// Amir Dekel
// November 2013
// http://amirdekel.me

/**************************************************************
 * Mouse horizontal position controls the opacity of the lines
 * Mouse vertical position controls the level of canvas clearing
 * Click left mouse button to change color
 * Click right mouse button to toggle light/dark modes
 * Drag mouse horizontally to change lengths of lines
 * Drag mouse vertically to change diameter of entire circle
 *************************************************************/

int NUM_OF_LINES = 500;
int MIN_FILL_ALPHA = 5;
int MAX_FILL_ALPHA = 50;
float MIN_LINE_LENGTH = 0.1;
float MAX_LINE_LENGTH = 0.5;
float MIN_LINE_POSITION = 0.2;
float MAX_LINE_POSITION = 1.0;
color[] COLORS = { #000000, #CC1111, #11CC11, #1111CC, #CCCC11, #CC11CC, #1111CC };

boolean dark = false;
color bg = #FFFFFF;
int curColor;
boolean dragged;
float mouseXBegin, mouseYBegin;
float lineLength;
float linePosition;
float lineLengthBegin, linePosBegin;

Line[] lines;

void setup() {
  size(600, 600);

  lines = new Line[NUM_OF_LINES];
  for (int i=0; i < NUM_OF_LINES; i++) {
    lines[i] = new Line(i * TWO_PI / NUM_OF_LINES);
  }

  curColor = 0;
  dragged = false;
  lineLength = (MIN_LINE_LENGTH + MAX_LINE_LENGTH) / 2;
  linePosition = (MIN_LINE_POSITION + MAX_LINE_POSITION) / 2;
}

void draw() {
  noStroke();
  // Map cursor vertical position to alpha channel used to clear the canvas
  float fillAlpha = map(mouseY, 0, height, MAX_FILL_ALPHA, MIN_FILL_ALPHA);
  fill(bg, fillAlpha);
  rect(0, 0, width, height);

  for (int i=0; i < NUM_OF_LINES; i++) {
    lines[i].update();
    lines[i].display();
  }
}

void mouseClicked() {
  // Clicking the left mouse button changes stroke color
  if (mouseButton == LEFT) {
    curColor += 1;
    if (curColor == COLORS.length)
      curColor = 0;
  }
  // Clicking the right mouse button toggle light and dark modes
  if (mouseButton == RIGHT) {
    dark = !dark;
    bg = dark ? #000000 : #FFFFFF;
    COLORS[0] = dark? #FFFFFF : #000000;
  }
}

void mouseReleased() {
  dragged = false;
}

void mouseDragged() {
  if (!dragged) {
    dragged = true;
    mouseXBegin = mouseX;
    mouseYBegin = mouseY;
    lineLengthBegin = lineLength;
    linePosBegin = linePosition;
  }

  // Map mouse horizontal position relative to button pushing point
  // to the length parameter of the lines
  float dx = mouseX - mouseXBegin;
  float lineDiff = map(dx, -width, width, -MAX_LINE_LENGTH, MAX_LINE_LENGTH);
  lineLength = constrain(lineLengthBegin+lineDiff, MIN_LINE_LENGTH, MAX_LINE_LENGTH);

  // Map mouse vertical position relative to button pushing point
  // to the position of the lines relative to the center
  float dy = mouseY - mouseYBegin;
  float posDiff = map(dy, -height, height, -MAX_LINE_POSITION, MAX_LINE_POSITION);
  linePosition = constrain(linePosBegin+posDiff, MIN_LINE_POSITION, MAX_LINE_POSITION);
}
float MIN_LINE_ALPHA = 1;
float MAX_LINE_ALPHA = 50;

class Line {
  float location;               // Location around the center in radians
  float velocity;               // Velocity around the center in radians
  float rotation;               // Current rotation status of the line
  float rotVel;                 // Velocity of the line's rotation

  Line(float location_) {
    // The location is determined by calling the function in setup
    // to allow distribution of the lines. Velocity parameters are
    // random in order to make it more organic
    location = location_;
    rotation = 0;
    velocity = random(0.015, 0.025);
    rotVel = -random(0.05, 0.15);
  }

  void update() {
    rotation += rotVel;
    location += velocity;
  }

  void display() {
    // Calculate actual length and distance based on parameters
    // which are relative to the canvas' width
    float distance = width * linePosition / 2;
    float lineLength2 = width * lineLength / 2;
    float x = width/2 + cos(location) * distance;
    float y = height/2 + sin(location) * distance;

    pushMatrix();
    translate(x, y);
    rotate(rotation);
    // Map mouse horizontal position to alpha channel of the lines
    float lineAlpha = map(mouseX, 0, width, MIN_LINE_ALPHA, MAX_LINE_ALPHA);
    stroke(COLORS[curColor], lineAlpha);
    line(-lineLength2, 0, lineLength2, 0);
    popMatrix();
  }
}


