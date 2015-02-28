
// Generative Art, "sketch 20d"
// Mostly autonomous.  When the viewer decides that they "see" art, 
// they press the mouse button to pause the sketch and view what they call art.
// The Viewer can initiate some changes, controls for changes noted below:
// Left mouse click == pause/unpause
// Right mouse click == turn on fill, turn off fill (where applicable)
// Keyboard press == reset/restart sketch (which in turn can change the style, there are 4 main style patterns)
// Sketch window is resizable via mouse drag (on corner of window frame) as well.

int toggleDraw;
boolean toLoop;
boolean toFill;
int[][] startingPoints;
int switchTime;
int reSwitchTime;
int frameHeight;
int frameWidth;

void setup() {
  // set the frame resizable, so mouse can drag it to whatever size, pick random size and set
  // allso allows for the random resize of the window when restarting the sketch
  if (frame != null) {
    frame.setResizable(true);
  }
  frameHeight = int(random(401, 801));
  frameWidth = int(random(401, 801));
  frame.setSize(frameWidth, frameHeight);
  size(frameWidth, frameHeight); 

  background(0);
  toggleDraw = int(random(44));
  toLoop = true;
  toFill = false;

  // set the times for switching between expanding and shrinking
  switchTime = millis() + 4000;
  if (toggleDraw  != 2) {
    reSwitchTime = millis() + int(random(4500, 8000));
  } 
  else {
    reSwitchTime = millis() + int(random(4500, 4600));
  }

  // set the random (within a quadrant) 4 center points of ellispses if needed
  if (toggleDraw % 4 == 0) {
    startingPoints = new int[4][2];
    //upper left quadrant starting point
    startingPoints[0][0] = int(random(width/2));
    startingPoints[0][1] = int(random(height/2));
    //upper right quadrant starting point
    startingPoints[1][0] = int(random(width/2, width));
    startingPoints[1][1] = int(random(height/2));
    //lower left quadrant starting point
    startingPoints[2][0] = int(random(width/2));
    startingPoints[2][1] = int(random(height/2, height));
    //lower right quadrant starting point
    startingPoints[3][0] = int(random(width/2, width));
    startingPoints[3][1] = int(random(height/2, height));
  }
}

void draw() {

  stroke(int(random(255)), int(random(255)), int(random(255)));

  if (millis() < switchTime) {

    if (toggleDraw % 4 == 0) {
      strokeWeight(1);
      if (toFill) {
        frameRate(8); 
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255))); 
        ellipse(startingPoints[0][0], startingPoints[0][1], int(random(width)), int(random(height)));
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255))); 
        ellipse(startingPoints[1][0], startingPoints[1][1], int(random(width)), int(random(height)));
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255))); 
        ellipse(startingPoints[2][0], startingPoints[2][1], int(random(width)), int(random(height)));
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255))); 
        ellipse(startingPoints[3][0], startingPoints[3][1], int(random(width)), int(random(height)));
      } 
      else {
        noFill();
        frameRate(10);
        ellipse(startingPoints[0][0], startingPoints[0][1], int(random(width)), int(random(height)));
        ellipse(startingPoints[1][0], startingPoints[1][1], int(random(width)), int(random(height)));
        ellipse(startingPoints[2][0], startingPoints[2][1], int(random(width)), int(random(height)));
        ellipse(startingPoints[3][0], startingPoints[3][1], int(random(width)), int(random(height)));
      }
    } 
    else if (toggleDraw % 3 == 0) {
      if (toFill) {
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255)));
      } 
      else {
        noFill();
      }
      strokeWeight(int(random(2, 5)));
      frameRate(9);
      triangle(int(random(width)), int(random(height)), int(random(width)), int(random(height)), int(random(width)), int(random(height)));
    } 
    else if (toggleDraw % 2 == 0) {
      if (toFill) {
        fill(int(random(255)), int(random(255)), int(random(255)), int(random(255)));
      } 
      else {
        noFill();
      }
      strokeWeight(int(random(4)));
      frameRate(8);
      int x = int(random(width));
      int y = int(random(height));
      line(width/2, height/2, x, y);
      strokeWeight(int(random(4)));
      ellipse(x, y, int(random(width/2)), int(random(height/2)));
    } 
    else {
      noFill();
      strokeWeight(int(random(2)));
      frameRate(int(random(30, 50)));
      line(width/2, height/2, int(random(width)), int(random(height)));
      line(width/2, height/2, int(random(width*2)), int(random(height*2)));
    }
  } 
  else if (millis() < reSwitchTime) {

    if (toggleDraw % 4 == 0) {
      frameRate(60);
    } 
    else if (toggleDraw % 3 == 0) {
      filter(DILATE);
      frameRate(30);
    } 
    else if (toggleDraw % 2 == 0) {
      filter(ERODE);
      if (toFill) {
        frameRate(40);
      } 
      else {
        frameRate(1);
      }
    } 
    else {
      filter(BLUR);
      frameRate(40);
    }

    // shrinking, sort of. Withing a section, move pixels towards center
    // left upper quadrant
    for (int i = width/2; i >= -1; i--) {
      for (int j = height/2; j >= -1; j--) {

        set(min(i+1, width/2), min(j+1, height/2), color(get(i, j)));
      }
    }
    // right upper quadrant
    for (int i = width/2; i <= width + 1; i++) {
      for (int j = height/2; j >= -1; j--) {

        set(max(i-1, width/2), min(j+1, height/2), color(get(i, j)));
      }
    }
    // left lower quadrant
    for (int i = width/2; i >= -1; i--) {
      for (int j = height/2; j <= height + 1; j++) {

        set(min(i+1, width/2), max(j-1, height/2), color(get(i, j)));
      }
    }
    // right lower quadrant
    for (int i = width/2; i <= width + 1; i++) {
      for (int j = height/2; j <= height + 1; j++) {
        set(max(i-1, width/2), max(j-1, height/2), color(get(i, j)));
      }
    }
  } 
  else {
    // need to reset the millis() time markers
    switchTime = millis() + 4000;
    if (toggleDraw % 2 == 0) {
      if (toFill) {
        reSwitchTime = millis() + int(random(4500, 6000));
      } 
      else {
        reSwitchTime = millis() + int(random(4500, 4600));
      }
    } 
    else {
      reSwitchTime = millis() + int(random(4500, 8000));
    }
  }
}

// to stop the sketch (e.g. for a screen shot, press the mouse)
// LEFT click is a stop/start(LOOP/NOLOOP), RIGHT click changes FILL/NOFILL
void mousePressed() {
  if (mouseButton == LEFT) {
    if (toLoop) {
      noLoop();
      toLoop = false;
    } 
    else {
      loop();
      toLoop = true;
    }
  }
  if (mouseButton == RIGHT) {
    if (toFill) {
      toFill = false;
    } 
    else {
      toFill = true;
    }
  }
}

// to restart the sketch, press a key
void keyPressed() {
loop();
toLoop = true;
  setup();
}
