
// RainGame
// Start here.

PFont font;
Catcher catcher;
ArrayList<Drop> drops;
Timer timer;
int lives = 10; //keep track of number of lives
int score = 0; //keep track of how many drops are caught
int speed = 1000; //the speed at which the drops fall
int glevel = 1; //intialize a level number


void setup() {
  size( 800, 600 );
  catcher = new Catcher( 0, 0, 32 );
  timer = new Timer( speed );
  timer.start();
  drops = new ArrayList<Drop>();
  font = createFont("Courier New", 36.0);
}


void draw() {
  background( 255 );
  catcher.setLocation( mouseX, mouseY );
  catcher.render();
  processDrops();
  harvestDrops();
  generateDrops();
  livesMeter();
  displayScore();
  displayLevel();
  levelInc();
}


// If the timer expired, make a new drop.
void generateDrops() {
  if (timer.isFinished()) {
    Drop drop = new Drop( random( 20, width - 20 ), -10, random( 6, 18 ) );
    drops.add(drop);
    timer.setTimerLength(speed);
    timer.start();
  }
}


// Move and render all the drops.
// Check to see if drops are "caught" by the catcher.
// Check to see if drops it the bottom of the window.
void processDrops() {
  for (int i = 0; i < drops.size(); i++) {
    Drop drop = drops.get(i);
    if (drop.living) {
      drop.move();
      drop.render();
      if (catcher.intersect( drop.x, drop.y, drop.radius )) {
        drop.setColor( 240 );
        drop.caught();
        score = score + 1;
      }
      if (drop.hitBottom()) {
        lives = lives - 1;
        if (lives == 0) {
          fill(255, 0, 0);
          textFont(font, 72);       
          textAlign(CENTER);
          text("You Lose.", 400, 300);
          textFont(font, 20);
          text("Score: " + score, 400, 350);
          exit();
        }
      }
    }
  }
}


// Look at all the drops, and remove the drops that
// are no longer "living".
void harvestDrops() {
  for (int i = 0; i < drops.size(); i++) {
    Drop drop = drops.get(i);
    if (drop.living == false) {
      drops.remove(i);
    }
  }
}

void livesMeter() { //run a health bar at the top
  int lw = lives * 80;
  fill(255, 0, 0);
  rect(0, 0, lw, 30);

  fill(0);
  textFont(font, 36);       
  textAlign(LEFT);
  text("lives: " + lives, 5, 27);
}

void displayScore() {
  fill(0);
  textFont(font, 72);       
  textAlign(RIGHT);
  text(score, 800, 590);
}

void levelInc() { //increase the difficulty
  if (score < 15) {
    speed = 1000;
    glevel = 1;
  }
  if (score > 15) {
    speed = 500;
    glevel = 2;
  }
  if (score > 30) {
    speed = 300;
    glevel = 3;
  }
  if (score > 45) {
    speed = 250;
    glevel = 4;
  }
  if (score > 60) {
    speed = 200;
    glevel = 5;
  }
  if (score > 85) {
    speed = 100;
    glevel = 6;
  }
  if (score > 95) {
    speed = 75;
    glevel = 7;
  }
  if (score > 105) {
    speed = 50;
    glevel = 8;
  }
}

void displayLevel() { //show the user what level they're on
  fill(0);
  textFont(font, 36);       
  textAlign(RIGHT);
  text("level: " + glevel, 800, 27);
}

// Catcher
// Represents the object the user controls, it follows the mouse.

class Catcher {
  float x;
  float y;
  float radius;
  
  Catcher( float newX, float newY, float newRadius ) {
    x = newX;
    y = newY;
    radius = newRadius;
  }
  
  
  void render() {
    stroke( 0 );
    fill( 175 );
    ellipse( x, y, radius * 2, radius * 2 );
  }
  
  
  void setLocation( float tx, float ty ) {
    x = tx;
    y = ty;
  }
  
  
  // returns true if the catcher intersects with the given circle.
  boolean intersect( float cx, float cy, float cr ) {
    float distance = dist( x, y, cx, cy );
    return distance < (radius + cr);
  }
  
  void displayLives() {
    
  }
  
}
// Drop
// Represents one rain drop.

class Drop {
  float x;
  float y;
  float radius;
  int c;
  float speed;
  boolean living;

  Drop( float newX, float newY, float newRadius ) {
    x = newX;
    y = newY;
    radius = newRadius;
    c = 120;
    speed = random( 1, 5 );
    living = true;
  }


  void render() {
    if (living) {
      stroke( 0 );
      fill( c );
      ellipse( x, y, radius * 2, radius * 2 );
    }
  }


  void setColor( int value ) {
    c = value;
  }


  void move() {
    y += speed;
  }


  void caught() {
    living = false;
  }


  boolean hitBottom() {
    if (y + radius > height) {
      living = false;
      return true;
    }
    return false;
  }
}

// Timer
// An object to keep track of a set amount of time.
// All times are in milliseconds. There are 1000 milliseconds in one second.
// millis() returns the number of milliseconds since program started.

class Timer {
  int savedTime;  // This is the time the timer was started
  int totalTime;  // This is the length of time for the timer. (in milliseconds)
  
  Timer( int value ) {
    totalTime = value;
  }
  
  
  void start() {
    savedTime = millis();
  }
  
  
  // return true if more than totalTime milliseconds have elapsed since start().
  boolean isFinished() {
    int passedTime = millis() - savedTime;
    return passedTime > totalTime;
  }
  
  
  void setTimerLength( int value ) {
    totalTime = value;
  }
}


