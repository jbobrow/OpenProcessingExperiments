
class Ball {
 
  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
   
  // Constructor
  Ball(float size) {
    r = size;
    x = random(width);
    y = random(height);
    xspeed = random (-7, 7);
    yspeed = random (-7, 7);
  }
   
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
     
    // Check horizontal edges
    if (x > width || x < 0 ) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
   
  // Draw the ball
  void display() {
    noStroke();
    fill(255);
    ellipse (x, y, r, r);
    ellipse(x+32,y,r,r);
  }
}
 
// Two ball variables
Ball ball;

 
void setup() {
  size(300,300);
  smooth();
   
  // Initialize balls
  ball= new Ball(30);
}
 
void draw() {
  background(0);
   
  // Move and display balls
  ball.move();
  ball.display();

}



