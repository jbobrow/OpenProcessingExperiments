
// size of the player paddles
float paddlewidth = 10;
float paddleheight = 40;
// ball position
float ballx;
float bally;
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

void setup() {
  size(400, 400);
  paddle1 = new Paddle(20);
  paddle2 = new Paddle(width - 20);
  ballx = width / 2;
  bally = height / 2;
  myFont = createFont("Courier", 40);
  textFont(myFont);
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
