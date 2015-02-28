


ball myBallObject, myBallObject2, myBallObject3, myBallObject4, myBallObject5, myBallObject6, myBallObject7, myBallObject8, myBallObject9, myBallObject10, 
myBallObject11, myBallObject12, myBallObject13, myBallObject14, myBallObject15, myBallObject16, myBallObject17, 
myBallObject18, myBallObject19, myBallObject20, myBallObject21, myBallObject22, myBallObject23, myBallObject24, myBallObject25, myBallObject26;

void setup() {
  size(500,500);
  myBallObject = new ball();
  myBallObject2 = new ball();
  myBallObject3 = new ball();
  myBallObject4 = new ball();
  myBallObject5 = new ball();
  myBallObject6 = new ball();
  myBallObject7 = new ball();
  myBallObject8 = new ball();
  myBallObject9 = new ball();
  myBallObject10 = new ball();
  myBallObject11 = new ball();
  myBallObject12 = new ball();
  myBallObject13 = new ball();
  myBallObject14 = new ball();
  myBallObject15 = new ball();
  myBallObject16 = new ball();
  myBallObject17 = new ball();
  myBallObject18 = new ball();
  myBallObject19 = new ball();
  myBallObject20 = new ball();
  myBallObject21 = new ball();
  myBallObject22 = new ball();
  myBallObject23 = new ball();
  myBallObject24 = new ball();
  myBallObject25 = new ball();
  myBallObject26 = new ball();
  background(255,228,225);
  smooth();
}
void mousePressed() {
    noStroke();
}

void keyPressed() {
  background(0,255,255);
  stroke(0);
}


void draw() {
  fadeBackground();
  myBallObject.moveBall();
  myBallObject.checkWall();
  myBallObject2.moveBall();
  myBallObject2.checkWall();
  myBallObject3.moveBall();
  myBallObject3.checkWall();
  myBallObject4.moveBall();
  myBallObject4.checkWall();
  myBallObject5.moveBall();
  myBallObject5.checkWall();
  myBallObject6.moveBall();
  myBallObject6.checkWall();
  myBallObject7.moveBall();
  myBallObject7.checkWall();
  myBallObject8.moveBall();
  myBallObject8.checkWall();
  myBallObject9.moveBall();
  myBallObject9.checkWall();
  myBallObject10.moveBall();
  myBallObject10.checkWall();
  myBallObject11.moveBall();
  myBallObject11.checkWall();
  myBallObject12.moveBall();
  myBallObject12.checkWall();
  myBallObject13.moveBall();
  myBallObject13.checkWall();
  myBallObject14.moveBall();
  myBallObject14.checkWall();
  myBallObject15.moveBall();
  myBallObject15.checkWall();
  myBallObject16.moveBall();
  myBallObject16.checkWall();
  myBallObject17.moveBall();
  myBallObject17.checkWall();
  myBallObject18.moveBall();
  myBallObject18.checkWall();
  myBallObject19.moveBall();
  myBallObject19.checkWall();
  myBallObject20.moveBall();
  myBallObject20.checkWall();
  myBallObject21.moveBall();
  myBallObject21.checkWall();
  myBallObject22.moveBall();
  myBallObject22.checkWall();
  myBallObject23.moveBall();
  myBallObject23.checkWall();
  myBallObject24.moveBall();
  myBallObject24.checkWall();
  myBallObject25.moveBall();
  myBallObject25.checkWall();
  myBallObject26.moveBall();
  myBallObject26.checkWall();
}


class ball {
  float ballX, ballY, speedX, speedY;

  ball() {
    ballX = random(0, width);
    ballY = random(0, height);
    speedX = random(5, 5);
    speedY = random(5, 5);
  }

  void moveBall() {
    ballX+=speedX;
    ballY+=speedY;
    fill(106,90,205);
    ellipse(ballX, ballY, 50, 50);
  }

  void checkWall() {
    if (ballX>width || ballX < 0) speedX*=-1;
    if (ballY>height || ballY < 0) speedY*=-1;
  }
}

void fadeBackground() {
  fill(0,2);
  rect(0, 0, width, height);
}







