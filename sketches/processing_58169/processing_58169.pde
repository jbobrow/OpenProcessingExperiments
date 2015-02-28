
// dancing pins by hugh

Pin p;
Pin b;
int num = 0;
float pinR, pinG, pinB;

void setup() {
  background(0);
  size(900, 450);
  p = new Pin(200, 200, 1);
  b = new Pin(200, 200, 5);
  smooth();
  pinR = 100;
  pinG = 100;
  pinB = 100;
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);

  p.update();
  p.drawPin();
  randomdir();
  
  b.update();
  b.drawPin();
}

void randomdir() {
  if (num > 50) {
    p.direct(random(width), random(height));
    b.direct(random(width), random(height));
    pinR = random(255);
    pinG = random(255);
    pinB = random(255);
    num = 0;
  } 
  else {
    num++;
  }
}

class Pin {
  float xpos;
  float ypos;
  float xdest;
  float ydest;
  float speed;
  float easing = 0.02;
  float pinSize;

  // drawPin variables
  int rad = 20;
  //  fill(100);

  Pin (float x, float y, int s) {
    xpos = x;
    ypos = y;
    pinSize = s;
  }

  void direct(float x, float y) {
    xdest = x;
    ydest = y;
  }

  void update() {
    if (xdest > xpos && xpos < width - 12 || xdest < xpos && xpos > 12) {
      xpos += (xdest - xpos) * easing;
    }
    if (ydest < ypos && ypos > 12 || ydest > ypos && ypos < height - 12) {
      ypos += (ydest - ypos) * easing;
    }
  }

  void drawPin() {
    noStroke();
    fill(pinR, pinG, pinB);
    ellipse(xpos, ypos, pinSize, pinSize);
  }
}

