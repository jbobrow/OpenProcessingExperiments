
float[] posX;
float[] posY;

float[] speedX;
float[] speedY;
float gravity;

int ballSize;
int numBalls;

boolean fall=false;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  fill(random(255), random(255), random(255));

  numBalls=100;//number of balls = 50

    ballSize=10;
  gravity=.5;//reduce speed overtime

  speedX=new float[numBalls]; //speedX[50]
  speedY=new float[numBalls];//speedY[50]
  posX=new float[numBalls];//posX[50]
  posY=new float[numBalls];//posX[50]

    for (int i=0; i<numBalls; i++) {
    posX[i]=i*(width/numBalls);//same X distance between balls
    posY[i]=random(height);//random y position
    speedY[i]=0;
    speedX[i]=random(-5, 5);//random speed for left and right
  }
}

void draw() {
  background(255);

  for (int i=0; i<numBalls; i++) {
    ellipse(posX[i], posY[i], ballSize, ballSize);//draw circle

      if (fall==true) { //when mouse pressed
      posY[i]+=speedY[i];
      speedY[i]+=gravity;//fall with gravity(the force)
      posX[i]+=speedX[i];//go left and right
    }

    if (posY[i]>=height-ballSize) {
      speedY[i]*=-0.7;//bounce back
    }
  }
}

  void mousePressed () {
    fall=true;
  }





