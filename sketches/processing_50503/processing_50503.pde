

Spinner topSpinner;
Spinner bottomSpinner;
Spinner midSpinner;

color r = color(255, 0, 0);
color b = color(0, 0, 255);
color yel = color(250, 250, 0);
color g = color(0, 255, 0);

int time =0;

PFont font;

void setup() {
  size(300, 300);

  topSpinner = new Spinner(0, r);
  midSpinner = new Spinner(100, g);
  bottomSpinner = new Spinner(200, b);

  font = loadFont("Calibri-48.vlw");
  textFont(font, 42);
}


void draw() {
  topSpinner.update();
  midSpinner.update();
  bottomSpinner.update();
  controls();
  letters();
  checkVictory();
  runTimer();
}

void runTimer() {
  //add one to time;
  time+=1;

  //if 100 frames have passed
  if (time==100) {
    //rotate spinners
    rotateSpinners();
    //reset time
    time=0;
  }
}

void rotateSpinners() {

  if (!topSpinner.locked) topSpinner.rot();
  if (!midSpinner.locked) midSpinner.rot();
  if (!bottomSpinner.locked) bottomSpinner.rot();
}

void controls() {
  if (keyPressed) {
    if (key == 'q') topSpinner.locked = true;
    if (key == 'a') midSpinner.locked = true;
    if (key == 'z') bottomSpinner.locked = true;

    if (key == 'w') topSpinner.locked = false;
    if (key == 's') midSpinner.locked = false;
    if (key == 'x') bottomSpinner.locked = false;
  }
}

void checkVictory() {
  if (topSpinner.locked && midSpinner.locked && bottomSpinner.locked) {
    if (topSpinner.sColor == midSpinner.sColor && midSpinner.sColor == bottomSpinner.sColor) {
      text("Success", 100,200);
    }
    else {
      text("Failure", 100,200);
    }
  }
}

void letters() {
  fill(0);
  text("Q", 10, 50);
  text("A", 10, 150);
  text("Z", 10, 250);
}

class Spinner {
  float x, y;
  color sColor;
  boolean locked;

  Spinner(int y_, color sColor_) {
    y=y_;
    sColor=sColor_;
  } 

  void update() {
    display();
  }

  void display() {
    noStroke();
    fill(sColor);
    rect(0, y, width, height/3);
  }

  void rot() {
    if (sColor == r) sColor = g;
    else if (sColor == g) sColor = b;
    else if (sColor == b) sColor = yel;
    else if (sColor == yel) sColor = r;
  }

  void reset() {
    locked = false;
    topSpinner.sColor = r;
    midSpinner.sColor = g;
    bottomSpinner.sColor = b;
  }
}

                
                
