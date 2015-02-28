
int numOfBalls = 300;
int ballMin = 3;
int ballMax = 5;

float[] ballsX = new float[numOfBalls];
float[] ballsY = new float[numOfBalls];
float[] xChange = new float[numOfBalls];
float[] yChange = new float[numOfBalls];
float[] ballSize = new float[numOfBalls];
color[] ballColors = new color[numOfBalls];

void setup(){
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);
  fill(0);
  for(int i = 0; i < numOfBalls; i++){
    ballsX[i] = random(10, width-10);
    ballsY[i] = random(10, height-10);
    xChange[i] = random(-5, 5);
    yChange[i] = random(-5, 5);
    ballSize[i] = random(ballMin, ballMax);
    ballColors[i] = int(random(0, 100));
  }
}

void draw(){
    background(100);
    for(int i = 0; i < numOfBalls; i++){
      if((ballsX[i] < 5) || (ballsX[i] > width - 5)){
        xChange[i] = -xChange[i];
      }
      if((ballsY[i] < 5) || (ballsY[i] > height - 5)){
        yChange[i] = -yChange[i];
      }
      fill(ballColors[i], 100, 100);
      ellipse(ballsX[i], ballsY[i], ballSize[i], ballSize[i]);
      ballsX[i] = ballsX[i] + xChange[i];
      ballsY[i] = ballsY[i] + yChange[i];
    }
}
      

