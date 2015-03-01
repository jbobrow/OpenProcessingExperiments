
//Authors: Peter,Rishabh,Mitchell

PImage Img;
PImage Ball;
PVector velocity;
PVector ballLocation;
float savedTime;
float timerDelay;
boolean goalScored = false;
PFont font;
int scoreLeft;
int scoreRight;
void setup() {
  //assign font/load it
  font = loadFont("Jokerman-Regular-48.vlw");
  size(1024, 768);
  //uploads field background
  String url = "soccer.jpg";
  Img = loadImage (url);
  Ball = loadImage ("ball.png");
  ballLocation = new PVector (495, 360);
  velocity = new PVector (3.5, 3.5);
  timerDelay = 3000;
  savedTime = millis();
}
void draw() {
  background (0);
  image(Img, 0, 0);
  image(Ball, ballLocation.x, ballLocation.y, 50, 50);
  ballLocation .add (velocity);
  //ball mechanics
  if (ballLocation.y > 668) {
    velocity.y = -velocity.y;
  } else if (ballLocation.y < 50) {
    velocity.y = -velocity.y;
  }
  if (ballLocation.x >920) {
    velocity.x = -velocity.x;
  } else if (ballLocation.x < 80) {
    velocity.x = -velocity.x;
  }
  float passedTime = millis() - savedTime;
  if (goalScored == true && passedTime < timerDelay) {
    //getting "Goal" to appear for x amount of time
    fill(255, 90, 90);
    textFont(font);
    textSize(70);
    text("Gooooooaaaaaaalllll", 150, 115);
  } else if (ballLocation.x <= 90 && ballLocation.y >316-17 && ballLocation.y <451-50) {
    //Left goal
    savedTime = millis();
    scoreLeft++;    
    goalScored = true;
  } else if (ballLocation.x >=920 && ballLocation.y >316-17 && ballLocation.y <451) {
    //Right goal
    savedTime = millis();
    scoreRight++;
    goalScored=true;
  }
 //scoreboard 
  textSize(50);
  textAlign(LEFT);
  textFont(font);
  fill(0);
  text(scoreLeft + "-" + scoreRight, 470, 700);
}



