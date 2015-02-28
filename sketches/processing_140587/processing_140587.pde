
Ball tama;

void setup() {
  size(600, 600);
  colorMode(HSB, 360);
  tama = new Ball(0, 0, 7, 9, 20);
}

void draw() {
  background(0);
  tama.draw();
}

class Ball {
  float posX, posY;
  float speedX, speedY;
  float dim;

  Ball(float inputPx, float inputPy, float inputSpx, float inputSpy, float inputDim) {
    posX = inputPx;
    posY = inputPy;
    speedX = inputSpx;
    speedY = inputSpy;
    dim = inputDim;
  }
  void draw() {
    ellipse(posX, posY, dim, dim);
    update();
  }
  void update() {
    posX = posX+speedX;
    posY = posY+speedY;
    if (posX>width) {
      posX = width;
      speedX=-speedX;
    }
    else if (posX<0) {
      posX=0;
      speedX=-speedX;
    }
    if (posY>height) {
      posY=height;
      speedY=-speedY;
    }
    else if (posY<0) {
      posY=0;
      speedY=-speedY;
    }
  }
}
