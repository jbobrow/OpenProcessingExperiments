
boolean startGame = false;
boolean endGameWin = false;
boolean endGameLose = false;

PVector location = new PVector(400,250);
PVector velocity = new PVector(0,0);;
int ballX = 240;
int ballY = 260;
float holeLocX;
float holeLocY;
int score;
float friction = 0.973;

int mouseClicks;

void setup() {
  size(460, 320);
  frameRate(60);
  smooth();
}

void draw() {
  
  if (startGame != true) {
    startGame();
  } else if (endGameWin == true) {
    endGameWin();
  } else if (endGameLose == true) {
    endGameLose();
  } else {
    
    background(0,175,0);
    fill(0);
    text("Score", 20, 20);
    text(score, 50, 20);
    stroke(0);
    
    if (mouseClicks == 0) {
      line(location.x, location.y, mouseX, mouseY);
    }
    //hole(random Location)
    fill(50);
    ellipse(holeLocX, holeLocY, 20, 20);
    
    //ball
    location.x += int(velocity.x*0.196);
    location.y += int(velocity.y*0.196);
    if (mouseClicks == 1) {
      velocity.x *= friction;
      velocity.y *= friction;
    }
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 15, 15);
    
    //if ball hits the hole
    float goalX = location.x - holeLocX;
    float goalY = location.y - holeLocY;
    
    if ((goalX < 13.0 && goalX > -13.0 ) && (goalY < 13.0 && goalY > -13.0 ) &&
      (abs(velocity.x) < 22 && abs(velocity.y) < 22)) {
      score++;
      endGameWin = true;
    }
    //if ball is off screen
    if ((location.x > width) || (location.x < 0)) {
      velocity.x *= -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y *= -1;
    }
    if (abs(velocity.x) <= 0.6 && abs(velocity.y) <= 0.6 && mouseClicks == 1) {
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
  if(startGame && mouseClicks == 0){
    velocity.x = (location.x - mouseX);
    velocity.y = (location.y - mouseY);
    mouseClicks++;
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

void startGame() {
  mouseClicks = 0;
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
}

void endGameWin() {
  mouseClicks = 0;
  location.x = 380;
  velocity.x = 0;
  location.y = 250;
  velocity.y = 0;
  holeLocX = (int)(random(100, width-20)*0.6);
  holeLocY = (int)(random(100, width-20)*0.6);
  background(0, 175, 0);
  textAlign(CENTER);
  fill(0);
  text("Your score is currently : " + score, width/2-20,height/2-20);
  text("Press ENTER to keep going!", width/2, height/2);
}

void endGameLose() {
  location.x = 380;
  velocity.x = 0;
  location.y = 250;
  velocity.y = 0;
  background(0, 175, 0);
  textAlign(CENTER);
  fill(0);
  text("Good run! Your score is : " + score, width/2-20,height/2-20);
  text("Press R to play again!.", width/2, height/2);
}

