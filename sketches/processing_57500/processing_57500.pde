
int centx=250;
int centy=250;
float x, y;


void setup() {
  size(500, 500);
  background(255);
  strokeWeight(1);
  smooth();
  stroke(20, 50, 70);
  frameRate(4);
}


void draw() {
  background(255);
  float radius = 100;
  float rNoise=random(10);
  float lastx=-999;
  float lasty=-999;
  stroke(random(5*(frameCount%20)), random(2*(frameCount%20)), random(255));
  for (float ang = 0; ang <= 1440; ang+=2) {
    // radius+=.2;
    //rNoise+=.04;
    float thisRadius = radius + (random(100)+50);
    float rad=radians(ang);
    x=centx + (thisRadius*cos(rad));
    y=centy + (thisRadius*sin(rad));
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;
  }
}


