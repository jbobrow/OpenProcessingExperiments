
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * by Julio Montabes from an original by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Julio Montabes
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingFigure" is used to draw each clock. It is passed the position, size and number of clock
 * as arguments.
 *
 * Every second one figure changes its color randomly. The figure selected depends on the one that is right being processed when
 * the program completes every thousand miliseconds of execution. So it is mainly a random value.
 * If the mouse is pressed then the function 'changeFigure' is triggered and color changing speeds up. 
 * 
 */

color cColor=color(random(100, 150), random(100, 150), random(100, 150));
float[] fSQx = new float[26];
float[] fSQy = new float[26];
color[] fSQColor = new color[26];

int iNum = 5;
int iMargin = 80;

float fGutter = 0; //distance between each cell
float fCellSize = 0;

int iCircleNumber = 0; // counter



void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();

  fCellSize = ( width - (2 * iMargin) - fGutter * (iNum - 1) ) / (iNum - 1);
  fillCollection();
}


void draw() {
  background(180);
  noStroke();

  for (int i=1; i<=iNum*iNum; i++) {
    movingFigure(fSQx[i], fSQy[i], fCellSize, i);
  }

  if (mousePressed) {
    changeFigure((int)random(1, iNum*iNum));
  }
}



void fillCollection() {
  background(180);
  noStroke();

  for (int i=0; i<iNum; i++) {
    for (int j=0; j<iNum; j++) {
      ++iCircleNumber;
      fSQx[iCircleNumber]=iMargin + fCellSize * i + fGutter * i;
      fSQy[iCircleNumber]=iMargin + fCellSize * j + fGutter * j;
      fSQColor[iCircleNumber]=color(random(100, 150), random(100, 150), random(100, 150));
      //println("iCircleNumber="+iCircleNumber, "fSQx="+fSQx[iCircleNumber], "fSQy="+fSQy[iCircleNumber], "fSQColor="+fSQColor[iCircleNumber]);
    }
  }
} 


void changeFigure(int item) {
  //println(item, fSQColor[item]);
  fSQColor[item]=color(random(100, 150), random(100, 150), random(100, 150));
  fill(fSQColor[item], 180);
}


void movingFigure(float x, float y, float radius, int item) {

  // calculate endpoint of the line
  float angle=item * TWO_PI * millis() / 60000.0;
  float tempX=0;
  float tempY=0;

  if (millis()%1000==0) {
    changeFigure(item);
  }

  stroke(0);
  strokeWeight(1);
  fill(fSQColor[item], 180);

  switch (item%2) {
  case 0:
    ellipse(x, y, radius, radius); // circle
    tempX = x + (radius*1.5 / 2) * sin(angle);
    tempY = y + (radius / 2) * cos(angle);
    break;
  case 1:
    rect(x, y, radius, radius); // rectangle
    tempX = x + (radius*1.5 / 2) * cos(angle);
    tempY = y + (radius / 2) * sin(angle);
    break;
  default:
    println("Somnething is wrong with your program Julio. CircleNumber%2 didn't have neither 0 nor 1 as a result");
    break;
  }

  stroke(255, 0, 0);
  line(x, y, tempX, tempY); // red line
}



