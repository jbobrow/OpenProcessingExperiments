
int numBalls = 200;
int gravity = 1;
int[] xPos = new int[numBalls];
int[] yPos = new int[numBalls];
int[] xSpeed = new int[numBalls];
int[] ySpeed = new int[numBalls];
int[] hue = new int[numBalls];
int[] r = new int[numBalls];
int[] o = new int[numBalls];

//int freezeArea = 100;


void setup() {
  size(600, 600);
  colorMode (HSB, 255);
  noStroke();

  for (int i=0; i<numBalls; i++) {
    xPos[i]=int(random(r[i], width-r[i]));
    yPos[i]=int(random(r[i], height-r[i]));
    xSpeed[i]=int(random(2, 5));
    ySpeed[i]=int(random(2, 5));
    r[i]=int(random(10, 50));
    o[i]=int(random(150, 230));
    hue[i]=int(random(0, 255));
  }
}


void draw() {
  background(255);

  drawBalls();
  moveBalls();
  collideBalls();
}
void drawBalls() {
  for (int i = 0; i < numBalls; i++) {
    fill(hue[i], 200, 255, o[i]);
    ellipse(xPos[i], yPos[i], r[i], r[i]);
  }
}

void moveBalls() {
  for (int i = 0; i < numBalls; i++) {
    xPos[i] += xSpeed[i];
    yPos[i] += ySpeed[i]+gravity;
  }
}

void collideBalls() {
  for (int i=0;i<numBalls;i++) {
    if (xPos[i]>width-r[i]||xPos[i]<r[i]/2) {
      xSpeed[i]*=-1;
    }
    if (yPos[i]>height-r[i]/2||yPos[i]<r[i]/2) {

      ySpeed[i]*=-1;
    }
  }
}



