
Ball [] balls = new Ball [50];
PImage blackWhite;

void setup() {

  blackWhite = loadImage("blackwhite.png");
  smooth();
  size(500, 500);

  for (int i = 0; i < 50; i++) {

    int x = int(random(20, 400));
    int y = int(random(20, 400));
    int speed = int(random(1, 10));
    // color ballColor = color(200,0,127);
    //color ballColor = color(random(0, 255),255,255);

    balls [i] = new Ball (x, y, 20, speed);
  }
}

void draw() {

  background(blackWhite);

  if (mousePressed == true) {
    for (int i = 0; i < balls.length; i++) {
      balls[i].animate();
      balls[i].display();
    }
  }
}


class Ball {

  int posX;
  int posY;
  int ballDiam;
  int ballSpeed;
  //  color ballColor;

  Ball(int tempPosX, int tempPosY, int tempBallDiam, int tempBallSpeed) {
    posX = tempPosX;
    posY = tempPosY;
    ballDiam = tempBallDiam;
    ballSpeed = tempBallSpeed;
    //    ballColor = tempBallColor;
  }

  void display() {
    fill(int(random(0, 255)), 255, 255);
    noStroke();
    ellipse(posX, posY, ballDiam, ballDiam);
  }

  void animate() {

    posX += ballSpeed;
    posY += ballSpeed;

    if ((posX > width && posY > height) || (posX < 0 && posY < 0)) {

      ballSpeed *= -1;
    }
  }
}



