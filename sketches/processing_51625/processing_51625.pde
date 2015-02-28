
// Pendulum
// Daniel Shiffman <http://www.shiffman.net>

// A Simple Pendulum Class
// Includes functionality for user can click and drag the pendulum

class Pendulum  {

  PVector location;    // Location of pendulum ball
  PVector origin;      // Location of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration
  float damping;       // Arbitary damping amount
  color myColor;
  // This constructor could be improved to allow a greater variety of pendulums
  Pendulum(PVector origin_, float r_, color c) {
    // Fill all variables
    origin = origin_.get();
    location = new PVector();
    r = r_;
    angle = PI/2;
    myColor = c;
    aVelocity = 1.0;
    aAcceleration = 0.0;
    damping = 1;   // Arbitrary damping
 
}

  void go() {
    update();
    display();
    
  }

  // Function to update location
  void update() {
    float G = 0.01;                              // Arbitrary universal gravitational constant
    aAcceleration = (1 * G / r) * sin(angle*23);  // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
    aVelocity -= aAcceleration;                 // Increment velocity
    aVelocity =aVelocity* damping;                       // Arbitrary damping
    angle += aVelocity;                         // Increment angle
  }

  void display() {
    if(cos(angle)<=1 && cos(angle)<=0)
    {
      location.set(r*sin(angle),r*cos(angle),0);         // Polar to cartesian conversion
    }
    location.add(origin);                              // Make sure the location is relative to the pendulum's origin
    ellipseMode(CENTER);  
    fill(myColor);
    // Draw the ball
    ellipse(location.x,location.y,2.5,2.5);

  }
    
  }

 




