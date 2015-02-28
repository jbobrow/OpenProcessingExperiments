
// Adding collision detection, using the intersect() function
// for circles we've programmed earlier.

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
  
  // check for collisions between the Player and each Ball
  for (int i=0; i < balls.length; i++) {
    if ( intersect(player.x, player.y, player.diameter, 
                   balls[i].x, balls[i].y, balls[i].diameter)) {
      // collision detected!
      println("ouch");
    }  
  }
}

///////////////////////////////////////////////////////////////
// Collision detection function for circles (this is old news!)
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

///////////////////////////////////////////////////////////////
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

///////////////////////////////////////////////////////////////
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


 
