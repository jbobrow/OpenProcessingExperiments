
// size of the player paddles
float paddlewidth = 10;
float paddleheight = 40;
// ball position
float ballx;
float bally;
// ball velocity
float balldx;
float balldy;
float ballsize = 10;
// scores
int score1 = 0;
int score2 = 0;
PFont myFont;

class Paddle { 
  float x;
  float y;
  float direction;

  Paddle(float initx) {
    x = initx;
    y = height / 2;
    direction = 0;
  }

  void draw() {
    rect(x, y, paddlewidth, paddleheight);
  }

  void move() {
    y = y + direction;
    if (y < 40) {
      y = y - direction;
    }
    else if ( y > height-40) {
      y = y - direction;
    }
  }
}

Paddle paddle1;
Paddle paddle2;

void a_new_round_is_started() {
  ballx = width/2;
  bally = height/2;
  if (random(100) < 50) {
    balldx = 1;
  } 
  else {
    balldx = -1;
  }
  balldy = random(-3, 3);
}

void setup() {
  size(400, 400);
  paddle1 = new Paddle(20);
  paddle2 = new Paddle(width - 20);
  myFont = createFont("Courier", 40);
  textFont(myFont);
  // start game:
  a_new_round_is_started();
}

void draw() {
  background(0);
  noStroke();
  rectMode(CENTER);
  fill(100, 255, 100);
  // draw net:
  for (int i =  0; i < height; i += 10) {
    rect(width/2, i, 1, 5);
  }
  // draw paddles
  paddle1.move();
  paddle2.move();
  paddle1.draw();
  paddle2.draw();
  // draw ball
  float newballx = ballx + balldx;
  float newbally = bally + balldy;
  // ball collisions:
  if (ballx > paddle1.x + ballsize && 
    newballx <= paddle1.x + ballsize &&
    bally < paddle1.y + paddleheight/2 && 
    bally > paddle1.y - paddleheight/2) {
    balldx = -balldx;
    balldx = balldx * 1.1;
    balldy = (bally - paddle1.y) * 0.2;
  } 
  if (ballx < paddle2.x - ballsize && 
    newballx >= paddle2.x - ballsize  &&
    bally < paddle2.y + paddleheight/2 && 
    bally > paddle2.y - paddleheight/2) {
    balldx = -balldx;
    balldx = balldx * 1.1;
    balldy = (bally - paddle2.y) * 0.2;
  } 
  ballx = newballx;
  bally = newbally;
  
  if (ballx < 0) {
    score2 = score2 + 1;
    a_new_round_is_started();
  }
  if (ballx > width) {
    score1 = score1 + 1;
    a_new_round_is_started();
  }
  if (bally < 0) {
    // change direction of y 
    // balldy *= -1;
    balldy = -balldy;
  }
  if (bally > height) {
    // change direciton of y
    balldy = -balldy;
  }
  rect(ballx, bally, ballsize, ballsize);
  // draw scores
  textSize(80);
  textAlign(CENTER);
  text(score1, width / 4, 80);
  text(score2, width*3/4, 80);
}

void keyPressed() {
  if (key == 'w') {
    paddle1.direction = -5;
  }
  else if (key == 's') {
    paddle1.direction = 5;
  }
  else if (key == 'o') {
    paddle2.direction = -5;
  }
  else if (key == 'l') {
    paddle2.direction = 5;
  }
}

void keyReleased() {
  if (key == 'w') {
    paddle1.direction = 0;
  }
  else if (key == 's') {
    paddle1.direction = 0;
  }
  else if (key == 'o') {
    paddle2.direction = 0;
  }
  else if (key == 'l') {
    paddle2.direction = 0;
  }
}

