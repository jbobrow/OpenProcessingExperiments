
float ballX = 200;
float ballY = 150;
float dX = random(1, 5);
float dY = random(1, 5);
int offset = 0;
float xPos = 300;
float yPos = 100;
int rectPos;
float paddleX;
float paddleY;
float paddleH = 10;
float paddleW = 50;
int points = 0;
int miss = 0;
boolean gamestate = false;

void setup() {
  size(400, 400);
  paddleY = height - 12;
}

void draw() {
  background(188, 188, 188);

  if (gamestate != true) {

    textSize(20);
    background(250, 0, 92);
    textAlign(CENTER);
    fill(225);
    text("Click Anywhere to Start", width/2, height/2);
    points = 0;
    miss = 0;
    
    if (mousePressed) {
      gamestate = true;
    }
  }
    else {

      fill(255);
      stroke(0);
      ellipse(ballX, ballY, 20, 20);

      fill(255, 3, 3);
      strokeWeight(3);
      stroke(0);
      rectMode(RADIUS);
      rect(paddleX, paddleY, paddleW, paddleH, 7);


      if (ballX >= width) {
        dX = -dX; // if dX == 2, it becomes -2; if dX is -2, it becomes 2
      }

      if (ballX < 0) {
        dX = -dX;
      }

      if ((ballX <= paddleX + paddleW) && (ballX >= paddleX - paddleW) && (ballY >= paddleY - paddleH)) {
        dY = -dY;
        points ++;
      }
      else if (ballY > height) {
        dY = -dY;
        miss ++;
        
      }

      if (ballY <0) {
        dY = -dY;
      }

      ballX = ballX + dX;
      ballY = ballY + dY;


      paddleX = mouseX + offset;

      if (mouseX < 50) {
        offset = 50 - mouseX;
      }
      else if (mouseX > 50 && mouseX < 350) {
        offset = 0;
      }
      else if (mouseX > 350) {
        offset = 350 - mouseX;
      }

      fill(0);
      textSize(10);
      text("points: " + points, 30, 40);
      text("miss: " + miss, 30, 60);

      if (miss == 5) {
        textSize(30);
        text("NOT SO EASY HUH?!?", 200, 200);
      }
      if (miss == 20) {
        textSize(30);
        text("IT'S JUST GOIN TO KEEP GETTING HARDER!!!", 200, 70);
      }   
      if (miss == 30) {
        textSize(30);
        text("IT'S NOT GOING TO GET ANY EASIER!!!", 200, 70);
      }
      if (points == 40) {
        textSize(30);
        text("GOOD JOB!!!", 200, 70);
      } 
      else if (points >= 50) {
        textSize(30);
        text("YOU WON!", 200, 100);
        noLoop();
      }
    }
  
     if (key == CODED) {
      if (keyCode == LEFT) {
        paddleX = paddleX - paddleH;
      } 
      else if (keyCode == RIGHT) {
        paddleX = paddleX + 30;
      }
    }
  }


   void mousePressed() {
      if (gamestate == mousePressed && gamestate == false)
        gamestate = true;
    }



