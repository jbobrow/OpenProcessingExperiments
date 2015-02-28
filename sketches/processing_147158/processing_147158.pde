
float big;
float rad;
float lag;
float num = 10000;
float speed = 1;
float X, Y;
float initX, initY;
float currX, currY;
float prevX, prevY;

void setup() {
  size(500, 500);
  frameRate(60);
  //  noSmooth();
  background(0);
  big = width > height ? width/2 : height/2;
  rad = big;
  lag = big;
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  stroke(255);
  noFill();
  if (mousePressed) {
    num += (10 - num) * 0.1;
    rad += (20 - rad) * 0.1;
    lag += (20  - lag) * 0.1;
    speed += (5 - speed) * 0.9;
//    X += (mouseX - X) * 0.1;
//    Y += (mouseY - Y) * 0.1;
  } 
  else {
    num += (1000 - num) * 0.1;
    rad += (big - rad) * 0.1;
    lag += (big - lag) * 0.1;
    speed += (1 - speed) * 0.9;
//    X += (width/2 - X) * 0.05;
//    Y += (height/2 - Y) * 0.05;
  }
//  translate(X, Y);
  translate(width/2, height/2);
  rotate(frameCount * 0.01 % TWO_PI);
  for (float i = 0, j = num; i < j; i++) {
    pushMatrix();
    rotate(TWO_PI / j * i);
    point(rad + lag * cos(radians(frameCount * speed) + i/5), 0);
    popMatrix();
  }
}

