


int numBalls = 5;

float xBallPos[] = new float[numBalls];
float yBallPos[] = new float[numBalls];

float xSpeed[] = new float[numBalls];
float ySpeed[] = new float[numBalls];

float ballSize[] = new float[numBalls];

color ballColor[] = new color[numBalls];

void setup() {

  size(500, 500);
  noStroke();

  //fill all the arrays with random values
  for (int i = 0; i < numBalls; i++) {


    xBallPos[i] = random(0, width);
    yBallPos[i] = random(0, height);



    ballSize[i] = random(10, 50);
    //change to the following line to have balls of equal size
    ballSize[i] = 30;


    xSpeed[i] = random(-10, 8);
    ySpeed[i] = random(-10, 8);

    ballColor[i] = color(0, 0, random(150, 255));
  }
}
void draw() {
  background(0);  



  //draw the balls here
  for (int i = 0; i < numBalls; i++) {


    fill(ballColor[i]);
    ellipse(xBallPos[i], yBallPos[i], ballSize[i], ballSize[i]);

    //increment all of their positions using the speeds
    xBallPos[i] = xBallPos[i] + xSpeed[i];
    yBallPos[i] = yBallPos[i] + ySpeed[i];


    //handle collisions


    if (xBallPos[i] > width - ballSize[i]/2) {
      xSpeed[i] = xSpeed[i] * -1; 
      //and move balls back so they dont get stuck on the wall
      xBallPos[i] = width - ballSize[i]/2;
    }
    if (xBallPos[i] < ballSize[i]/2) {
      xSpeed[i] = xSpeed[i] * -1;
      xBallPos[i] = ballSize[i]/2;
    }
    if (yBallPos[i] > height - ballSize[i]/2) {
      ySpeed[i] = ySpeed[i] * -1;       
      yBallPos[i] = height - ballSize[i]/2;
    }
    if (yBallPos[i] < ballSize[i]/2) {
      ySpeed[i] = ySpeed[i] * -1; 
    yBallPos[i] = ballSize[i]/2;
  }

  for (int j=0; j < numBalls; j++) {
    if (i!=j)
    {
      if (dist(xBallPos[i], yBallPos[i], xBallPos[j], yBallPos[j]) < ballSize[i] ) {
        xSpeed[i] = xSpeed[i]*-1;
        ySpeed[i] = ySpeed[i]*-1;
      }
    }
  }
  }
}


