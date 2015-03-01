
Ball ball1;
Ball ball2;
Ball[] allBalls = new Ball[4];

void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < allBalls.length; i ++ ) {
    allBalls[i] = new Ball (random(32, 64));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < allBalls.length; i ++ ) {
    allBalls[i].move();
  }
  for (int j = 0; j < allBalls.length; j ++) {
    for (int z = 0; z< allBalls.length; z ++) {
      if (j !=z) {
        if (allBalls[j].intersect(allBalls[z])) {
          allBalls[j].highlight();
          allBalls[z].highlight();
        }
      }
    }
  }
  for (int k = 0; k < allBalls.length; k ++) {
    allBalls[k].display();
  }
}
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
    } else {
      return false;
    }
  }
}

