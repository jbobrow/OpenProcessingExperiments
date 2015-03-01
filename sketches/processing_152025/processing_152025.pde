
class Ball {
  color ballColor;
  float xPos, yPos;
  float xSpeed, ySpeed;
  float size;


  Ball(color _ballColor, float _xPos, float _yPos, float _xSpeed, float _ySpeed, float _size) {

    ballColor = _ballColor;
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    size = _size;
  }

  void display() {
    noStroke();
    fill(ballColor);
    ellipse(xPos, yPos, size, size);
  }
  void move() {

    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;
    if (xPos > width || xPos < 0) {
      xSpeed = xSpeed * -1;
    }
    if (yPos > height || yPos < 0) {
      ySpeed = ySpeed * -1;
    }
  }

  void collision() {

    for (int i = 0; i < orb.length; i++) {
      if (dist(xPos, yPos, orb[i].xPos, orb[i].yPos) < (size + orb[i].size)/2 && orb[i] != this) {

        xSpeed = xSpeed * -1;
        ySpeed = ySpeed * -1;
      }
    }
  }

  void lines() {
    stroke(210);
    for (int i = 0; i < orb.length; i++) {
      if (dist(xPos, yPos, orb[i].xPos, orb[i].yPos) < 100 && orb[i] != this) {
        line(xPos, yPos, orb[i].xPos, orb[i].yPos);
      }
    }
  }
}

Ball[] orb = new Ball[100];

void setup() {
  //size(displayWidth, displayHeight);
  size(750, 750);
  for (int i = 0; i < orb.length; i++) {
    orb[i] = new Ball(color(random(255), random(255), random(255), random(255)), random(width), random(height), random(3), random(4), 10);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < orb.length; i++) {
    orb[i].display();
    orb[i].move();
    orb[i].collision();
    orb[i].lines();
  }
}



