
int numSquare = 50;
int size = 30;

float[] squareX = new float [numSquare];
float[] squareY = new float [numSquare];
float[] velX = new float [numSquare];
float[] velY = new float [numSquare];

PFont font;

float hourX;
float minuteX;
float secondX;

void setup() {
  size(300,300);
  noStroke();
  font = loadFont("BellGothicStd-Black-48.vlw");
  
  for (int i=0; i < numSquare; i++) {
    squareX[i] = random(width);
    squareY[i] = random(height);
    println("X = " + squareX[i] + "Y = " + squareY[i]);
    velX[i] = random(20);
    velY[i] = random(20);
  }
}

void draw(){
  smooth();
  background(random(255));
  fill(secondX*minuteX, random(secondX), hourX*secondX);
  textFont(font);
  
    
    text((hour() + ":" + minute() + ":" + second()), 60,155);
  
  if (secondX <1) {
    background(0);}
    for (int i = 0; i < numSquare; i++) {
    fill(255, i*20, i*30, 85);
    rect(squareX[i], squareY[i], size, size);

    squareY[i] += velY[i];
    squareX[i] += velX[i];



    if ((squareY[i] < 0) || (squareY[i] > height)) {
      velY[i]*=-.9;
    }  

    if ((squareX[i] < 0) || (squareX [i] > width)) {
      velX[i]*=-1;
    }
  
  hourX = hour();
  minuteX = minute();
  secondX = second();
  
  
  
  
  
    } 
}

