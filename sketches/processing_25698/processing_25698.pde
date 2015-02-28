
// We'll build a simple dodgeball game.
// To start with, let's design our Ball and Player classes
// These will be really straightforward

// game objects and variables 
Player player;
Ball[] balls;

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

void draw() {
  background(22);

  // draw and move the balls
  for (int i=0; i < balls.length; i++) {
    balls[i].move();
    balls[i].display();  
  }

  // draw and move the player
  player.move();
  player.display();
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
