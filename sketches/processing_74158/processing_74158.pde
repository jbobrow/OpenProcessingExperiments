
//moustach 1
float locX1 = 10;
float locY1 = 30;

//moustache 2
float locX2 = 50;
float locY2 = 200;

//moustache 3
float locX3 = 300;
float locY3 = 130;

//moustache 4
float locX4 = 350;
float locY4 = 300;

int speedX1 = 5;
int speedY1 = 10;
int speedX2 = 2;
int speedY2 = 5;
int speedX3 = 7;
int speedY3 = 7;
int speedX4 = 2;
int speedY4 = 2;

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage instructions;
PImage sunglasses;

void setup() {
  size(600, 600);
  img1 = loadImage("moustacheY.png");
  img2 = loadImage("moustacheE.png");
  img3 = loadImage("moustacheA.png");
  img4 = loadImage("moustacheH.png");
  instructions = loadImage("instructions_small.png");
  sunglasses = loadImage("sunglasses2.png");
}

void draw() {
  background(124, 124, 124);
  image (instructions, -5, -5);
  image (sunglasses, 180, 250);

//moustache 1
  locX1 = locX1 + speedX1;
  locY1 = locY1 + speedY1;

  if (locX1 > width-195 || locX1 < 0) {
    speedX1 = speedX1 *-1;
  }
  if (locY1 > height-70 || locY1 < 0) {
    speedY1 = speedY1 *-1;
  }
  if (keyPressed && key == 'y') {
      speedX1 = 0;
      speedY1 = 0;
  }
  
//moustache 2  
  locX2 = locX2 + speedX2;
  locY2 = locY2 + speedY2;

  if (locX2 > width-195 || locX2 < -15) {
    speedX2 = speedX2 *-1;
  }
  if (locY2 > height-70 || locY2 < 0) {
    speedY2 = speedY2 *-1;
  }
   if (keyPressed && key == 'e') {
      speedX2 = 0;
      speedY2 = 0;
  }
  
//moustache 3
  locX3 = locX3 + speedX3;
  locY3 = locY3 + speedY3;

  if (locX3 > width-195 || locX3 < -15) {
    speedX3 = speedX3 *-1;
  }
  if (locY3 > height-70 || locY3 < 0) {
    speedY3 = speedY3 *-1;
  }
   if (keyPressed && key == 'a') {
      speedX3 = 0;
      speedY3 = 0;
   }

//moustache 4
  locX4 = locX4 + speedX4;
  locY4 = locY4 + speedY4;

  if (locX4 > width-195 || locX4 < -15) {
    speedX4 = speedX4 *-1;
  }
  if (locY4 > height-70 || locY4 < 0) {
    speedY4 = speedY4 *-1;
  }
   if (keyPressed && key == 'h') {
      speedX4 = 0;
      speedY4 = 0;
   }

  image (img1, locX1, locY1);
  image (img2, locX2, locY2);
  image (img3, locX3, locY3);
  image (img4, locX4, locY4);
}



