
int numBall = 15;
float[] ballX = new float[numBall];
float[] ballY = new float[numBall];
float[] speedX = new float[numBall];
float[] speedY = new float[numBall];
int[] sizeBall = new int[numBall];
float gravity = 1;
float inertia = 0.19;

void setup() {
  background(150);
  size(600, 400);
  smooth();
  noStroke();
  frameRate(72);
  for (int i = 0; i < numBall; i++) {
    ballX[i] = random(width);
    ballY[i] = 0;
    speedX[i] = random(30);
    speedY[i] = random(20);
    sizeBall[i] = i*3;
  }
}

void draw() {
  // random origin
  
  for (int i = 1; i < numBall; i++) {
    stroke(i);
    ellipse(ballX[i], ballY[i], sizeBall[i], sizeBall[i]);
    fill(255-i*20, 255, i*20);
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];
    
    if(ballX[i] >= width-sizeBall[i]/2 || ballX[i] <= 0+sizeBall[i]/2) {
      speedX[i] *= -0.95;


    }
    if(ballY[i] >= height-sizeBall[i]/2 || ballY[i] <= 0+sizeBall[i]/2) {
      speedY[i] *= -0.95;
      speedX[i] *= -0.95;

    }
    
    if(ballY[i] >= 400-sizeBall[i]/2) {
      ballY[i] = 400-sizeBall[i]/2;
    }
    
  speedY[i] += gravity;
    
  }
  
}
  
  

