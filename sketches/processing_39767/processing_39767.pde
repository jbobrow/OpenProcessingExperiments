
int x;
int y;
int ballW;
int[] ballsX;
int[] ballsY;
int[] constantsX;
int[] constantsY;
int[] R;
int[] G;
int[] B;
int numberOfBalls;

void setup() {
  size(640,480);
}

void draw() {
  progress();
  valueLoader();
  afterProgress();
}

void progress() {
  stroke(#000000);
  int barWidth = 450;
  int barHeight = 60;
  float barProgress = 0;
  int diff = 25;
  if(millis() < 5000) {
    background(200,100,0);
    //Got the idea of using map function from Eric Mackey
    barProgress = map(millis(), 0, 5000, 0, barWidth-diff);
    float VbarProgress = map(millis(), 0, 5000, 0, height);
    int R = 20;
    int G = 40;
    int B = 0;
    for(int i=0; i<10; i++) {
      R = R+i;
      G = G+i;
      B = B+i;
      fill(R,G,B);
      rect(i*64,0,64,VbarProgress/2);
      fill(R+i,G,B+i);
      rect(i*64,height,64,-VbarProgress/2);
    }
    fill(0);
    rect(width/2-barWidth/2-diff/2,
         height/2-barHeight/2-diff,
         barWidth,barHeight+(2*diff));
    fill(200,100,0);
    rect(width/2-barWidth/2,
         height/2-barHeight/2,
         barProgress,barHeight);
  }
}


void valueLoader() {
  numberOfBalls = 300;
  ballsX = new int[numberOfBalls];
  ballsY = new int[numberOfBalls];
  constantsX = new int[numberOfBalls];
  constantsY = new int[numberOfBalls];
  R = new int[numberOfBalls];
  G = new int[numberOfBalls];
  B = new int[numberOfBalls];
  for(int j = 0; j<numberOfBalls; j++) {
      x = (int)random(0,width);
      y = (int)random(0,height);
      ballsX[j] = x;
      ballsY[j] = y;
      constantsX[j] = (int)random(-10,10);
      constantsY[j] = (int)random(-10,10);
      R[j] = (int)random(0,255);
      G[j] = (int)random(0,255);
      B[j] = (int)random(0,255);
    }
}

void afterProgress() {
  if (millis() > 5000) {
    PImage abstractI;
    abstractI = loadImage("abstract.jpg");
    noStroke();
    frameRate(5);
    image(abstractI,0,0);
    for(int i = 0; i<numberOfBalls; i++) {
      ballW = (int)random(20,70);
      fill(R[i], G[i], B[i],100);
      ballMaker(ballW, ballsX[i], ballsY[i]);
      ballsX[i] = ballsX[i]+constantsX[i];
      ballsY[i] = ballsY[i]+constantsY[i];
      //Bouncing
      if(ballsX[i]+ballW/2 >= width)  constantsX[i] = -constantsX[i];
      else if(ballsX[i]-ballW/2 <= 0) constantsX[i] = -constantsX[i];
      if(ballsY[i]+ballW/2 >= height) constantsY[i] = -constantsY[i];
      else if(ballsY[i]-ballW/2 <= 0) constantsY[i] = -constantsY[i];
    }
  }
}

void ballMaker(int width_heightBall, int x, int y) {
    ellipse(x,y, width_heightBall, width_heightBall);
}



