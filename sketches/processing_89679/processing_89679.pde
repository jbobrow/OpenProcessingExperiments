
PImage LilKirby1;
PImage LilKirby2;
PImage LilKirby3;
PImage LilKirby4;
PImage LilKirby5;
PImage LilKirby6;
PImage LilKirby7;
PImage LilKirby8;
PImage LilKirby9;
PImage LilKirby10;

PImage Kirby;

float xAdjust = -40;
float yAdjust = -50;
int instanceNum = 5;


void setup() {
  LilKirby1 = loadImage("LilKirby1.png");
  LilKirby2 = loadImage("LilKirby2.png");
  LilKirby3 = loadImage("LilKirby3.png");
  LilKirby4 = loadImage("LilKirby4.png");
  LilKirby5 = loadImage("LilKirby5.png");
  LilKirby6 = loadImage("LilKirby6.png");
  LilKirby7 = loadImage("LilKirby7.png");
  LilKirby8 = loadImage("LilKirby8.png");
  LilKirby9 = loadImage("LilKirby9.png");
  LilKirby10 = loadImage("LilKirby10.png");

  Kirby = loadImage("KirbySing.png");

  frameRate(2);
  size(640, 480);
  background(#FAAFBE);
}



void draw() {

  pushMatrix();
  float kirbyRotate = random(360);

  for (int i=0; i<instanceNum; i++) {
    rotate(kirbyRotate);
    image(LilKirby1, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby2, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby3, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby4, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby5, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby6, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby7, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby8, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby9, random(640) + xAdjust, random(480) + yAdjust);
    image(LilKirby10, random(640) + xAdjust, random(480) + yAdjust);
  }

  popMatrix();
  image(Kirby, width/2 - 125, height/2 - 25);
}



