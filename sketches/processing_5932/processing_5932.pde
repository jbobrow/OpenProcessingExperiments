
/**
 * no way back
 * drehende striche mit Farbwechsel
 * an- und ausschalten mit Mausklick
 *
 */
  
int numBalls = 22;
int switch1 = 0;
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
  float rad01;
  float vx = random (1);
  float vy = random (1);
  float winkel = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, float winkelin, Ball[] oin) {
    x = xin;
    y = yin;
    rad01 = din;
    id = idin;
    others = oin;
    winkel = winkelin;
    
  } 
  
  void change_st() {
    if (switch1 == 1 )
    {
    if (abs(x - mouseX) < focus & abs(y - mouseY) < focus) {
      winkel = (winkel + .1);
    }
    }
  }

       
    void display() {
    fill(winkel*5%255,255,255);
    stroke (winkel*5%255,255,255);
    rect(x+rad01/2,y+rad01/2,rad01*sin(winkel),rad01*cos(winkel));
  
    }
}

void mouseClicked() {
  if(switch1 == 0) {
    switch1 = 1;
  } else {
    switch1 = 0;
  }
}

