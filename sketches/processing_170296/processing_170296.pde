
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-3: Bouncing ball with intersection

// Two ball variables

Ball[] allBalls = new Ball[4];

void setup() {
  size(800, 600);
  smooth();
  for (int i = 0; i < allBalls.length; i ++ ) { // Initialize each Car using a for loop.
    allBalls[i] = new Ball(random(255));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < allBalls.length; i ++ ) { // Run each Car using a for loop.
    allBalls[i].move();
  }

  for (int j = 0; j < allBalls.length; j ++ ) { // Run each Car using a for loop.
    int other = j+1;
    if (other > allBalls.length-1) {
      other=0;
    }

    if (allBalls[j].intersect(allBalls[other])) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
      allBalls[j].highlight();
      allBalls[other].highlight();
    }
    for (int k = 0; k < allBalls.length; k ++ ) {
      allBalls[k].display();
    }
  }
}


// An array of 100 Car objects!

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-3: Bouncing ball with intersection

class Ball {
  
  float r; // radius
  float x,y;
  float xspeed,yspeed;
  color c = color(100,50);
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( -5,5);
    yspeed = random( -5,5);
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    
    // Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // Whenever the balls are touching, this highlight() function is called 
  // and the color is darkened.
  void highlight() { 
    c = color(0,150);
  }
  
  // Draw the ball
  void display() {
    stroke(0);
    fill(c);
    ellipse(x,y,r*2,r*2);
     // After the ball is displayed, the color is reset back to a darker gray.
    c = color(100,50);
  }
  
  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball b) {
    
    // Objects can be passed into functions as arguments too! 
    float distance = dist(x,y,b.x,b.y); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < r + b.r) {
      return true;
    }
     else {
      return false;
    }
  }

}




