
// threads for maja
// 2011 gbut.com

import processing.opengl.*;
import controlP5.*;

// tweakings
float minR = 30; // minimum radius
float maxR = 120; // maximum radius
float minA = 1.2; // min angle step in radians
float maxA = 1.9; // max angle step in radians
float randomFactor = 0.3; // factor of randomness of the thread
float changeRate = 0.01; //  possibility of a new circle in each step
float wanderRate = 0.7; // possibility of a wondering thread. less creates closer circles
int stepsPerFrame = 1; // steps done in each frame. control speed here. 1 is minimum
int stepsPerCircle = 777; // max steps per each circle after which it forces change
float threadAlpha = 128; // alpha of the thread stroke
float threadWeight = 2; // thickness of the thread
float colorChangeSpeed = 0.5; // speed of color cycle. 1.0 is maximum speed

// helper variables
float c = 0, x, y, r, a;
float pbx = 0, pby = 0, px = 0, py = 0;
boolean clockwise = false;
int step = 0;




void setup(){
  size(1024, 680, OPENGL); // for present mode
  smooth();
  colorMode(HSB); // easier color cycling
  background(255);
  noFill();
  // initial values
  x = screenWidth / 2;
  y = screenHeight / 2;
  r = random(minR, maxR);
  a = random(TWO_PI);
  px = pbx = x + cos(a) * r;
  py = pby = y + sin(a) * r;
}

void draw(){
  
  for (int i = 0; i < stepsPerFrame; i++){
    float dir = clockwise ? 1 : -1;
    a = a + random(minA, maxA) * dir;
    float rmin = - randomFactor * r;
    float rmax = randomFactor * r;
    float x2 = (x + cos(a) * r) + random(rmin, rmax); 
    float y2 = (y + sin(a) * r) + random(rmin, rmax); 
    float d = sqrt(pow(x2 - px, 2) + pow(y2 - py, 2)) / 3;
    float bx = (x2 + cos(a - HALF_PI * dir) * d) + random(rmin, rmax); 
    float by = (y2 + sin(a - HALF_PI * dir) * d) + random(rmin, rmax);
    strokeWeight(threadWeight);
    stroke(c, 0, 0, threadAlpha / 2);
    float sshift = threadWeight / 2;
    bezier(px + sshift, py + sshift, px + (px - pbx) + sshift, py + (py - pby) + sshift, bx + sshift, by + sshift, x2 + sshift, y2 + sshift);
    c = (c + colorChangeSpeed) % 16;
    stroke(c, 16, 16, threadAlpha);
    bezier(px, py, px + (px - pbx), py + (py - pby), bx, by, x2, y2);
    strokeWeight(threadWeight / 2);
    stroke(c, 32, 255, threadAlpha / 2);
    bezier(px - 1, py - 1, px + (px - pbx) - 1, py + (py - pby) - 1, bx - 1, by - 1, x2 - 1, y2 - 1);
    px = x2;
    py = y2;
    pbx = bx;
    pby = by;
    if (random(1) < changeRate || step > stepsPerCircle || step == 1 && random(1) < wanderRate){
      createCircleParameters();
    }
    step++;
  }
}

void createCircleParameters(){
  
  float new_r = random(minR, maxR);
  float new_x = x + cos(a) * (r + new_r);
  float new_y = y + sin(a) * (r + new_r);
  if (new_x - new_r > 0 && new_x + new_r < width && new_y - new_r > 0 && new_y + new_r < height){
    x = new_x;
    y = new_y;
    r = new_r;
    a = a + PI;
    clockwise = !clockwise;
    step = 0;
  }
}



