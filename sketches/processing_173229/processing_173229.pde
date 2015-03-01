
//press left mouse button to see the 200 balls fade into 1 ball
//and release to watch the 1 ball explode outwards into 200 balls!

Minion[] mins = new Minion[200];


void setup() {
  size(600, 600);
  background(0);
  for (int i = 0; i < mins.length; i++) { 
    color C = color(random(100, 200), random(100, 200), random(100, 200), random(50, 200));
    float X = random(0, width);
    float Y = random(0, height);
    float VY = random(0, 5);
    float VX = random(0, 5);
    int SIZE = (int)random(5,15);
    mins[i] = new Minion(C, X, Y, VY, VX, SIZE);
  }
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  for (int i = 0; i < mins.length; i++) { 
    mins[i].show();
    mins[i].move();
  }
}

class Minion {
  color c;
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  int size;

  //color C, float X, float Y, float V

  Minion(color C, float X, float Y, float VY, float VX, int SIZE) {
    c = C;
    xPos = X;
    yPos = Y;
    xVel = VY;
    yVel = VX;
    size = SIZE;
  }

  void show() {
    fill(c);
    noStroke();
    ellipse(xPos, yPos, size, size);
  }

  void move() {
    xPos += xVel;
    yPos += yVel;

    //x collision logic
    if (xPos >= (width-5)) {
      xVel *= -1;
      xPos = width - 6;
    }

    if (xPos <= 5) {
      xVel *= -1;
      xPos = 6;
    }
    //y collision logic
    if (yPos >= (height-5)) {
      yVel *= -1;
      yPos = height - 6;
    }

    if (yPos <= 5) {
      yVel *= -1;
      yPos = 6;
    }

    if (mousePressed) {
      xPos = width/2;
      yPos = height/2;
    }
  }
}



