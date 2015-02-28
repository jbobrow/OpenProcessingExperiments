
int x;
int y;
int prevSec;
int millisRolloverTime;
int H;
int M;
int S;
int mils;
PImage sky;
PImage egg;
PImage bowl;
PImage nestf;
PImage nestb;
PImage owl;
PImage leye;
PImage reye;

void setup() {
  sky=loadImage("blue_sky_1920.jpg");
  egg=loadImage("emperorpenguinegg.png");
  bowl=loadImage("bowl.png");
  nestf=loadImage("nest_front.png");
  nestb=loadImage("nest_back.png");
  owl=loadImage("owl.png");
  leye=loadImage("left_eye.png");
  reye=loadImage("right_eye.png");
  size(800, 800);
  millisRolloverTime = 0;
  smooth();
}

void draw() {
  H = hour();
  M = minute();
  S = second();
  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  mils = millis() - millisRolloverTime;
  image(sky, 0, 0);
  image(nestb, 25, 350, width/1, height/1);
  fill (#FC530F);
  ellipse(185, 520, 30, 30);
  ellipse(260, 515, 30, 30);
  EYE(177, 515);
  EYE(253, 513);
  image(owl, 25, 400, width/2, height/2);
//  for (int i=285;i<600;i+=28) {
    image(egg, 365, (590+random(-5, 5)), width/8, height/8);
//  }
  
  if (M==0) {
//    for (int i=280;i<600;i+=28) {
      image(bowl, 360, 580, width/7, height/7);
    }
//  }
  image(nestf, 25, 350, width/1, height/1);
}

void EYE(int x, int y) {
  float centerX = x;
  float amplitude = 15;
  float period = .0005;

  float metricSecond = mils;

  float xPos = centerX + amplitude * sin(metricSecond*(TWO_PI)*period);


  if (metricSecond > 500)
  {
    xPos = centerX + amplitude * sin(PI - metricSecond*(TWO_PI)*period);
  }
  fill(0);
  ellipse(xPos, y, 10, 10);
}


