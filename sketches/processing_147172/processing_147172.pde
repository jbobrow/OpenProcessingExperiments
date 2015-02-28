
float big;
float outRad;
float inRad;
float lag;
float num = 3600;
float speed = 0.1;
float X, Y;
float initX, initY;
float currX, currY;
float prevX, prevY;
boolean little;

void setup() {
  size(500, 500);
//  size(displayWidth, displayHeight);
  frameRate(60);
  //  noSmooth();
  background(0);
  big = width > height ? width/2 : height/2;
  outRad = big;
  inRad = 100;
  lag = big;
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  stroke(255);
  noFill();
  if (little) {
    num += (360 - num) * 0.25;
    outRad += (20 - outRad) * 0.1;
    inRad += (50 - inRad) * 0.1;
    lag += (10  - lag) * 0.1;
    speed += (5 - speed) * 0.9;
  } 
  else {
    num += (3600 - num) * 0.1;
    outRad += (big - outRad) * 0.1;
    inRad += (100 - inRad) * 0.1;
    lag += (big - lag) * 0.1;
    speed += (0.1 - speed) * 0.9;
  }
  translate(width/2, height/2);
  rotate(frameCount * 0.01 % TWO_PI);
  for (float i = 0, j = num; i < j; i++) {
    pushMatrix();
    rotate(radians(i));
    point(outRad + lag * cos(radians(frameCount * speed) + i/3), inRad);
    popMatrix();
  }
}

void mousePressed() {
  little = !little;
}
