
/* @pjs preload="weaponBearsmall.png"; */
PImage img;

float x = 70.0;
float y = 80.0;
float speedX = 3.0;
float speedY = 1;
int directionX = 1;
int directionY = -1;

void setup() {
  size(400,600);
  img=loadImage("weaponBearsmall.png");
}

void draw() {
  fill(0,70);
  rect(0,0,width,height);
  image(img,x,y);
  x += speedX * directionX;
  if ((x > width-124) || (x < 0)) {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height-145) || (y < 0)) {
    directionY = -directionY;
  }
}


