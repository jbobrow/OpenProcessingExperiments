
PImage imgFinal;

int offsetX;
int cycleWidth = 6;
int gridWidth = 1;
int numFrames = 6;

void setup() {
  size(308, 295);
  imgFinal = loadImage("scanimation_01.gif");
}

void draw() {
  background(0, 100, 0);
  image(imgFinal, offsetX, 0);
  fill(0);
  noStroke();
  for (int i = 0; i < width; i += cycleWidth) {
    rect(i, 0, cycleWidth - gridWidth, height);
    //rect(i, 0, 5, height);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      offsetX -= gridWidth;
    }
    else if (keyCode == RIGHT) {
      offsetX += gridWidth;
    }
  }
}


