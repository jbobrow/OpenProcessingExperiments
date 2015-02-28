
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/70218*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int score1 = 00;
int score2 = 00;

int rX = 400;
int rY = 200;
int paddleY = 20;

int ballX = 3;
int ballY = 3;

void setup() {
  size(800, 400);
  smooth();
}

void draw() {
  background(255);

  noCursor();

  fill(0);
  rect(0, 0, width, height-50);

  strokeWeight(3);
  stroke(200);
  line(400, 20, 400, 330);

  // score
  PFont font;
  font = loadFont("HelveticaNeue-UltraLight-24.vlw");
  textFont(font, 24);
  text(score1, 345, 380);
  text(score2, 450, 380);

  // paddles
  noStroke();
  fill(255);
  rect(780, mouseY, 5, 50);
  rect(20, paddleY, 5, 50);

  if (mouseY > 300) {
    mouseY = 300;
  }
  if (mouseY < 0) {
    mouseY = 0;
  }
  if (paddleY > 300) {
    paddleY = 300;
  }
  if (paddleY < 0) {
    paddleY = 0;
  }



  // ball
  noStroke();
  fill(200);
  ellipse(rX, rY, 10, 10);

  // move the ball
  rX = rX + ballX;
  rY = rY + ballY;

  // bounce off the vertical boundaries
  if ((rY > 345) || (rY < 5)) {
    ballY = ballY * -1;
  }


  // for the paddle controlled by mouse
  // collisions
  if (rX == 775) { 
    if ((rY >= mouseY) && ( rY <= mouseY+50)) {
      ballX = ballX * -1;
    }
    else {
      score1 = score1 + 1;
    }
  }

  // for the paddle controlled by computer
  // move
  if (ballX < 0) {
    if (ballY > 0) {
      if (paddleY < (rY + 10 + ballY - int(random(53)))) {
        paddleY = paddleY + ballY;
      }
      else {
        paddleY = paddleY - ballY;
      }
    }
    if (ballY < 0) {
      if (paddleY > (rY + 10 + ballY + int(random(3)))) {
        paddleY = paddleY + ballY;
      }
      else {
        paddleY = paddleY - ballY;
      }
    }
  }


  // collisions
  if (rX == 25) { 
    if ((rY <= (paddleY + 50)) && (rY >= paddleY)) {
      ballX = ballX * -1;
    }
    else {
      score2 = score2 +1;
    }
  }


  // start over
  if ((rX < 0)||(rX>800)) {
    ballX = ballX * -1;
    rX = 400;
    rY = 200;
  }
}


