
float speed = 0;
float speedY = 0;
float wallY = 350;
float wallX = 650;
float ballX = 350;
float ballY = 350;
float wallN = 50;
float wallM = 350;
float reset = 4;
float time = 1;
float clock=0;
Boolean ball=true;
Boolean three=true;
Boolean two=false;
Boolean one=false;
Boolean teeth=false;
Boolean two2=false;
Boolean free=true;
Boolean winner=false;
Boolean gameOver=false;
float soup = 0;
float m = 0;

void setup() {
  size(700,700);
}


void draw() {
  background(0,0,0);
  smooth();
  clock += time;

  //the ball's phisics
  ballX += speed;
  ballY += speedY;

  if (ballX > 700) {
    ballX = 350;
    ballY = 350;
    speed = 0;
    speedY = 0;
    reset = -4;
    soup += 1;
    time +=1;
  }
  if (speedY == 0 && speed == 0) {
    if(clock >= 60) {
      speed = reset;
      speedY = random(-4, 4);
      time = 0;
      clock =0;
    }
  }

  if (ballX < 0) {
    ballX = 350;
    ballY = 350;
    speedY = 0;
    speed = 0;
    reset = 4;
    m += 1;
    time += 1;
  }

  if (ballX >= 645) {
    if (ballX <= 660) {
      if (ballY > wallY) {
        if (ballY < wallY + 80) {
          speed += -4;
          if (keyPressed) {
            if (key == CODED) {
              if (keyCode == UP) {
                speedY += -2;
              }
              else if (keyCode == DOWN) {
                speedY += 2;
              }
            }
          }
        }
      }
    }
  }
  if (ballX >= wallN) {
    if (ballX <= 70) {
      if (ballY > wallM) {
        if (ballY < wallM + 80) {
          speed += 4;
          if (wallM > 0) {
            speedY += 2;
          }
          else if (wallM < 0) {
            speedY += -2;
          }
        }
      }
    }
  }


  if (ballY > 700) {
    speedY = speedY - speedY*2;
  }
  if (ballY < 0) {
    speedY = speedY - speedY*2;
  }
  if (speedY >= 6) {
    speedY += -1;
  }
  if (speedY <= -6) {
    speedY += 1;
  }
  if (speed >= 6) {
    speed += -1;
  }
  if (speed <= -6) {
    speed += 1;
  }






  //the wall
  rect(wallX, wallY, 10, 80); 



  {

    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          wallY += -7;
        }
        else if(keyCode == DOWN) {
          wallY += 7;
        }
      }
    }
  }
  if (wallY > 640) {
    wallY += -7;
  }
  if (wallY < 0) {
    wallY += 7;
  }
  //enemy wall

  rect(wallN, wallM, 10, 80);

  if(ballY > wallM + 60) {
    wallM += 4.8;
  }
  else if(ballY < wallM + 20) {
    wallM += -4.8;
  }
  //tries
  if (ballX >= 690) {
    if (soup == 0) {
      if (three = true) {
        three = false;
        two = true;
      }
    }
  }
  if (ballX >= 690) {
    if (soup == 1) {
      if(two = true) {
        two = false;
        one = true;
      }
    }
  }

  if(ballX >= 690) {
    if (soup == 2) {
      if(one = true) {
        one = false;
        gameOver = true;
        ball=false;
        m -= second();
      }
    }
  }
  //enemy health
  if (ballX <= 10) {
    if (m == 0) {
      if (free = true) {
        free = false;
        two2 = true;
      }
    }
  }
  if (ballX <= 10) {
    if (m == 1) {
      if(two2 = true) {
        two2 = false;
        teeth = true;
      }
    }
  }

  if(ballX <= 10) {
    if (m == 2) {
      if(teeth = true) {
        teeth = false;
        winner = true;
        ball=false;
      }
    }
  }


  if (ball) Ball();
  if (three) threeFn();
  if (two) twoFn();  
  if (one) oneFn();

  if (teeth) potato();
  if (two2) tomato();
  if (free) chicken();
  if (winner) youWin();
  if (gameOver) gameOverFn();
}
void oneFn() {
  text("1",680,10,20,20);
}

void twoFn() {
  text("2",680,10,20,20);
}

void threeFn() {
  text("3", 680,10,20,20);
}
//enemy lives
void potato() {
  text("1",20,10,20,20);
}

void tomato() {
  text("2",20,10,20,20);
}

void chicken() {
  text("3", 20,10,20,20);
}
//the ball\
void Ball() {
  ellipse(ballX, ballY, 20,20);
}
void youWin() {
  scale (10);
  text("YOU WIN",22.25,20.25,45,45);
}

void gameOverFn() {
  scale(10);
  text("game over", 18.25,18.25,45,45);
}


