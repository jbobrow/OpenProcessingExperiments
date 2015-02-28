
// code by Claus Rytter Bruun de Neergaard, March 2011
// (use of PVector learned from Daniel Shiffmann tutorial)

// GLOBAL VARIABLES ///////////////////////////////

int n = 7000;      // number of agents
float s = 7.0;     // maximum agent velocity

int count = 0;

Agent[] agents = new Agent[n];

// SETUP //////////////////////////////////////////

void setup() {
  size(670, 500);
  noFill();
  stroke(255);
  
  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent(); 
  }
  
}

// DRAW ///////////////////////////////////////////

void draw() {
  
  background(0);
  
  // calling functions of all of the objects in the array
  for (int i = 0; i < agents.length; i++) {
    agents[i].update();
    agents[i].edges();
    agents[i].display(); 
  }
}

// CLASS //////////////////////////////////////////

class Agent {

  PVector loc;
  PVector vel;
  PVector acc;
  float speed;

  Agent() {
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    speed = s;
  }

  void update() {

    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);  
    dir.normalize();                        
    dir.mult(0.15);                         
    acc = dir;                              

    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }
  
  void edges() {

    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    }  else if (loc.y < 0) {
      loc.y = height;
    }

  }

  void display() {
    point(loc.x, loc.y);
  }
  
}

