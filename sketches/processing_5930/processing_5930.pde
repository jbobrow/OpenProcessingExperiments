
/**
 * no way back
 * drehende Kreissektoren mit Farbwechsel
 *
 */
  
int numBalls = 19;
float rad = 440/numBalls;
float hrad = rad / 2;
float focus = 100;

PFont fontA;

Ball[] balls = new Ball[numBalls*numBalls];

void setup() 
{
  size(440, 440);
  noStroke();
  smooth();
  colorMode(HSB, 255);
  for (int i = 0; i < numBalls; i++) {
    for (int j = 0; j < numBalls; j++)
    {
    balls[numBalls*i+j] = new Ball(i*rad+hrad,j*rad+hrad, rad, i, 1, balls);
    }
  }
}

void draw() 
{
  background(0);
  for (int i = 0; i < numBalls; i++) {
    for (int j = 0; j < numBalls; j++)
    {
    balls[numBalls*i+j].change_st();
    balls[numBalls*i+j].display();   
    }
  }
}

class Ball {
  float x, y;
  float diameter;
  float vx = random (1);
  float vy = random (1);
  float ballstatus = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, float ballstatin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
    ballstatus = ballstatin;
    
  } 
  
  void change_st() {
    if (abs(x - mouseX) < focus & abs(y - mouseY) < focus) {
      ballstatus = (ballstatus + .1);
    }
  }

       
    void display() {
    fill(ballstatus*5%255,255,255);
    arc(x,y,diameter,diameter,ballstatus,ballstatus+2);
  
    }
}

