
PFont headingFont = createFont("Futura", 50);
PFont scoreFont = createFont("Futura", 30);
PFont standardFont = createFont("Futura", 20);

//List of all possible game states.
int introState  = 0;
int ruleState   = 1;
int runState    = 2;
int overState  = 3;

//The currentState variable contains current state
int currentState = introState;

//List of all game objects and variables
Player player;
enemyBalls[] balls;
int score = 0;
int highScore = 0;
int newHighScore = 0;
float prev_x = 0;
float prev_y = 0;

//Set up
void setup()
{
  size(650, 650); 
  smooth();

  player = new Player();
  balls = new enemyBalls[20];

  for (int i=0; i < balls.length; i ++)
  {
    balls[i] = new enemyBalls();
  }
}
//List of functions for each game state.
void draw()
{
  if (currentState == introState)
  {
    intro_state();
  }
  else if (currentState == ruleState)
  {
    rule_state();
  }
  else if (currentState == runState)
  {
    run_state();
  }
  else if (currentState == overState)
  {
    over_state();
  }
}

//Game state functions.
//Intro State 
void intro_state()
{
  PImage img;
  img = loadImage("home.jpg");
  image(img, 0, 0);
}

/*background(202, 225, 225);   
 fill(140);
 
 //Draws the title screen
 textFont(headingFont);
 textAlign(CENTER);
 text("Avoid The Balls!", width/2, height/10);
 
 textFont(standardFont);
 textAlign(CENTER);
 text("Welcome, click anywhere to start the game! Good luck!", width/2, height/3);*/

//Rule screen State 
void rule_state()
{
  background(202, 225, 225);
  fill(140);

  textFont(headingFont);
  textAlign(CENTER);
  text("Just one Rule! Avoid the Balls!", width/2, height/10);

  textFont(standardFont);
  textAlign(CENTER);
  text("Keep moving to keep your score up! The score clock stops when you do!", width/2, height/3);
}

//Run game State
void run_state()
{
  background(202, 225, 225);

  //Draws and moves the balls
  for (int i=0; i < balls.length; i++)
  {
    balls[i].move();
    balls[i].display();
  }

  //Draws and moves the player
  player.move();
  player.display();

  //Checks any collisions between ball & player
  //If there is a collision go to overState
  for (int i=0; i < balls.length; i++)
  {
    if (intersect(player.x, player.y, player.diameter, 
    balls[i].x, balls[i].y, balls[i].diameter) == true)
    {
      currentState = overState;
    }
  }


if (player.x != prev_x || player.y != prev_y)
{
  score++;
}

prev_x = player.x;
prev_y = player.y;



//Increase the score
//The score is only increased when the player moves
if (prev_x!=player.x || prev_y!=player.y)
{
  score++;
}

show_score();
}

//Over State
void over_state()
{
  background(202, 225, 225);

  //Draws the balls and the player, but doesn't move them
  for (int i=0; i < balls.length; i++)
  {
    balls[i].display();
  }

  player.display();

  //Draws the game over message
  fill(0);
  textFont(headingFont);
  textAlign(CENTER);
  text("Game over!", width/2, height/10);

  textFont(standardFont);
  textAlign(CENTER);
  text("Click anywhere to reposition and try again!", width/2, height/3);

  textFont(standardFont);
  textAlign(CENTER);
  text("Your score was: " + score, width/2, height/8);

  textFont(standardFont);
  textAlign(CENTER);
  text("The high score for this session is: " + highScore, width/2, height/5);

  show_score();
}

//A function that displays the score
void show_score()
{
  //Draws the score
  fill(25, 25, 112);
  textFont(scoreFont);
  textAlign(LEFT);
  text(score, 10, 30);

  if (score >= 10)
  {
    highScore = score;
  }

  if (newHighScore > highScore)
  {
    newHighScore = highScore;
  }
}

//List of all Mouse Events
void mousePressed()
{
  if (currentState == overState || currentState == ruleState)
  {
    currentState = runState; //Starts the game 
    score = 0; //Resets the score
  }

  else if (currentState == introState)
  {
    currentState = ruleState;
  }
}


/*

 *** Collision detection function for circles ***
 
 (x1, y1) and (x2, y2) are the position of each circle
 d1 and d2 are diameters
 If the distance between the two positions is smaller
 than the sum of the radius (diameter/2), then there
 is an overlap
 
 */

boolean intersect(float x1, float y1, float d1, 
float x2, float y2, float d2 )
{
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) return true; 
  else return false;
}

//A simple class to represent the 'ennemy' balls
class enemyBalls {
   
  // fields
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
 
  // constructor.. we could have parameters here, but for
  // simplicity we will leave them out
  enemyBalls()
  {
    x = random(width);
    y = random(height);
    // random speed
    speedX = random(-3, 3);
    speedY = random(-3, 3);
    c = color(0, 178, 238, 200);
    diameter = 50;
  }
 
  void move() {
    x += speedX;
    y += speedY;   
    // bounce
    if ( x < 0 || x > width )  speedX *= -1; 
    if ( y < 0 || y > height ) speedY *= -1; 
  }
 
  void display()
  {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}

/*
strokeWeight(10.0);
translate(50, 50);

for (int i=0; i<10; i ++)
{
  rotate(TWO_PI/10);
  line (0, 0, 15, 0);
}

Alternative shape
*/
//A simple class to represent the 'ennemy' balls
class extraBalls {
   
  // fields
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
 
  // constructor.. we could have parameters here, but for
  // simplicity we will leave them out
  extraBalls()
  {
    x = random(width);
    y = random(height);
    // random speed
    speedX = random(-3, 3);
    speedY = random(-3, 3);
    c = color(0, 178, 238, 200);
    diameter = 50;
  }
 
  void move() {
    x += speedX;
    y += speedY;   
    // bounce
    if ( x < 0 || x > width )  speedX *= -1; 
    if ( y < 0 || y > height ) speedY *= -1; 
  }
 
  void display()
  {
    fill(c);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}

/*
strokeWeight(10.0);
translate(50, 50);

for (int i=0; i<10; i ++)
{
  rotate(TWO_PI/10);
  line (0, 0, 15, 0);
}

Alternative shape
*/
// A simple class to represent the Player object
class Player
{
  float x;
  float y;
  float diameter;
  color c;
 
  Player()
  {
    diameter = 25; //was 50
    c = color(255);
  } 
   
  void move()
  {
    x = mouseX;
    y = mouseY;
  }
   
  void display()
  {
    {
    stroke(59, 173, 224);
    fill(59, 173, 224, 64);
    for (int i = 1; i < 3; i++)
      {
        ellipse(x, y, i * diameter, i * diameter); 
      }
    }
  }
}
    
    /*fill(c);
    stroke(0);
    ellipse(x, y, diameter, diameter);
    original colour*/


