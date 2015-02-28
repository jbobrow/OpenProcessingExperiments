
/*
arrays homework 8/11
 */

int numBalls = 50;

int[] xPos = new int[numBalls];
int[] yPos = new int[numBalls];
float[] ballSize = new float[numBalls];
float[] speed = new float[numBalls];
float[] r = new float[numBalls];
PImage[] assignedBallImages = new PImage [numBalls];
boolean[] isGoingRight = new boolean[numBalls];
boolean[] isGoingDown = new boolean[numBalls];
float lastSavedTime=millis();
boolean startTimer = false;
float timeDelay = 1000;
PImage[] ballImages = new PImage[5];

//PImage ballone;
//PImage balltwo;
//PImage ballthree;
//PImage ballfour;
//PImage ballfive;

void setup() {
  size(400, 400);
  frameRate(40);
  smooth();
  ballImages[0]= loadImage("ball1.png");
  ballImages[1]= loadImage("ball2.png");
  ballImages[2]= loadImage("ball3.png");
  ballImages[3]= loadImage("ball4.png");
  ballImages[4]= loadImage("ball5.png");


  for (int i =0; i < numBalls; i++) {
    xPos[i] = 6*(i+1);
    yPos[i] = 2*(i+1);
    speed[i] = random(5, 10);
    r[i] = random(1, 5.999);
    r[i] = int(r[i]);
    isGoingRight[i] = true;
    isGoingDown[i] = false;
    assignedBallImages[i] = ballImages[floor(random(4.99))];

  }

  println("xPos: ");
  println(xPos);
  println("speed: ");
  println(speed);

  for (int i = 0; i < numBalls; i++) {
    println(xPos[i]);
  }
}


void draw() {
  background(0);

  for (int i = 0; i < numBalls; i++) {
    if (xPos[i] + (ballSize[i]/2) > width) {
      isGoingRight[i] = false;
    }
    if (xPos[i] - (ballSize[i]/2) < 0) {
      isGoingRight[i]=true;
    }
    if ( yPos[i] + (ballSize[i]/2) > height) {
      isGoingDown[i] = false;
    }
    if (yPos[i] - (ballSize[i]/2) < 0) {
      isGoingDown[i]=true;
    }
    if (isGoingRight[i] == true) {
      xPos[i]+=speed[i];
    }
    else {
      xPos[i]-=speed[i];
    }
    if (isGoingDown[i] == true) {
      yPos[i]+=speed[i];
    }
    else {
      yPos[i]-=speed[i];
    }
    if (startTimer && timeDelay<millis()-lastSavedTime) {
      for (int j=0; j<numBalls; j++) {
        isGoingRight[j] = ! isGoingRight[j];
        isGoingDown[j] = ! isGoingDown[j];
      }
      startTimer=false;
    }
    
    
image(assignedBallImages[i], xPos[i], yPos[i]);

  }
}
void mouseReleased () {
  lastSavedTime=millis();
  startTimer = true;
}





