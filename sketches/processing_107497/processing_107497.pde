
int squareWidth;
int windowSize;
int winLocation;
int heiLocation;
int even;

void setup() {
  windowSize = 500;
  size(500, 500);
  displayWidth = windowSize;
  displayHeight = windowSize;
  even = 0;
  winLocation = 0;
  heiLocation = 1;
  background(255);
  squareWidth = 25;
}

void draw() {
  noStroke();
  fill(random(0,255), random(0,255), random(0,255));
      if (winLocation < (windowSize-25) && heiLocation == 1) {
      rect(0, windowSize-25, squareWidth, squareWidth);
      rect(winLocation += 25, windowSize-(25*heiLocation), squareWidth, squareWidth);
    }
    else if (winLocation == windowSize-25 && even == 0) {
      heiLocation ++;
      winLocation = windowSize-25;
      even = 1;
      rect(windowSize-25, windowSize-(25*heiLocation), squareWidth, squareWidth);
    }
    else if (winLocation <= windowSize && winLocation >= 0 && even == 1) {
      rect(winLocation -= 25, windowSize-(25*heiLocation), squareWidth, squareWidth);
    }
    else if (winLocation <= 1 && even == 1) {
      heiLocation ++;
      winLocation = 0;
      even = 0;
      rect(0, windowSize-(25*heiLocation), squareWidth, squareWidth);
    }
    else {
      rect(winLocation += 25, windowSize-(25*heiLocation), squareWidth, squareWidth);
    }
}


