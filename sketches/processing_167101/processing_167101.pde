
//(color C, float X, float Y, float VY, float VX)
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
    mins[i] = new Minion(C, X, Y, VY, VX);
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

  //color C, float X, float Y, float V

  Minion(color C, float X, float Y, float VY, float VX) {
    c = C;
    xPos = X;
    yPos = Y;
    xVel = VY;
    yVel = VX;
  }

  void show() {
    fill(c);
    noStroke();
    ellipse(xPos, yPos, 10, 10);
  }

  void move() {
    xPos += xVel;
    yPos += (yVel);

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
  }
}



