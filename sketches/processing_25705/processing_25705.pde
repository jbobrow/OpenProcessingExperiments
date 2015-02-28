
// This version has increasing difficulty levels..
// We start with 1 ball and add more over time 

PFont titleFont = createFont("Impact", 48);
PFont scoreFont = createFont("14Segment", 24);
PFont basicFont = createFont("Courier", 18);

// game states
int INTRO = 0;
int RUN_GAME = 1;
int GAME_OVER = 2;

int gameState = INTRO;

Player player;
Ball[] balls;
PowerUp powerUp;
int score = 0;

////////////////////////////////////////////////////////////
void setup() {
  size(400, 400);  
  smooth();

  player = new Player();
  powerUp = new PowerUp();

  // Start with 1 ball
  balls = new Ball[1];
  balls[0] = new Ball();
}

////////////////////////////////////////////////////////////
// The different game states are broken down into functions
// to keep draw() a manageable size.
void draw() {
  if (gameState == INTRO) {
    intro();
  }
  else if (gameState == RUN_GAME) {
    run_game();
  }
  else if (gameState == GAME_OVER) {
    game_over();
  }
}


////////////////////////////////////////////////////////////
// GAME STATES

void intro() {
  background(200, 100, 40);    
  fill(255);
  // draw the title screen 
  textFont(titleFont);
  textAlign(CENTER);
  text("DODGEBALL 1.0", width/2, height/2);

  textFont(basicFont);
  text("Click anywhere to start", width/2, height/3 * 2);
}

//----------------------------------------------------------
// Main game logic 
void run_game() {

  // example of how to use the power up
  // background will become dark green when the power up is active 
  if (powerUp.active == true) {
    background(0, 64, 0);
  }
  else {
    background(22);
  }  
     
  // draw and move the balls
  for (int i=0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();  
  }

  // update and show the powerUp if it is available
  powerUp.update();
  if (powerUp.available) {
    powerUp.display();
    // check for collisions with the powerup
    if (intersect(player.x, player.y, player.diameter, 
                  powerUp.x, powerUp.y, powerUp.diameter) == true) {
      powerUp.activate();       
    } 
  }

  // draw and move the player
  player.move();
  player.display();

  // check for collisions between the balls and the player    
  for (int i=0; i < balls.length; i++) {
    // if there is a collision --> to go GAME_OVER state
    if (intersect(player.x, player.y, player.diameter, 
    balls[i].x, balls[i].y, balls[i].diameter) == true) {
      gameState = GAME_OVER; 
    } 
  }

  // increase the score
  score++;
  
  // check if score is a multiple of 250:
  if (score % 250 == 0) {
    // add a new enemy ball -- see the reference for "append" for details
    Ball temp = new Ball();  
    balls = (Ball[])append(balls, temp);
  }
  
  show_score();
}

//----------------------------------------------------------
void game_over() {
  background(200, 0, 0);

  // draw the balls and the player, but don't move them 
  for (int i=0; i < balls.length; i++) {
    balls[i].display();  
  }
  player.display();

  // draw the game over messge
  fill(0);
  textFont(titleFont);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  
  show_score();
}

////////////////////////////////////////////////////////////
// A function that displays the score
void show_score() {
  // draw the score
  fill(0, 255, 100);
  textFont(scoreFont);
  textAlign(LEFT);
  text(score, 10, 30);
}

////////////////////////////////////////////////////////////
// mouse events
void mousePressed() {
  if (gameState == GAME_OVER || gameState == INTRO) {
    gameState = RUN_GAME; // start the game  
    score = 0; // reset the score
    powerUp.reset(); // reset the power up
    // go back to level 1 by re-making the balls[] array 
    balls = new Ball[1];
    balls[0] = new Ball();
  }
}
 
////////////////////////////////////////////////////////////
// Collision detection function
boolean intersect(float x1, float y1, float d1,
float x2, float y2, float d2 ) {
 
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) {
    return true; 
  }
  return false;
}
 
//////////////////////////////////////////////////////////
class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
 
  float diameter;
  color c;
 
  Ball() {
    x = random(width);
    y = random(height);
 
    // random speed
    speedX = random(-2, 2);
    speedY = random(-2, 2);
 
    c = color(200, 100, 40, 200);
 
    diameter = 50;
  } 
 
  void move() {
    x += speedX;
    y += speedY;
     
    // bounce
    if ( x < 0 || x > width )  speedX *= -1; 
    if ( y < 0 || y > height ) speedY *= -1; 
    
    // if the powerUp is active, make the balls smaller
    if (powerUp.active) diameter = 10;
    else diameter = 50;
  }
 
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter); 
  }
}
 
//////////////////////////////////////////////////////////
class Player {
  float x;
  float y;
  float diameter;
  color c;
 
  Player() {
    diameter = 50;
    c = color(255);
  } 
   
  void move() {
    x = mouseX;
    y = mouseY;
  }
   
  void display() {
    fill(c);
    stroke(0);
    ellipse(x, y, diameter, diameter);
  }
   
}
 
//////////////////////////////////////////////////////////
// A powerUp is just a circle which comes in and out of view
// using a timer
 
// When the power up is "available", it can be caught by the player
// at which point it then becomes "active"
 
class PowerUp {
 
  float x;
  float y;
  float diameter;
 
  Timer timer;
  boolean available;
  boolean active;
 
  PowerUp() {
    x = random(width);
    y = random(height);   
 
    available = false;
    active = false;
 
    timer = new Timer(3000);
    diameter = 30;
  }
 
  void update() {
    if (timer.finished()) {
      if (active == true) {
        active = false;
        available = false;
      }
      else {
        available = !available;
        x = random(width);
        y = random(height);   
      }
      timer.reset();
    } 
  }
 
  void display() {
    // just a little trick here to animate the outline
    float c = map(sin(frameCount*0.1), -1, 1, 128, 255);
    stroke(c);
    fill(0);
    ellipse(x, y, diameter, diameter);
    fill(c);
    textFont(basicFont);
    textAlign(CENTER);
    text("?", x, y+5);
  }
   
  // this will be called when the player catches the power up
  void activate() {
    active = true;
    available = false;
    timer.reset();
  }
   
  // used when we reset the game..
  void reset() {
    available = false;
    active = false;
    timer.reset(); 
  }
 
}
 
//////////////////////////////////////////////////////////
// Lets put the concept of a "timer" into a class!
class Timer {
  long startTime;
  int timeout; // in milliseconds
 
  Timer(int timeout) {
    this.timeout = timeout;
    this.startTime = millis(); 
  }
   
  long elapsed() {
    return millis() - startTime;
  }
   
  boolean finished() {
    if (elapsed() > timeout) return true;
    return false;
  }
   
  void reset() {
    this.startTime = millis(); 
  }
   
  // we can have two functions with the same name within a class
  // as long as they have different parameters...
  void reset(int newTimeout) {
    this.reset();  // call the vanilla reset() without any parameter
    timeout = newTimeout;  // update the timeout
  }
}
