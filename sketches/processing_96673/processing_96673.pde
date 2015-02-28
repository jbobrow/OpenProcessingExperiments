
/*********************
* objBouncingBall01
* Paul Robert
**********************/

Ball[] balls = new Ball[50];

void setup() {
  size(400,400);
  frameRate(30);
    for (int i = 0; i < balls.length; i++) {
      balls[i] = new Ball(random(width),random(height),random(-10,10),random(-10,10),random(5,30),color(64,127,0));
    }
}

void draw() {
  background(255, 150, 255);
  for (int i = 0; i < balls.length; i++) {
      balls[i].move();
      balls[i].checkEdges();
      balls[i].display();
  }
}

class Ball {

  float xpos;
  float ypos;
  float speedX;
  float speedY;
  float size;
  color col;

  Ball(float tempxpos, float tempypos, float tempspeedX, float tempspeedY, float tempsize, color tempcol) {
    xpos = tempxpos;
    ypos = tempypos;
    speedX = tempspeedX;
    speedY = tempspeedY;
    size = tempsize;
    col = tempcol;
  }
  void move() {
    xpos = xpos + speedX;
    ypos = ypos + speedY;
  }

  void checkEdges() {
    if (xpos > width || xpos < 0) {
      speedX *= -1;
    }
    if (ypos > height || ypos < 0) {
      speedY *= -1;
    }
  }

  void display() {
    fill(col);
    noStroke();
    ellipse(xpos, ypos, size, size);
  }

}

void mousePressed() {
  saveFrame();
}


