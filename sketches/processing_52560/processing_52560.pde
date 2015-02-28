
// Bob class, just like our regular Mover (location, velocity, acceleration, mass)

class Bob { 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 10;
  Pendulum p1, p2;
  
  // Arbitrary damping to simulate friction / drag 
  float damping = 0.98;

  // For mouse interaction
  PVector drag;
  boolean dragging = false;

  // Constructor
  Bob(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    drag = new PVector();
    p1 = new Pendulum(new PVector(location.x + mass, location.y), 50, -PI/2);
    p2 = new Pendulum(new PVector(location.x - mass, location.y), 50, PI/2);
  } 
  
  void updatePendulum() {
   p1.setOrigin(new PVector(location.x + mass, location.y));
   p2.setOrigin(new PVector(location.x - mass, location.y));
 }

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
    p1.update();
    p2.update();
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
    fill(100);
    if (dragging) {
      fill(255);
    }
    ellipse(location.x,location.y,mass*2,mass*2);
    p1.display();
    p2.display();
  } 

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the mover
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      drag.x = location.x-mx;
      drag.y = location.y-my;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag(int mx, int my) {
    if (dragging) {
      location.x = mx + drag.x;
      location.y = my + drag.y;
    }
  }
}


