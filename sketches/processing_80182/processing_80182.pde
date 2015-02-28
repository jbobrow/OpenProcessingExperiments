
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/57501*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img;
int centx=350;
int centy=250;
float x, y;


void setup() {
  size(700, 467);
  img = loadImage ("path.png");
  strokeWeight(1);
  smooth();
  stroke(255);
  frameRate(4);
}


void draw() {
  background(img);
  image (img, 0, 0);
  float radius = 100;
  float rNoise=random(10);
  float lastx=-999;
  float lasty=-999;
  stroke(255);
  for (float ang = 0; ang <= 1999; ang+=3) {
    // radius+=.2;
    rNoise+=.3;
    float thisRadius = radius + (noise(rNoise)*200)-100;
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


