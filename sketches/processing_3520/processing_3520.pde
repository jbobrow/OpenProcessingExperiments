
//collision test www.kaubonschen.com
Ball[] myBall;
int ballAmount = 125;
int distance = 100;

int radius = 15;

void setup() {
  size(900, 300);
  background(255);
  fill(0);
  smooth();

  //class setup
  myBall = new Ball[ballAmount];
  for (int i = 0; i < ballAmount; i++) {
    myBall[i] = new Ball();
    myBall[i].setup();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < ballAmount; i++) {
    myBall[i].step();

    for (int j = 0; j < i; j++) {
      if (i != j) {
        float distBalls = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);

        if (distBalls <= distance) {
          float lineWeight = 10/distBalls;
          stroke(lineWeight*5, lineWeight, lineWeight);
          strokeWeight(lineWeight);
          line(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
        }

        if (distBalls <= radius) {
          myBall[i].setInc();
          myBall[j].setInc();
        }
      }
    }
    /*
    for (int k = 0; k < ballAmount; k++) {
     fill(255, 0, 0);
     myBall[k].drawBall(); //BALL IS NOT DRAWN
     }
     */
  }
}

//change speed and direction
void mousePressed() {
  for (int i = 0; i < ballAmount; i++) {
    myBall[i].setInc();
  }
}

//THE CLASS
class Ball {
  float x;
  float y;
  float incX;
  float incY;

  void setup() {
    x = random(width);
    y = random(height);
    setInc();
  }

  //speed
  void setInc() {
    incX = random(-2, 2);
    incY = random(-2, 2);
  }

  //the ball
  void drawBall() {
    noStroke();
    ellipse(x, y, radius, radius);

  }

  //direction
  void step() {
    if (x > width || x < 0) {
      incX = -incX;
    }
    if (y > height || y < 0) {
      incY = -incY;
    }
    x = x + incX;
    y = y + incY;

    if (x > width) {
      x = width;
      setInc();
    }
    if (x < 0) {
      x = 0;
      setInc();
    }
    if (y > height) {
      y = height;
      setInc();
    }
    if (y < 0) {
      y = 0;
      setInc();
    }
  }
}

//www.kaubonschen.com



