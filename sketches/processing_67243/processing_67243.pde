
int numberOfBees=10;
float[]beesX=new float[numberOfBees];
float[]beesY= new float[numberOfBees];
float[]yVelBees= new float[numberOfBees];
PImage honeybees;

int numberOfBalls=10;
float[]ballsX=new float[numberOfBalls];
float[]ballsY=new float [numberOfBalls];
float[] xVelBalls= new float[numberOfBees];

//timer
float startingTime=0;
float timeOne= 1000;
float timeTwo=2000;
float timeThree= 3000;
PFont timer;

void setup() {
  size(500, 800);
  background (255);
  smooth();
  frameRate(20);

  //set position of bees
  for (int i=0; i<numberOfBees; i++) {
    beesX[i]=50*(i);
    beesY[i]=10;
    yVelBees[i]=random(0.5, 5);
  }


  //set position of balls
  for (int j=0; j<numberOfBalls; j++) {
    ballsX[j]=1;
    ballsY[j]=75*(j+1);
    xVelBalls[j]=random(2, 10);
  }

  //set timer
  startingTime=millis();
}

void draw() {
  background(0);
  honeybees=loadImage("honey_bee.png");

  //timer
  if (millis()-startingTime<=timeOne) {
    background(255);
    fill(230, 200, 60);
    timer=loadFont("SansSerif-24.vlw");
    text("three", 200, 300);
  }
  if (millis() - startingTime <= timeTwo) {
    background (255);
    fill(230, 200, 60);
    timer=loadFont("SansSerif-24.vlw");
    text("two", 200, 300);
  }
  if (millis() - startingTime <= timeThree) {
    background(255);
    fill(230, 200, 60);
    timer=loadFont("SansSerif-24.vlw");
    text("(HONEY BEES)", 200, 300);
  }

  if (millis() - startingTime >= timeThree) {
    //draw bees
    for (int i=0; i<numberOfBees; i++) {
      image(honeybees, beesX[i], beesY[i], 40, 40);
      beesY[i]=beesY[i]+yVelBees[i];
      if (beesY[i]>=height || beesY[i]<=0) {
        yVelBees[i]=yVelBees[i]*(-1);
      }
      for (int j=0; j<numberOfBalls; j++) {
        if (beesX[i]>ballsX[j] && beesY[i]>ballsY[j]) {
          yVelBees[i]=yVelBees[i]*(-1);
          xVelBalls[j]=xVelBalls[j]*(-1);
        }
      }
    }

    //draw balls
    for (int j=0; j<numberOfBalls; j++) {
      fill(230, 200, 60);
      ellipse(ballsX[j], ballsY[j], 10, 10);
      ballsX[j]=ballsX[j]+xVelBalls[j];
      if (ballsX[j]<=0 || ballsX[j]>=width) {
        xVelBalls[j]=xVelBalls[j]*(-1);
      }
    }
  }
}


