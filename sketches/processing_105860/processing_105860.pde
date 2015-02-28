
int  numBall=200;
int value;
float [] ballX= new float [numBall];
float [] ballY= new float [numBall];
float [] speedX= new float[numBall];
float [] speedY= new float [numBall];

void setup() {
  size(500, 500);
  background (200);

  for (int i=0; i< numBall; i++) {
    ballX[i] = random(100, width + 10); 
    ballY[i] = random(100, height + 10);
    speedX[i] = random(1, 10);
    speedY[i] = random(-10, 20);
    value = 250;
  }
}

void draw() {
  background(0);
  smooth();
  for (int i = 0; i < numBall; i++) {
    fill(250, value, 0);
    ellipse(ballX[i], ballY[i], 10, 10);

    if (ballX[i] > width || ballX[i] < 0) {

      speedX[i] =  speedX[i] * (-1);
    }

    if (ballY[i] > height || ballY[i] < 0 ) {

      speedY[i] = speedY[i] * (-1);
    }

    ballX[i]= ballX[i] + speedX[i];
    ballY[i]= ballY[i] + speedY[i];
  }
}

void mousePressed() {
  if (value == 200) {
    value = 0;
  } 
  else {
    value = 200;
  }
}
