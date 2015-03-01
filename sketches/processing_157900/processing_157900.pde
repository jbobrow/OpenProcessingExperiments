
Mover[] movers = new Mover[30];

void setup() {
  size(600, 500);
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,4),0,0);
  }
}

void draw() {
  background(255);
  
  
  PVector wind = new PVector(0.01,0);
  PVector gravity = new PVector(0,0.2);
  
  for (int i = 0; i < movers.length; i++) {
    
    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();  
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector gravity;
  
  float mass;
  
  Mover(float m, float x, float y) {
    
    mass = m;
    
    location = new PVector(x,y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(0,120);
    ellipse(location.x, location.y, mass*20, mass*20);
    
    stroke(255,0,0);
    fill(255,0,0,120);
    ellipse(location.x+50, location.y+80, mass*10, mass*10);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width-20;
      velocity.x = velocity.x *= -1;
    }else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
      }else if(location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
  




