
//Thomas Sanchez Lengeling

// Base on the 
//The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Bob b1;
Bob b2;

Spring s1;
Spring s2;
//Spring s3;

void setup() {
  size(600, 360);
  b1 = new Bob(width/2, 100);
  b2 = new Bob(width/2, 200);
  b3 = new Bob(width/2, 300);

  s1 = new Spring(b1,b2,100);
  s2 = new Spring(b2,b3,100);

  smooth();
}

void draw() {
  background(255); 

  s1.update();
  s2.update();
  
  s1.display();
  s2.display();
//  s3.display();

  b1.update();
  b1.display();
  b2.update();
  b2.display();
  b3.update();
  b3.display();

  b1.drag(mouseX, mouseY);
}



void mousePressed() {
  b1.clicked(mouseX, mouseY);
}

void mouseReleased() {
  b1.stopDragging();
}


class Bob { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 12;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.95;

  // For mouse interaction
  PVector dragOffset;
  boolean dragging = false;

  // Constructor
  Bob(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    dragOffset = new PVector();
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }


  // Draw the bob
  void display() { 
    stroke(0);
    strokeWeight(2);
    fill(175);
    if (dragging) {
      fill(50);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
  } 

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
}

// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html

class Spring { 

  // Location
  PVector anchor;

  // Rest length and spring constant
  float len;
  float k = 0.2;
  
  Bob a;
  Bob b;

  // Constructor
  Spring(Bob a_, Bob b_, int l) {
    a = a_;
    b = b_;
    len = l;
  } 

  // Calculate spring force
  void update() {
    // Vector pointing from anchor to bob location
    PVector force = PVector.sub(a.location, b.location);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    a.applyForce(force);
    force.mult(-1);
    b.applyForce(force);
  }


  void display() {
    strokeWeight(1);
    stroke(0);
    line(a.location.x, a.location.y, b.location.x, b.location.y);
  }
}



