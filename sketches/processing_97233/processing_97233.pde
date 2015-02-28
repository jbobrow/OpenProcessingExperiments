
MyRect[] rects = new MyRect[15];
MyBall[] balls = new MyBall[15];

void setup() {
  size(500, 500);
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new MyBall(50,50, 42, 42, i+1);
  }
  for (int i = 0; i < rects.length; i++) {
    rects[i] = new MyRect(100,100, 42, 42, i+1);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
    balls[i].slide();
  }
  for (int i = 0; i < rects.length; i++) {
  rects[i].display();
  rects[i].slide();
  }
}

class MyBall {
  int ballx;
  int bally;
  int ballw;
  int ballh;
  int speed;

  MyBall(int tempballx, int tempbally, int tempballw, int tempballh, int tempspeed) {
    ballx = tempballx;
    bally = tempbally;
    speed = tempspeed;
    ballw = tempballw;
    ballh = tempballh;
  }
  void display(){
    ellipse(ballx, bally, ballw, ballh);
  }

  void slide() {
    ballx += speed;
    if (ballx < 0 || ballx == width) {
      speed = speed * -1;
    }
  }
}

class MyRect {
  int rectx;
  int recty;
  int rectw;
  int recth;
  int speed;

  MyRect(int temprectx, int temprecty, int temprectw, int temprecth, int tempspeed) {
    rectx = temprectx;
    recty = temprecty;
    speed = tempspeed;
    rectw = temprectw;
    recth = temprecth;
  }
  void display(){
    rect(rectx, recty, rectw, recth);
  }

  void slide() {
    recty += speed;
    if (recty < 0 || recty == height) {
      speed = speed * -1;
    }
  }
}



