
/*
ACCD Summer 2012
ID02
3b Face + Mouse
Charlene Chen
06/08/2012
*/


//Variables
int value = 255;
int faceWidth = 400;
int faceHeight = 400;
int hairline = 30;

float mouthYpos;
float noseWidth;
float noseHeight;
float lefteyebrowHeight;
float rightteyebrowHeight;
float lefteyeHeight;
float lefteyeWidth;
float lefteyeXpos;
float righteyeHeight;
float righteyeWidth;
float righteyeYpos;
float righteyeColor;


//Setup
void setup() {
  size(600,600);
  smooth();
}


void draw() {
  background(255);
  
  mouthYpos= map(mouseY, 0, height, 435, 550);
  // noseWidth = map(mouseY,100, 500, 10,20);
  //noseHeight = map(mouseY,100, 500, 10,40);
  lefteyebrowHeight = map(mouseX, 0, width, 180, 230);
  rightteyebrowHeight = map(mouseX, 0, width, 180, 80);
  lefteyeHeight = map(mouseX, 0, width, 20, 10); 
  //lefteyeWidth = map(mouseX, 0, width, 150, 20);
  //lefteyeXpos = map(mouseX, 0, width, 100, 290);
  righteyeHeight = map(mouseX, 0, width, 20, 250);
  righteyeWidth = map(mouseX, 0, width, 150, 200);
  righteyeYpos = map(mouseX, 0, width, 250, 100);
  righteyeColor = map(mouseX, 0, width, 255, 232);
 
  
  //face
  fill(0);
  noStroke();
  rect(100,hairline,faceWidth,faceHeight);
  
  //mouth
  strokeWeight(1);
  stroke(255,value, value);
  for (int i=100; i<=500; i=i+5)
  {
    line(300, 430, i,mouthYpos);
  }
  noStroke();
  rect(100,mouthYpos,faceWidth,50);
  
  //nose
  fill(255);
  noStroke();
  rect(280,faceHeight+20,10,10);
  rect(310,faceHeight+20,10,10);
  
  //eyebrows
  stroke(255);
  strokeWeight(20);
  strokeCap(SQUARE);
  line(99,lefteyebrowHeight, 300,lefteyebrowHeight);
  line(299,rightteyebrowHeight, 500,rightteyebrowHeight);
  
  //eyes
  fill(0);
  strokeWeight(9);
  stroke(value);
  fill(255,value,value);
  rect(100,250, 150, lefteyeHeight);
  rect(350,righteyeYpos, righteyeWidth, righteyeHeight);
}

void mouseReleased() {
  if(value == 255) {
    value = 0;
  } else {
    value = 255;
  }
}

