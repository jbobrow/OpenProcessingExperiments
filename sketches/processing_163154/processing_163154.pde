
Mover[] movers;
//PImage fader;

void setup() {
  size(960, 540);
  //background(50);
  //fader = get();
  movers = new Mover[100];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10, 15), random(width), random(height));
  }
  //background(255);
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  //blend(fader,0,0,width,height,0,0,width,height,ADD);
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;
  float G;


  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    G = 0.4;
  }

  void update() {
    velocity.add(acceleration);
    velocity.x = constrain(velocity.x,-10.0,10.0);
    velocity.y = constrain(velocity.y,-10.0,10.0);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  } 

  void display() {
    noStroke();
    fill(map(velocity.x,-10.0,10.0,255,0));
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0){
      location.y = height;
    }
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strenght = (G * mass * m.mass) / (distance * distance);
    force.mult(strenght);

    return force;
  }
}



