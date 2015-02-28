
Ball ball1;
PImage basket;

void setup() {
  size(400,400);
  smooth();
  basket = loadImage("laDefense.png");
  // Initialize balls
  ball1 = new Ball(16);
}

void draw() {
  background(255);
    image(basket, 0, 0);
  // Move and display balls
  ball1.move();
  ball1.display();
}

class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = 350;
    xspeed = 5;
    yspeed = 5;
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > 350 || y < 0) {
      yspeed *= - 1;
    }
    if (y < 250) {
      yspeed *= - 1;
    }
  }
  
  // Draw the ball
  void display() {
    noStroke();
    fill(#ff0000);
    ellipse(200,y,r*2,r*2);
  }
}


