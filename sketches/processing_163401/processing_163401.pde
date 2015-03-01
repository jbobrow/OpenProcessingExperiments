
float x;
float y;
Ball myBall;

void setup() {
  size(400, 400);
  myBall = new Ball();
  background(255);
}

void draw() {
  fill(y, x, 255);
  myBall.move();
  myBall.bounce();
  myBall.display();
  
  x=random(width);
  y=random(height);
}

void mousePressed()  {
  background(255);
}

class Ball {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float diam;

  Ball() {
    xPos = random(width);
    yPos = random(height);
    xSpeed = random(2,5);
    ySpeed = random(2,5);
    diam = 25;
  }

  void move() {
    xPos += xSpeed;
    yPos += ySpeed;
  }

  void bounce() {
    if (xPos > width || xPos < 0) {
      xSpeed = -xSpeed;
    }
    if (yPos > height || yPos < 0) {
      ySpeed = -ySpeed;
    }
  }

  void display() {  
    ellipse(xPos, yPos, diam, diam);
  }
}



