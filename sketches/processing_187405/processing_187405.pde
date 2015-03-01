
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[10];
//Attractor a; This was a pipe dream. I want to add an attractor at mouseX/Y
float windNoise = 100;

void setup() {
  size(600, 400);
  smooth();
  randomSeed(1);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }
   //a = new Attractor();
}

void draw() {
  background(0);

  for (int i = 0; i < movers.length; i++) {
//made PVectors in opposite directions
    PVector rightWind = new PVector(noise(windNoise)*.9, 0);
    PVector leftWind = new PVector(noise(windNoise)*-1.1, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    PVector antiGravity = new PVector(0, -0.1*movers[i].mass);

    float c = 0.05;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(c);
    movers[i].applyForce(gravity);
    movers[i].applyForce(friction);


//interactivity. Left key = left wind, right key = right wind, up=antigravity
    if (key == CODED) {
      if (keyCode == LEFT) {
        movers[i].applyForce(leftWind);
      } else if (keyCode == RIGHT) {
        movers[i].applyForce(rightWind);
      } else if (keyCode == UP) {
        movers[i].applyForce(antiGravity);
      }
    }
      movers[i].update();
      movers[i].display();
      movers[i].checkEdges();
    }
  }

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  //change the fill color with perlin noise
  float fillTime =200;
  float incr = 0.005;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    
    float noiseFill = 230*noise(fillTime);
    stroke(0);
    strokeWeight(2);
    fill(noiseFill, 200, 0, 150);
    ellipse(location.x, location.y, mass*20, mass*20);
    
    fillTime+=incr;
    
  }
 

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }
}




