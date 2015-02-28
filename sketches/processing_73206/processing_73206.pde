
//////////////////////////////////////////////////////////////////////
//////////Tyler Smallwood
//////////Program 6
//////////
//////////Hold 'r' to generate random rectangles, press 'b' to change
//////////the background color and reveal a surprise, be sure to look
//////////at the text bar to see who wins!(purple always breaks a tie)
//////////////////////////////////////////////////////////////////////

//Initial setup of variables
final int BALL_HEIGHT = 50;
int leftBallSpeed = 0;
int rightBallSpeed = 0;
int speedIncrease1 = int(random(10));
int speedIncrease3 = int(random(10));
int fillColorR = 0;
int fillColorG = 0;
int fillColorB = 0;

//Sets window size
void setup() {
  size(600, 700);
}

//Initiates methods to draw Ghost,Left ball, and Right ball
void draw() {
  background(fillColorR, fillColorG, fillColorB);

  drawGhost();
  drawLeftBall();
  drawRightBall();
//These variables allow for the differing speeds of the balls
  int purpleBallHeight = BALL_HEIGHT + leftBallSpeed;  
  int orangeBallHeight = BALL_HEIGHT + rightBallSpeed;
  boolean purpleWins = true;
//These "if" methods print which ball is the winner
  if (orangeBallHeight>purpleBallHeight) {
    purpleWins = false;
  } 

  if (purpleWins) {
    println("purple wins!");
  }

  else println("orange wins!");
}
//Draws the left ball
void drawLeftBall() {
  fill(255, 8, 227);
  leftBallSpeed = leftBallSpeed + speedIncrease1;
  ellipse(width/3, BALL_HEIGHT+leftBallSpeed, 50, 50);
}
//Draws the right ball
void drawRightBall() {
  fill(255, 177, 8);
  rightBallSpeed = rightBallSpeed + speedIncrease3;
  ellipse(2*width/3, BALL_HEIGHT+rightBallSpeed, 50, 50);
}
//Changes the background color when activated
void backgroundChange() {
  fillColorR = int(random(255));
  fillColorG = int(random(255));
  fillColorB = int(random(255));
}
//Draws the ghost
void drawGhost() {

  fill(fillColorG, fillColorR, fillColorB);
  ellipse(300, 400, 250, 250);

  fill(0);
  ellipse(300, 450, 100, 100);
  ellipse(250, 350, 50, 50);
  ellipse(350, 350, 50, 50);
}
//This method returns the values of x for rectangle colors
int color1(int x) { 
  return x-2;
}


int color2(int x) {
  return x+200;
}

int color3(int x) {
  return x/3*80;
}
//Draws and colors random rectangles
void randomRectangles() {
  draw();
  int rectangleColor1 = color1(28);
  int rectangleColor2 = color2(1);
  int rectangleColor3 = color3(3);
  int rectangleX = int(random(600));
  int rectangleY = int(random(700));
  fill(rectangleColor1, rectangleColor2, rectangleColor3);
  rect(rectangleX, rectangleY, int(random(200)), int(random(200)));
}

void keyPressed() {
//changes background if 'b' is pressed
  if (key == 'b') {
    backgroundChange();
  }

//draws random rectangles if 'r' is presses
  if (key == 'r') {
    randomRectangles();
  }
}


