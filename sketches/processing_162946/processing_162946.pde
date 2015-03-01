
///// Globals ///////

String paddleOneMotion = "none";
String paddleTwoMotion = "none";
int paddleOne = 0;
int paddleTwo = 100;

int scoreOne = 0;
int scoreTwo = 0;

int ballX = 300;
int ballY = 200;
int ballDirectionX = -2; 
int ballDirectionY = 1;


boolean paused = false;

/////////////////////

void setup() {
  size(600, 600);
  background(19, 18, 23);
  ellipseMode(CENTER);
}

void draw() {
  if (!paused) {
    background(19, 18, 23);
    fill(0);
    rect(100, 100, 400, 400);
    drawBoard();
    movePaddles();
    drawPaddles();
    moveBall();
    drawBall();
  }
  else {
    fill(19, 18, 23);
    rect(235, 200, 150, 75);
    fill(255);
    text("PAUSED", 250, 250);
  }
}

void drawBoard() {
  fill(255);
  textSize(32);
  text(scoreOne, 250, 80);
  text(scoreTwo, 350, 80);
  for (int i = 0; i < 650; i+= 40) {
    fill(255, 180);
    rect(305, i, 10, 20);
  }
}

void reset() {
  ballX = 300;
  ballY = 200;
}

void drawPaddles() {
  fill(255, 210);
  rect(90, 100+paddleOne, 20, 60); 
  rect(490, 100+paddleTwo, 20, 60);
}

void moveBall() {
  if (ballY > 488 || ballY < 112) {
    ballDirectionY = -ballDirectionY;
  }
  if ((ballX > 488 && ballX < 500)|| (ballX < 112 && ballX > 90)) {
    if (ballX < 112 && ballY > paddleOne+100 && ballY < paddleOne+160) {
      ballDirectionX = -ballDirectionX;
    } else if (ballX > 488 && ballY > paddleTwo+100 && ballY < paddleTwo+160) {
      ballDirectionX = -ballDirectionX;
    }
  } else {
    if (ballX < 0) {
      scoreTwo++;
      reset();
    } else if (ballX > width) {
      scoreOne++;
      reset();
    }
  }

  ballY += 2*ballDirectionY;
  ballX += 2*ballDirectionX;
}

void drawBall() {
  noStroke();
  fill(255);
  ellipse(ballX, ballY, 25, 25);
}

void movePaddles() {
  if (paddleOneMotion == "up" && paddleOne > 0) {
    paddleOne = paddleOne - 3;
  } else if (paddleOneMotion == "down" && paddleOne < 340) {
    paddleOne = paddleOne + 3;
  }
  if (paddleTwoMotion == "up" && paddleTwo > 0) {
    paddleTwo = paddleTwo -3;
  } else if (paddleTwoMotion == "down" && paddleTwo < 340) {
    paddleTwo= paddleTwo +3;
  }
}

void keyPressed() {
  if (key == 'a') {
    paddleOneMotion = "up";
  } else if (key == 'z') {
    paddleOneMotion = "down";
  }
  if (key == 'k') {
    paddleTwoMotion = "up";
  } else if (key == 'm') {
    paddleTwoMotion = "down";
  }
  if (key == 'p'){
    paused = !paused;
  }
  if (key == 'r'){
    scoreOne = 0;
    scoreTwo = 0;
    reset();
  }
}

void keyReleased() {
  if (key == 'a' || key == 'z') {
    paddleOneMotion = "none";
  }
  if (key == 'k' || key == 'm') {
    paddleTwoMotion = "none";
  }
}



