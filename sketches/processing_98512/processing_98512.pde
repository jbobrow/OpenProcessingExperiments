
PFont headingFont = createFont("Spacebit", 50);
PFont scoreFont = createFont("Spacebit", 30);
PFont standardFont = createFont("Spacebit", 20);

//List of all possible game states.
int introState  = 0;
int ruleState   = 1;
int runState    = 2;
int overState   = 3;

//The currentState variable contains current state
int currentState = introState;

//List of all game objects and variables
Player player;
enemyAsteroids[] asteroids;
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
  asteroids = new enemyAsteroids[30];

  for (int i=0; i < asteroids.length; i ++)
  {
    asteroids[i] = new enemyAsteroids();
  }
}

//List of functions for each game state.
void draw()
{
  if (currentState == introState)
  {
    intro_state();    //Runs Intro State
  }
  else if (currentState == ruleState)
  {
    rule_state();    //Runs Rule State
  }
  else if (currentState == runState)
  {
    run_state();     //Runs Game State
  }
  else if (currentState == overState)
  {
    over_state();    //Runs Game Over State
  }
}

//Game state functions.

//Intro State 
void intro_state()
{
  PImage img;
  img = loadImage("atr.jpg");
  image(img, 0, 0);
}

//Rule screen State 
void rule_state()
{
  PImage img;
  img = loadImage("atrRules.jpg");
  image(img, 0, 0);
}

//Run game State
void run_state()
{
  PImage img;
  img = loadImage("nebula3.jpg");
  image(img, 0, 0);

  //Draws and moves the balls
  for (int i=0; i < asteroids.length; i++)
  {
    asteroids[i].move();
    asteroids[i].display();
  }

  //Draws and moves the player
  player.move();
  player.display();

  //Checks any collisions between ball and player
  //If there is a collision go to overState
  for (int i=0; i < asteroids.length; i++)
  {
    if (intersect(player.x, player.y, player.diameter, 
    asteroids[i].x, asteroids[i].y, asteroids[i].diameter) == true)
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

//Increases the score
//The score is only increased when the player moves to combat cheating
if (prev_x!=player.x || prev_y!=player.y)
{
  score++;
}

show_score();
}

//Over State
void over_state()
{
  background(142, 142, 142);

  //Draws the balls and the player, but doesn't move them
  for (int i=0; i < asteroids.length; i++)
  {
    asteroids[i].display();
  }

  player.display();

  //Draws the game over message
  fill(0);
  textFont(headingFont);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/10);

  textFont(standardFont);
  textAlign(CENTER);
  text("CLICK ANYWHERE TO REPOSITION AND TRY AGAIN!", width/2, height/3);

  textFont(standardFont);
  textAlign(CENTER);
  text("YOUR SCORE WAS: " + score, width/2, height/8);

  textFont(standardFont);
  textAlign(CENTER);
  text("THE HIGH SCORE FOR THIS SESSION IS: " + highScore, width/2, height/5);

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
 Collision detection function for circles
 
 (x1, y1) and (x2, y2) mark the coordinates of each
 circle. d1 and d2 are the diameters of the circles.
 If the distance between the two positions is smaller
 than the sum of the radius (diameter/2), then there
 is an overlap.
*/

boolean intersect(float x1, float y1, float d1, 
float x2, float y2, float d2 )
{
  float d = dist(x1, y1, x2, y2);
  if ( d < (d1/2 + d2/2) ) return true; 
  else return false;
}

//A simple class to represent the enemy balls
class enemyAsteroids {
   
  // fields
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
 
  // constructor.. we could have parameters here, but for
  // simplicity we will leave them out
  enemyAsteroids()
  {
    x = random(width);
    y = random(height);
    // random speed
    speedX = random(-1,1);
    speedY = random(-1,1);
    c = color(220, 20, 60, 200);
    diameter = 50;
  }
 
  void move()
  {
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
//A simple class to represent the Player object
class Player
{
  float x;
  float y;
  float diameter;
  color c;
 
  Player()
  {
    diameter = 25;
    c = color(125);
  } 
   
  void move()
  {
    x = mouseX;
    y = mouseY;
  }
   
  void display()
  {
    {
    fill(c);
    stroke(0);
    ellipse(x, y, diameter, diameter);

    for (int i = 1; i < 3; i++)
      {
        ellipse(x, y, i * diameter, i * diameter); 
      }
    }
  }
}


