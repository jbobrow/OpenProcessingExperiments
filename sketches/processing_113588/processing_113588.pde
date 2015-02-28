
/*
Jeff Guo
Oct 3 2013
Interactive Prototyping 3
--COLLAGE ENGINE--
All Rights Reserved
*/



PImage ele1;
PImage ele2;
PImage ele3;
PImage ele4;
PImage ele5;
PImage bg;

void setup() {
  size(640, 480);
  smooth();
  frameRate(1);

  ele1 = loadImage("ele1.png");
  ele2 = loadImage("ele2.png");
  ele3 = loadImage("ele3.png");
  ele4 = loadImage("ele4.png");
  ele5 = loadImage("ele5.png");
  bg = loadImage("bg.png");
  imageMode(CENTER);
}

void draw() {
  background(255);
  float x1 = random(0, 640);
  float y1 = random(0, 480);
  float x2 = random(0, 640);
  float y2 = random(0, 480);
  float x3 = random(0, 640);
  float y3 = random(0, 480);
  float x4 = random(0, 640);
  float y4 = random(0, 480);
  float x5 = random(0, 640);
  float y5 = random(0, 480);

  float wd1 = random(380, 980);
  float ht1 = random(280, 680);
  float wd2 = random(380, 980);
  float ht2 = random(280, 680);
  float wd3 = random(380, 980);
  float ht3 = random(280, 680);
  float wd4 = random(380, 980);
  float ht4 = random(280, 680);
  float wd5 = random(380, 980);
  float ht5 = random(280, 680);

  image(bg, width/2, height/2);
  image(ele1, x1, y1, wd1, ht1);
  image(ele2, x2, y2, wd2, ht2);
  image(ele3, x3, y3, wd3, ht3);
  image(ele4, x4, y4, wd4, ht4);
  image(ele5, x5, y5, wd5, ht5);
}



