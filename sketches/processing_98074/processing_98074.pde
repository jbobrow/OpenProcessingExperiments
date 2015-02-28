

int NUM_BALLS = 500;

Ball [] myBalls = new Ball[NUM_BALLS];
Ball myBall;
Ball myBall2;

void setup()
{
  size(400, 400);
  smooth();
  noStroke();
  
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
   
    posY+=speedY;
    if (posY>height)
    posY=0;
   
    angle+= 0.01;
    posX += cos(angle)*speedX;
    fill(r, g, b, a);
    ellipse (posX, posY, myDiameter, myDiameter);
  }
}

/*borrowed from processing.org 
*/

