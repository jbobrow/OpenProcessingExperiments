
class Ball {
  // DATA
  float x; // ball x
  float y; // ball y
  float r; // ball size
  float speedX; // ball x speed
  float speedY; // ball y speed

  // CONSTRUCTOR 
  Ball(float _x) { // gets passed a float that randomises x position of new ball objects
    x = _x; 
    y = 5;
    r = 5; // 
    speedX = 1; 
    speedY = 4.3;    
  }
  
  // FUNCTIONS
  void run() {  // place all the functions for this class in here, and just call ballCollection.run from void draw()
    move();
    bounce();
    collide();
    display();
    livesLost();
  }
  
  void move() { // moves the ball across the screen
    x += speedX; 
    y += speedY; 
  }
  
  void bounce() {
    // bounces ball off either left or right wall
    if (x >= width || x <= 0) {
      speedX *= -1;
      side.trigger(); // trigger sound
      hits += 10; // increase points if wall is hit
    }
    // bounce back if ball hits top of screen 
    if (y <= 5) {
      speedY *= -1;
      wall.trigger(); // trigger sound
     hits += 200; // increase points 
    }
  }
  
  // Boolean function used to check if shapes are overlapping/colliding.
  boolean isCollision (float x1, float y1, float x2, float y2, float r1, float r2) {
    // calculate differences between centres
    float distX = x1 - x2;
    float distY = y1 - y2;
    // get distance with pythagoras 
    float squaredist = (distX * distX) + (distY * distY);
    return squaredist <= (r1 + r2) * (r1 + r2); // return true if shapes collide
  } // code based on a collision article in DevMag and the "Return Type" example from Greg O'Hanlon's coding handouts.
  
   // Function used to the send the position and size of the Bat/Ball objects to the isCollision function.  
   void collide() { // If the bat and ball collide, then reverse ball direction.
    if (isCollision(x, y, myBat.x, myBat.y, r, myBat.r)) {
      speedX = random(1, 1.2);
      speedY = random(1, 5);
      speedY *= -1;
      bat.trigger(); // trigger sound
      hits += 100; // increase points 
    }
  }
  
  void livesLost() { // Used to decrease life/reset ball position if ball goes off the screen
    if (y >= height) {
      myScore.lives = myScore.lives -1; // decrease lives variable in the Score object
      life.trigger(); // trigger sound
      y = 5; // reset ball to top of screen
      x = (random(50, width-50)); // create a random x position for the ball on reset 
    }
  }
  
  void display() { // display the ball object
    noStroke();
    rect(x, y, r, r);
  }
}


