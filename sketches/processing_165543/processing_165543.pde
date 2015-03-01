
int numBalls=200;
float xPos[]=new float[numBalls];
float yPos[]=new float[numBalls];
float xSpeed[]=new float[numBalls];
float ySpeed[]=new float[numBalls];
float ballSize[]= new float[numBalls];
color ballColor[]=new color[numBalls];

void setup() {
  size(500, 500);

  for (int i=0; i<numBalls; i++) {
    xPos[i] = int(random(0, width));
    yPos[i] = int(random(0, height));

    ballSize[i] = int(random(20, 30));
    xSpeed[i] = random(-5, 5);
    ySpeed[i] = random(-5, 5);

    ballColor[i] = color(255, random(5, 255), random(100, 255), 80);
  }
}
void draw() {
  background(255);
  //draw balls
  noStroke();
  for (int i = 0; i < numBalls; i++) {
    fill(ballColor[i]);
    ellipse(xPos[i], yPos[i], ballSize[i], ballSize[i]);
  }
  ballMovement();
  ballCollision();
}

void ballMovement() {
  for (int i=0; i<numBalls; i++) {
    xPos[i]=xPos[i]+xSpeed[i];
    yPos[i]=yPos[i]+ySpeed[i];
  }
}

void ballCollision() {
  for (int i=0; i<numBalls; i++) {
    if (xPos[i] > width - ballSize[i]/2 || xPos[i] < ballSize[i]/2) {
      xSpeed[i] = xSpeed[i] * -1;
    }

    if (yPos[i] > width - ballSize[i]/2 || yPos[i] < ballSize[i]/2) {
      ySpeed[i] = ySpeed[i] * -1;
    }
  }
}
void mousePressed() {
  for (int i=0; i<numBalls; i++) {
    if (xSpeed[i]<1&&ySpeed[i]<1) {
      xSpeed[i]= xSpeed[i] * -2;
      ySpeed[i]= ySpeed[i] * -2;
    }
  }
}



