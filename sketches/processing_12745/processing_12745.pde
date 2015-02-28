
/* Bouncing Balls
 By Zach Taher
 9/22/10
 */

float x;
float y;
float r = 5;
float gravity = .5;
float damping = .80;
float friction = .9;
float spdX = 4.5;
float spdY = 3.0;
float stairCount = 6;
float xPos = 0;
float yPos = 250;
float stairX = 80;
float stairY = 600;
float stairHeight = yPos; 

void setup() {
  size(600, 600);
  frameRate(30);
  smooth();
  drawStairs();
}

void drawStairs() {
  for(int i = 0; i < stairCount; i++) {
    fill(178, 38, 38);
    noStroke();
    rect(xPos, yPos, stairX, stairY);
    xPos += 80;
    yPos += 60;
  }
  xPos = 0;
  yPos = 250;
}

void draw() {
  background(255);

  fill(65, 50, 230);
  ellipse(x, y, r * 2, r * 2);
  x += spdX;
  spdY += gravity;
  y += spdY;


  if (x > width - r) {
    x = width - r;
    spdX *= -1;
  }
  else if( x < r) {
    x = r;
    spdX *= -1;
  }
  if (0 < x && x < 80 ) {

    if (y > 250 - r) {
      y = 250 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }

 if (80 < x && x < 160 ) {

    if (y > 310 - r) {
      y = 310 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
   if (160 < x && x < 240 ) {

    if (y > 370 - r) {
      y = 370 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
  if (240 < x && x < 320 ) {

    if (y > 430 - r) {
      y = 430 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
  if (320 < x && x < 400 ) {

    if (y > 490 - r) {
      y = 490 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
  if (400 < x && x < 480 ) {

    if (y > 490 - r) {
      y = 490 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
  if (480 < x && x < 520 ) {

    if (y > 550 - r) {
      y = 550 - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
  if (520 < x && x < width ) {

    if (y > height - r) {
      y = height - r;
      spdY *= -1;
      spdY *= damping;
      spdX *= friction;
    }
  }
    drawStairs();
  }


