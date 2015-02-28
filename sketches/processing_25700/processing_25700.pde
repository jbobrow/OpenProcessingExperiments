
// A simple dodgeball game -- avoid the orange circles for 
// as long as you can!

// This is a simplified version of a casual game by Steven Kay:
// http://wwww.openprocessing.org/visuals/?visualID=6640

// The game has 3 states:
// - an intro screen, shown in the beginning
// - the game itself
// - a game over screen, shown when the player dies

// We use objects to represents the different elements of 
// the game.

PFont titleFont = createFont("Impact", 48);
PFont scoreFont = createFont("14Segment", 24);
PFont basicFont = createFont("Courier", 18);

// list out the possible game states
// each state is really just a number that we assign
int INTRO     = 0;
int RUN_GAME  = 1;
int GAME_OVER = 2;

// the gameState variable contains current state
int gameState = INTRO;

// game objects and variables 
Player player;
Ball[] balls;
int score = 0;

////////////////////////////////////////////////////////////
void setup() {
  size(400, 400);  
  smooth();
  
  player = new Player();

  // 10 enemy balls.  
  balls = new Ball[10];
  for (int i=0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

////////////////////////////////////////////////////////////
// The different game states are broken down into functions
// to keep draw() a manageable size!

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
// GAME STATE FUNCTIONS

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

  background(22);

  // draw and move the balls
  for (int i=0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();  
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
  }
}

////////////////////////////////////////////////////////////
// Collision detection function for circles
// (x1, y1) and (x2, y2) are the position of each circle
// d1 and d2 are diameters 
// If the distance between the two positions is smaller 
// than them sum of the radius (diameter/2), then there
// is an overlap

boolean intersect(float x1, float y1, float d1, 
                  float x2, float y2, float d2 ) {
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) return true;  
  else return false;
}

////////////////////////////////////////////////////////////
// A simple class to represent the 'ennemy' balls
class Ball {
  
  // fields
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;

  // constructor.. we could have parameters here, but for 
  // simplicity we will leave them out 
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
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);  
  }
}

////////////////////////////////////////////////////////////
// A simple class to represent the Player object
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



