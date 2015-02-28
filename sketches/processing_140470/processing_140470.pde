
//Lauren Ruoff copyright 2014
//lruoff
//homework 8.1

//Press Space to initialize
//Press any key to exit

final int MAX = 40;


int [] xPosList, yPosList, ySpeed, xSpeed, diam;
color [] colorList;


void setup() {

  size(600, 400);
  background(0);
  noStroke();
  frameRate(10);

  xPosList = new int[MAX];
  yPosList = new int[MAX];
  xSpeed = new int[MAX];
  ySpeed = new int[MAX];
  colorList = new color[MAX];
  diam = new int[MAX];

diameter();
  xSpeedInitialize(-10, 10);
  ySpeedInitialize(-10, 10);
  positionSparkles();
}

void draw() {
  
  colorSparkles();
  drawSparkles();
 // terminate();
}

void positionSparkles () {
  for ( int i = 0; i < MAX; i++) {   
    xPosList[i] =  int( random (width)); //(or (i * 1/Max) * (width)
    yPosList[i] = 20;
  }
}

void colorSparkles () {
  for (int i = 0; i < MAX; i++) {
    colorList[i] = color( random(0), random(100, 120), random(50, 150));
    fill(colorList[i]);
  }
}

void ySpeedInitialize (int minValue, int maxValue) {
  for (int i = 0; i < MAX; i++) {
    ySpeed[i] = int(random(minValue, maxValue));
  }
}

void xSpeedInitialize (int minValue, int maxValue) {
  for (int i = 0; i < MAX; i++) {
    xSpeed[i] = int(random(minValue, maxValue));
  }
}

void drawSparkles () {
  //int diam;
  for ( int i = 0; i < MAX; i++) {
    yPosList[i] += xSpeed[i];
    xPosList[i] += ySpeed[i];
    
    if (yPosList[i] > height || yPosList[i] < 0) {
      xSpeed[i] = xSpeed[i]*-1;
    }
    if(xPosList[i] > width || xPosList[i] < 0) {
      ySpeed[i] = ySpeed[i]*-1;
    }

    //diam = int(random(10, 40));
    ellipse(xPosList[i], yPosList[i], diam[i], diam[i]);
    triangle(xPosList[i]+.5*diam[i], yPosList[i], xPosList[i], yPosList[i]-diam[i]*1.5, xPosList[i]-.5*diam[i], yPosList[i]);
  }
}

void diameter () {
  for(int i = 0; i < MAX; i++) {
    diam[i] = int(random(10, 40));
  }
}

void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i < MAX; i++) {
      yPosList[i] = 20;
    }
  }
  else {
    exit();
  }
}


