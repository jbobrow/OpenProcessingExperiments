
// Jolyn Sandford
// CMU EMS Section D
// Assignment 5

int s, m, h;
final int secondStars = 60;

//arrays
float[] starX = new float[secondStars];
float[] starY = new float[secondStars];

PImage skyline;
PImage[] MOON = new PImage[24];

void setup() {
  smooth();
  size (500, 500, P2D);
  skyline = loadImage ("skyline.png");
  for (int i = 0; i < 24; i++) {
    MOON[i] = loadImage ("moon" + i + ".png");
  }
  for (int i = 0; i < secondStars; i++) {
    starX[i] = random(500);
    starY[i] = random(0, 400);
  }
}

void draw() {
  s = second();  // Values from 0 - 59
  m = minute();  // Values from 0 - 59
  h = hour();    // Values from 0 - 23
  sky();
  moon();
  stroke(255);
  for (int i = 0; i <= s; i++) {
    point(starX[i], starY[i]);
  }
  buildings();
  
  if (s == 59) {
    sky();
    buildings();
    moon();
  }
}


void sky() {
  int h = hour();
  noStroke();
  colorMode(RGB, 500);
  int r1 = 0;
  int r2 = 181;
  int g1 = 0;
  int g2 = 233;
  int b1 = 0;
  int b2 = 255;
  float r, g, b;
  for (int y = 0; y < height; y ++) {
    r = map (y, 300, height, r1, r2);
    g = map (y, 300, height, g1, g2);
    b = map (y, 300, height, b1, b2);
    stroke(r, g, b);
    line(0, y, width, y);
  }
}

void buildings() {
  float windowWidth = 2.5;
  int windowHeight= 5;
  image (skyline, 0, 366);
  fill(255, 252, 157, 255);
  noStroke();
  if (m>=0) {
    rect(290, 418, windowWidth, windowHeight);
    rect(295, 426, windowWidth, windowHeight);
  }
  if (m>=5) {
    rect(450, 450, windowWidth, windowHeight);
    rect(315, 415, windowWidth, windowHeight);
  }
  if (m>=10) {
    rect(330, 400, windowWidth, windowHeight);
    rect(320, 420, windowWidth, windowHeight);
  }
  if (m>=15) {
    rect(325, 400, windowWidth, windowHeight);
    rect(190, 440, windowWidth, windowHeight);
  }
  if (m>=20) {
    rect(300, 425, windowWidth, windowHeight);
    rect(245, 420, windowWidth, windowHeight);
  }
  if (m>=25) {
    rect(295, 418, windowWidth, windowHeight);
    rect(330, 430, windowWidth, windowHeight);
  }
  if (m>=30) {
    rect(300, 450, windowWidth, windowHeight);
    rect(350, 415, windowWidth, windowHeight);
  }
  if (m>=35) {
    rect(230, 420, windowWidth, windowHeight);
    rect(355, 415, windowWidth, windowHeight);
  }
  if (m>=40) {
    rect(225, 427, windowWidth, windowHeight);
    rect(200, 435, windowWidth, windowHeight);
  }
  if (m>=45) {
    rect(405, 435, windowWidth, windowHeight);
    rect(250, 430, windowWidth, windowHeight);
  }
  if (m>=50) {
    rect(378, 428, windowWidth, windowHeight);
    rect(265, 395, windowWidth, windowHeight);
  }
  if (m>=55) {
    rect(350, 435, windowWidth, windowHeight);
    rect(360, 445, windowWidth, windowHeight);
  }
}

void moon() {
  image (MOON[h], 35, 25);
}


