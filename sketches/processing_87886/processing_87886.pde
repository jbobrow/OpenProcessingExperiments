
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/67346*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Ball[] myBalls = new Ball[100];

void setup() {
  size(800, 800);
  smooth();

  for (int i = 0; i < myBalls.length; i++) {

    myBalls[i] = new Ball();
    myBalls[i].setupBall(int(random(3)));
  }
}

void draw() {
  background(255);
  for (int i = 0; i <myBalls.length; i++) {
    myBalls[i].updateBall();
    myBalls[i].drawBall();
  }
}

class Ball {
  float x;
  float y;

  float w;
  float h;

  float xVel;
  float yVel;

  float r, g, b;

  void setupBall(int n) {
    x = random(10, width-60);
    y = random(10, height-60);

    w = random(10, 50);
    h = random(10, 50);

    r = random(255);
    g = random(255);
    b = random(255);

    if (n ==0) {

      xVel = random(2);
      yVel = random(2);
      if (random(50) < 25) {
        xVel*=-1;
      }
      if (random(50) < 25) {
        yVel*=-1;
      }
    }

    if (n == 1) {
      xVel = random(2, 4);
      yVel = random(2, 4);
      if (random(50) < 25) {
        xVel*=-1;
      }
      if (random(50) < 25) {
        yVel*=-1;
      }
     
    }
    
     if (n == 2) {
        xVel = random(4, 6);
        yVel = random(4, 6);
        if (random(50) < 25) {
          xVel*=-1;
        }
        if (random(50) < 25) {
          yVel*=-1;
        }
      }
  }


  void updateBall() {
    x += xVel;
    y += yVel;

    if (x < 0+(w/2) || x > width-(w/2)) {
      xVel*=-1;
    }

    if (y < 0+(h/2) || y > width-(h/2)) {
      yVel*=-1;
    }
  }

  void drawBall() {
    fill(r, g, b);
    ellipse(x, y, w, h);
  }
}


