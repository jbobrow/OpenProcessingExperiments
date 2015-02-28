
int numBalls = 20;
int minRadius = 10;
int maxRadius = 20;

float[] ballX = new float[numBalls];
float[] ballY = new float[numBalls];
float[] ballXMov = new float[numBalls];
float[] ballYMov = new float[numBalls];
float[] ballSize = new float[numBalls];

void setup(){
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);
  fill( 0);
  for(int i = 0; i < numBalls; i++ ){
    ballX[i] = random(40, width-40);
    ballY[i] = random(20, height-20);
    ballXMov[i] = random(-8, 8);
    ballYMov[i] = random(-8, 8);
    ballSize[i] = random(maxRadius, minRadius);
  }
}
void draw(){
  background(255);
  for(int i = 0; i < numBalls; i++){
    if((ballX[i] < 15) || (ballX[i] > width - 15)){
        ballXMov[i] = -ballXMov[i];
      }
      if((ballY[i] < 10) || (ballY[i] > height - 10)){
       ballYMov[i] = -ballYMov[i];
      }
      fill(100, 0, 100, random(10, 100));
      ellipse(ballX[i], ballY[i], ballSize[i], ballSize[i]);
      ballX[i] = ballX[i] + ballXMov[i];
      ballY[i] = ballY[i] + ballXMov[i];
  }
}

  

