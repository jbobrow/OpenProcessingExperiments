
/* Homework 5: Complete Pong
 by Leiah Fournier */

PVector ballPos = new PVector(0, 0);
PVector ballVel = new PVector(4, 2);
PVector paddleDim = new PVector(10, 80);

int p1x;
int p2x;

int p1y;
int p2y;

boolean p1u, p1d, p2u, p2d;

int lScore;
int rScore;

int paddleSpeedx;
int paddleSpeedy;
int ballSize;

//Array of Headlines (Thanks Processing!)
String [] headlines = {
  "Ass whooped",
  "Pong isn't for everyone",
  "You kiss your mother with that mouth?",
  "At the end of the day, remember, you're only letting yourself down because no one else cares.",
  "me   B-)        you  :,-(",
  "LOL",
};
PFont f;
float x;
int index = 0;


void setup() {
  size(600, 600);
  
  f = createFont("Arial", 50, true);
  x = width;

  //Starting Score
  lScore = 0;
  rScore = 0;

  p1x = 15;
  p2x = width-15;

  p1y = height/2;
  p2y = height/2;

  ballPos.x = width/2;
  ballPos.y = height/2;

  paddleSpeedx = 15;
  paddleSpeedy = 15;
  ballSize = 20;

  rectMode(CENTER);
}


void draw() {
  background(0);

  updateScores();
  movementLogic();
  collisionLogic();
  

  //Score Text
  textSize(75);
  text(lScore, 100, 100);

  textSize(75);
  text(rScore, 450, 100);


  //Divider
  fill(255);
  strokeWeight(5);
  for (int i = 0; i<19; i++) {
    rect(width/2, 28+i*30, 10, 25);
  }

  //Draw Ball
  ellipseMode(CENTER);
  ellipse(ballPos.x, ballPos.y, ballSize, ballSize);

  //Draw Paddles
  rect(15, p1y, paddleDim.x, paddleDim.y);
  rect(width-15, p2y, paddleDim.x, paddleDim.y);
  
  //Display Headline at x Location
  textFont(f,50);
  textAlign (LEFT);
  
  //Display Specific String from Array
  text(headlines[index], x, 180);
  x = x - 3;
  
  //Off-screen
  float w = textWidth(headlines[index]);
  if (x < - w) {
    x = width;
    index = (index + 1) % headlines.length;
}
}

void keyPressed() {
  //P1 Controls
  if (key == 'w') {
    p1d= false;
    p1u = true;
  }

  if (key == 's') {
    p1u = false;
    p1d = true;
  }

  //P2 Controls

  if (key == CODED) {
    if (keyCode == UP) {
      p2d= false;
      p2u= true;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2u= false;
      p2d= true;
    }
  }
}


void keyReleased() {
  //P1 Controls
  if (key == 'w') {
    p1u= false;
  }

  if (key == 's') {
    p1d = false;
  }

  //P2 Controls

  if (key == CODED) {
    if (keyCode == UP) {
      p2u= false;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      p2d= false;
    }
  }
}

void movementLogic() {

  ballPos.x += ballVel.x;
  ballPos.y += ballVel.y;

  if (p1u) p1y -= paddleSpeedx;
  if (p1d) p1y += paddleSpeedy;
  if (p2u) p2y -= paddleSpeedx;
  if (p2d) p2y += paddleSpeedy;
}

void collisionLogic() {
  //CREDIT: Daniel Fernades Ribeiro
  //Left Paddle
  if (ballPos.x - ballSize/2 <= p1x+(paddleDim.x/2 ) && ballPos.x - ballSize/2 > p1x - paddleDim.x/2 && ballPos.y <p1y + paddleDim.y/2 && ballPos.y > p1y - paddleDim.y/2) {
    ballPos.x = 1 + ballSize/2 + (p1x+(paddleDim.x/2 ));
    ballVel.x *= -1;
  }

  //Right Paddle
  if (ballPos.x + ballSize/2 >= p2x-(paddleDim.x/2 ) && ballPos.x - ballSize/2 < p2x + paddleDim.x/2 && ballPos.y > p2y - paddleDim.y/2 && ballPos.y < p2y + paddleDim.y/2) {
    ballPos.x = (p2x-(paddleDim.x/2 ))- 1 - ballSize/2;
    ballVel.x *= -1;
  }
  if (ballPos.y - ballSize/2 < 0 || ballPos.y + ballSize/2 > height - 40 ) {
    ballVel.y *=-1;
  }
}

//CREDIT: Daniel Fernandes Ribeiro  
void updateScores() {

  if (ballPos.x + 200 < 0) {
    lScore++;
    ballPos.x = width/2;
    ballPos.y = height/2;
    ballVel.x = 5;
    paddleSpeedx = 8;
    paddleSpeedy = 5;
    ballVel.x *= -1;
    ballVel.y *= -1;
  }
  if (ballPos.x + ballSize/2 > width + 200) {
    rScore++;
    ballPos.x = width/2;
    ballPos.y = height/2;
    ballVel.x = 5;
    paddleSpeedx = 5;
    paddleSpeedy = 8;
    ballVel.x *= -1;
    ballVel.y *= -1;
  }
  if  (lScore == 10) {
    background (0);
    fill (255);
    textSize(70);
    text("PLAYER 2 WINS", 30, height/2);
    ballVel.x = 0;
    ballVel.y = 0;
  } else if (rScore == 10) {
    background (0);
    fill(255);
    textSize(70);
    text("PLAYER 1 WINS", 30 , height/2);
    ballVel.x = 0;
    ballVel.y= 0;
  }
}


