
Mover[] movers = new Mover[10];
 
Liquid liquid;
 
void setup() {
  size(640, 360);
  reset();
  // Create liquid object
  liquid = new Liquid(0, height/2, width, height/2, 0.3);
}
 
void draw() {
  background(255);
   
  // Draw water
  liquid.display();
 
  for (int i = 0; i < movers.length; i++) {
     
    // Is the Mover in the liquid?
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector drag = liquid.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(drag);
    }
 
    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);
    
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
   
  fill(0, 120);

  text("click mouse to reset",270,height/2);
   
}
 
void mousePressed() {
  reset();
}
 
// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.05, 3), 30+i*60, 0);
  }
}
  
 // Liquid class
 class Liquid {
   
  // Liquid is a rectangle
  float x,y,w,h;
  // Coefficient of drag
  float c;
 
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
   
  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;
    if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
      return true;
    } else {
      return false;
    }
  }
   
  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;
 
    // Direction is inverse of velocity
    PVector drag = m.velocity.get();
    drag.mult(-1);
     
    // Scale according to magnitude
    drag.setMag(dragMagnitude);
    return drag;
  }
   
  void display() {
    noStroke();
    fill(10,200,230,100);
    rect(x,y,w,h);
  }
 
}
 
class Mover {
 
  // location, velocity, and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
   
  // Mass is tied to size
  float mass;
 
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
 
  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }
 
  void update() {
     
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
   
  // Draw Mover
  void display() {
    noStroke();
    fill(0,1, 255, 30);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
   
  // Bounce off bottom of window
  void checkEdges() {
    if (location.y > height) {
      velocity.y *= -1;  // A little dampening when hitting the bottom
      location.y = height;
    }
  }
}



