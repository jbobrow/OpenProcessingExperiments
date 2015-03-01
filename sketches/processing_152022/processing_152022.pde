
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
}

Ball ball1, ball2;





void setup() {
  size(500, 500);
  ball1 = new Ball(color(25, 220, 22), 60, 120, 2, 3, 20);
  ball2 = new Ball(color(25, 220, 132), 20, 20, 2, 3, 20);
}


void draw() {
  
  ball1.display();
  ball1.move();
  ball2.display();
  ball2.move();
  
}



