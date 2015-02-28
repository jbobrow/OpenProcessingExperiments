
//moving balls with oop
int NUM_BALLS = 200;

//create and empty array named myBalls
//will contain NUM_BALLS objects of the class ball
Ball [] myBalls = new Ball[NUM_BALLS];
//declaration object
Ball myBall;
Ball myBall2;

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  //population of the array. start to fill array
  for (int i=0; i<NUM_BALLS; i++) {
    myBalls [i] = new Ball();
    myBalls [i].posX = random (-100, width+100);
    myBalls [i].posY= random (0, height);
    myBalls [i].speedY =random (1, 3);
    myBalls [i].angle = random (radians(1), radians(100));
    myBalls [i].myDiameter = random(2,15);
    myBalls [i].a = random(100, 200);
  }
}

void draw ()
{
  background (0);
  for (int i=0; i<NUM_BALLS; i++) {
    myBalls[i].update();
  }
}

class Ball {
  float myDiameter = 10;
  float posX = 250;
  float posY = 250;
  float speedX=.5;
  float r = 255;
  float g = 255;
  float b =250;
  float a = 100;
  float speedY =5;
  float angle = 0;

  void update() {

    posY+=speedY;//relate the position to the speed 

    if (posY>height)
      posY=0;

    angle+= 0.01;
    posX += cos(angle)*speedX;

    fill(r, g, b, a);
    ellipse (posX, posY, myDiameter, myDiameter);
  }
}


