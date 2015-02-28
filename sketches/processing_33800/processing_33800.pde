
/*
arrays homework 8/11
 */

int numBalls = 50;

int[] xPos = new int[numBalls];
int[] yPos = new int[numBalls];
float[] speed = new float[numBalls];
float[] r = new float[numBalls];
PImage[] myImages = new PImage [numBalls];

PImage ballone;
PImage balltwo;
PImage ballthree;
PImage ballfour;
PImage ballfive;

void setup() {
  size(400, 400);
  frameRate(40);
  smooth();
  ballone= loadImage("ball1.png");
  balltwo= loadImage("ball2.png");
  ballthree= loadImage("ball3.png");
  ballfour= loadImage("ball4.png");
  ballfive= loadImage("ball5.png");

  for (int i =0; i < numBalls; i++) {
    xPos[i] = 6*(i+1);
    yPos[i] = 2*(i+1);
    speed[i] = random(5, 10);
    r[i] = random(1, 5.999);
    r[i] = int(r[i]);
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
   
  if (r[i] == 1) {
    myImages[i] = ballone;
  }

  if (r[i] == 2) {
    myImages[i] = balltwo;
  }
  if (r[i] == 3) {
    myImages[i] = ballthree;
  }
  if (r[i] == 4) {
    myImages[i] = ballfour;
  }
  if (r[i] == 5) {
    myImages[i] = ballfive;
  }
   image(myImages[i], xPos[i]-r[i]*10, yPos[i]-r[i]*10);
    xPos[i] += speed[i];
  }
}





