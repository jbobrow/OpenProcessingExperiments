
float springX;
float springY;
float springHeight;
float springCenterX;
float amplitude;
float period;
float opacity;
float platformX;
float platformY;
float smileyX;
float smileyY;
boolean springDown = true;

void setup() {
  size(300, 400);
  smooth();
  frameRate(1);
  springCenterX = width/2;
  amplitude = 50;
  period = 0.09;
  springY = 4*height/5;
  platformX = 50;
  platformY = 4*height/5-10;
  smileyX = width/2;
  smileyY = 4*height/5-50;
}

void draw() {
  background(100);
  springDown = !springDown;
  if (springDown) {
    springY = 4*height/5;
    platformY = 4*height/5-10;
    smileyY = 4*height/5-50;
  }
  else {
    springY = 3*height/5;
    platformY = 3*height/5-10;
    smileyY = 1.5*height/5-50;
  }
  if (springY <= height) {
    for (int i=0; i <= 5455; i++) {
      springX = springCenterX + amplitude*(sin(i*period));
      springY = springY + 0.5;
      drawSpringPart(springX, springY);
    }
  }
  drawPlatform(platformX, platformY);
  drawSmiley(smileyX, smileyY);
}

void drawSpringPart(float x, float y) {
  noStroke();
  fill(46, 16, 131);
  ellipse(x, y, 10, 10);
  fill(16, 80, 131);
  ellipse(x-10, y, 10, 10);
}

void drawPlatform(float x, float y) {
  fill(0);
  rect(x, y, 200, 10);
}

void drawSmiley(float x, float y) {
  fill(254, 255, 0);
  stroke(0);
  ellipse(x, y, 80, 80);
  noStroke();
  fill(0);
  ellipse(x-10, y-10, 10, 20);
  ellipse(x+10, y-10, 10, 20);
  stroke(0);
  strokeWeight(3);
  noFill();
  if (springDown) {
    line(x-10, y+20, x+10, y+20);
  }
  else {
    arc(x, y+10, 30, 20, 0, PI);
  }
}

