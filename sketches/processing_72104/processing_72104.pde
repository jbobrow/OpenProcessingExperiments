
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////Eli Thompson
//////////Keep the ball inside the boundary!
//////////Use the arrow keys to move the ball
//////////Click to move the ball to the mouse, with a point deduction
//////////Press 'r' to reset
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////



//variable for the distance the ball randomly jumps by
float difficulty;

//variables for ball position and a size constant
float ballLocationX, ballLocationY;
float score, highScore = 0;
final int BALL_SIZE = 20;

//variable for printing the directions on screen
boolean textOn = true;


//set up size, slow framerate, set initial values of variables
void setup() {
  size(600, 600);
  frameRate(30);
  ballLocationX = width/2;
  ballLocationY = height/2;
  difficulty = 1;
}


//draw each established method
void draw() {
  background(0);
  changeDifficulty();
  drawBall();
  moveBall(); 
  drawBoundary();
  scoreKeeper();
  drawText();
}


//move the ball to the mouse, reduce points and difficulty
void mousePressed() {
  score = score-5;
  difficulty = difficulty/2;
  ballLocationX = mouseX;
  ballLocationY = mouseY;
}


void keyPressed() {

  //set up ball movement via arrow keys
  if (keyCode == UP) {
    ballLocationY -= 15;
  }

  else if (keyCode == DOWN) {
    ballLocationY += 15;
  }

  else if (keyCode == LEFT) {
    ballLocationX -= 15;
  }

  else if (keyCode == RIGHT) {
    ballLocationX += 15;
  }

  //reset score, difficulty, and position
  if (key == 'r') {
    score = 0;
    difficulty = 1;
    ballLocationX = width/2;
    ballLocationY = height/2;
  }

  //show and hide the direction text
  if (key == 'h') {
    textOn = !textOn;
  }
}


//draw the ball itself plus the line conecting it to the center
void drawBall() {

  //set up local variables for the stroke color
  float strokeColorA = 255 - ballLocationX/3;
  float strokeColorB = 255 - ballLocationY/3;

  //change the fill based on the ball's location
  fill(ballLocationX, ballLocationY, 0);
  stroke(0, strokeColorA, strokeColorB);

  strokeWeight(2);
  ellipse(ballLocationX, ballLocationY, BALL_SIZE, BALL_SIZE);
  line(ballLocationX, ballLocationY, width/2, height/2);
}


//this method moves the ball around the screen randomly
//the amount it moves is based on the 'difficulty' variable
void moveBall() {
  ballLocationX = ballLocationX+difficulty*random(-5, 5);
  ballLocationY = ballLocationY+difficulty*random(-5, 5);
}


//draw the boundaries the ball must stay within
void drawBoundary() {
  final int BOUNDARY_WIDTH = BALL_SIZE * 2;
  noStroke();
  fill(255-boundaryColor(), 0, boundaryColor(), 150);
  rect(0, 0, BOUNDARY_WIDTH, height);
  rect(BOUNDARY_WIDTH, 0, width, BOUNDARY_WIDTH);
  rect(BOUNDARY_WIDTH, height-BOUNDARY_WIDTH, width, height);
  rect(width-BOUNDARY_WIDTH, BOUNDARY_WIDTH, 
  width, height-BOUNDARY_WIDTH*2);
}

float boundaryColor() {
  return score * 5;
}


//increase the difficulty variable as the program runs
void changeDifficulty() {
  difficulty += .008;
}


//update the score and high score as the program runs
void scoreKeeper() {

  //if the ball is inside the boundaries, the score increases
  if (ballLocationX > BALL_SIZE && ballLocationX < width-BALL_SIZE &&
    ballLocationY > BALL_SIZE && ballLocationY < height-BALL_SIZE) {
    score += 1.0/30.0;
  }

  //if the ball leaves the boundaries, the score goes to zero
  else {
    score = 0;
  }

  //if the current score is the highest score yet, high score updates
  if (score >= highScore) {
    highScore = score;
  }
  else {
    highScore = highScore;
  }
}


void drawText() {
  fill(255 - boundaryColor(), 0, boundaryColor(), 150);
  textSize(20);

  //draw the score and high score, these are permanent
  text("Score " + score, 50, height-50);
  text("High Score " + highScore, width-270, height-50);

  //draw the direction text, these are able to be hidden
  if (textOn == true) {
    text("Keep the ball inside the boundaries!", 40, 75);
    textSize(12);
    text("*use the arrow keys to move the ball*", 45, 90); 
    text("*click to move the ball to the mouse "+
      "(with a point deduction!)*", 45, 105);
    text("*press 'r' to reset*", 45, 120);
    text("*press 'h' to hide text*", 45, 135);
  }
  else {
  }
}


