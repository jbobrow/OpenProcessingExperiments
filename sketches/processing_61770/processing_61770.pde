
boolean startGame = false;
boolean endGameWin = false;
boolean endGameLose = false;
float xspeed;
float yspeed;
PVector location = new PVector(400,250);
PVector velocity = new PVector(0,0);;
int ballX = 240;
int ballY = 260;
float holeLocX;
float holeLocY;
int score;
final int PAR = 4;
int lineValue = 175;

void setup() {
  size(460, 320);
  frameRate(60);
  smooth();
}

void draw() {
  if (startGame != true) {
    score = 0;
    location.x = 380;
    velocity.x = 0;
    location.y = 250;
    velocity.y = 0;
    background(0,175,0);
    textAlign(CENTER);
    holeLocX = (int)(random(100, width-20)*0.6);
    holeLocY = (int)(random(100, width-20)*0.6);
    fill(0);
    text("Hello, Welcome!", width/2-20,height/2-20);
    text("Press ENTER to start Hole in One", width/2, height/2);
  } else if (endGameWin == true) {
    location.x = 380;
    velocity.x = 0;
    location.y = 250;
    velocity.y = 0;
    holeLocX = (int)(random(100, width-20)*0.6);
    holeLocY = (int)(random(100, width-20)*0.6);
    background(0, 175, 0);
    textAlign(CENTER);
    text("Your score is currently : " + score, width/2-20,height/2-20);
    text("Press ENTER to keep going!", width/2, height/2);
  } else if (endGameLose == true) {
    location.x = 380;
    velocity.x = 0;
    location.y = 250;
    velocity.y = 0;
    background(0, 175, 0);
    textAlign(CENTER);
    fill(0);
    text("Good run! Your score is : " + score, width/2-20,height/2-20);
    text("Press R to play again!.", width/2, height/2);
  } else {
    
    background(0,175,0);
    fill(0);
    text("Score", 20, 20);
    text(score, 50, 20);
    stroke(0);
    line(location.x, location.y, mouseX, mouseY);
    
    //hole
    fill(50);
    ellipse(holeLocX, holeLocY, 20, 20);
    
    //ball
    location.x += int(velocity.x*0.2);
    location.y += int(velocity.y*0.2);
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 15, 15);
    //if ball hits the hole
    float goalX = location.x - holeLocX;
    float goalY = location.y - holeLocY;
    println(location.x + ", " + holeLocX);
    println(goalX+ ", " + goalY);
    if ((goalX < 15.0 && goalX > -15.0 ) && (goalY < 15.0 && goalY > -15.0 )) {
      score++;
      endGameWin = true;
    }
    //if ball is off screen
    if ((location.x > width) || (location.x < 0)) {
      endGameLose = true;
    }
    if ((location.y > height) || (location.y < 0)) {
      endGameLose = true;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R' && endGameLose) {
    startGame = false;
    endGameLose = false;
  }
    
  if (key == ENTER && !startGame ||endGameWin) { 
      startGame = true;
      endGameWin = false;
      endGameLose = false;
  }
}

void mouseClicked() {
  if(startGame){
    velocity.x = (location.x - mouseX);
    velocity.y = (location.y - mouseY);
    
  }
}

class PVector {
  float x;
  float y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
}

