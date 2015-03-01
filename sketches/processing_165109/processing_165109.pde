
int scoreL = 0;
int scoreR = 0;

int ballX = 200;

int ballY = 150;

float ballYVelocity = 0;

float ballXVelocity = 0;

boolean toRight = true;

boolean toLeft = true;

int paddleOneX = 0;

int paddleOneY = 120;

int paddleSpeed = 1;
int paddleSpeedR;
int paddleSpeedL;



int paddleTwoX = 400 - 10;

int paddleTwoY = 120;



void setup() {


size(400, 300);





ballXVelocity = random(4)-2;

ballYVelocity = random(4)-2;



}



void draw() {

if (toRight == true &&
ballX >= paddleTwoX-10 &&
ballY >= paddleTwoY &&
ballY <= paddleTwoY+40)

{
  ballXVelocity *= -1;
  toRight = false;
}

if (toRight == false &&
ballX <= paddleOneX+20 &&
ballY >= paddleOneY &&
ballY <= paddleOneY+40)

{
  ballXVelocity *= -1;
  toRight = true;
}

if (ballY <= 0) {
  ballYVelocity *= -1;

}
if (ballY >= 300) {
    ballYVelocity *= -1;
}

if (ballX <= 0) {
  scoreR += 1;
  ballXVelocity = random(3);
  ballYVelocity = random(3);
  ballX = 200;
  ballY = 150;
}
if (ballX >= 400) {
  scoreL += 1;
  ballXVelocity = random(3);
  ballYVelocity = random(3);
  ballX = 200;
  ballY = 150;
}
background(200);



fill(50);



ellipse(ballX, ballY, 20, 20);



fill(50, 20, 150);

rect(paddleOneX, paddleOneY, 10, 40);

rect(paddleTwoX, paddleTwoY, 10, 40);


ballX += ballXVelocity;

ballY += ballYVelocity;




}
void keyPressed() {
  if (key == 'r' || key == 'R') {
    //resetGame();
  }
  if (key == 'w' || key == 'W') {
    paddleSpeedL = paddleSpeed * -1;
  }
  else if (key == 's' || key == 'S') {
    paddleSpeedL = paddleSpeed;
  }
  else if (keyCode == UP) {
    paddleSpeedR = paddleSpeed * -1;
  }
  else if (keyCode == DOWN) {
    paddleSpeedR = paddleSpeed;
  }
}
 
void keyReleased() {
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    paddleSpeedL = 0;
  }
  else if (keyCode == UP || keyCode == DOWN) {
    paddleSpeedR = 0;
  }
}



// Previous controling code thing
/*void keyPressed() { 

if (key == CODED) {

  if(keyCode == UP) {
    paddleTwoY -= 5;
  }
  if(keyCode == DOWN) {
    paddleTwoY += 5;
  }


 

}else{
   if(key == 'w') {
    paddleOneY -= 5;
  }
  if (key == 's') {
    paddleOneY += 5;
  }
}
}*/

