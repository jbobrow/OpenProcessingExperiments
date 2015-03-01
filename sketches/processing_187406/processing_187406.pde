
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

PVector wind;
float changeby;

Mover[] movers = new Mover[5]; // creating an array with 5 Mover objects

void setup() {
  size(800, 600); // declaring size of screen
  randomSeed(1);  // begin program with same random number

  for (int i = 0; i < movers.length; i++) { // assigning mover arrays with new Movers
    movers[i] = new Mover(random(5, 12),random(0, width), 0); // random mass from 5-12, random width from 0 to width of screen, y-position is 0
  }
  
   wind = new PVector(2.5, 0); // creating PVector for wind
   changeby = wind.x; // on change altering the value of wind by 2.5
}


void draw() {
 background(0); // setting background as black
 
 for (int i = 0; i < movers.length; i++) { // draring arrays for the movers
 
    float moverMass = movers[i].mass; // create floating mass values

    PVector gravity = new PVector(0, 0.1*movers[i].mass); // create a new PVector for gravity
    
    float c = 0.05;
    PVector friction = movers[i].velocity.get(); // setting friction
    friction.mult(-1); // make friction opposite of current velocity (decelerate)
    friction.normalize(); // setting magnitude of friction to 1
    friction.mult(c); // scaling friction vector by 5%
 
    movers[i].applyForce(friction); // apply friction on start
    // movers[i].applyForce(wind); we do not want to apply wind on start of program
    movers[i].applyForce(gravity); // apply gravity on start

    movers[i].update(); // apply motion to each mover
    movers[i].display(); // apply color attributes to each mover
    movers[i].checkEdges(); // make sure each mover is within boundaries
  }
 
 
  if (keyPressed) { // do something on key press
    
    if(key=='d') // on pressing 'd' apply wind towards right (from left to right)
    {
      for (int i = 0; i < movers.length; i++) {
        wind.x= 10*(changeby/movers[i].mass);
        movers[i].applyForce(wind);
      }
    }   
    
    if(key=='a') // on pressing 'a' apply wind towards left (from right to left)
    {
      for (int i = 0; i < movers.length; i++) {
        wind.x = -10 * (changeby/movers[i].mass);
        movers[i].applyForce(wind);
      }
    } 
  }
}

void mousePressed(){ // refresh screen on mouse press
  setup();
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover { // attributes/variables of the movers
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color rgb;
 
  Mover(float m, float x, float y) { // constructor
    mass = m; // mass of the movers
    location = new PVector(x,y); // location of the movers
    velocity = new PVector(0,0); // velocity of the movers
    acceleration = new PVector(0,0); // accelration of the movers
    rgb = color(255,255,255); // color of the movers
  }
  
  void applyForce(PVector force) { // defining force
    PVector f = PVector.div(force, mass);
//    PVector f = new PVector (0,0);
//    force.div(mass);
//    acceleration.add(force);
    acceleration.add(f);
  }
  
  void update() { // defining the motion(s) of the movers
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() { // defining display for the movers (ellipses)
    stroke(0);
    strokeWeight(1);
    fill(rgb);
    ellipse(location.x, location.y, 10*mass, 10*mass);
  }
 

  void checkEdges() { // make sure the movers stay within the limits of the screen
    if (location.x > width) { // if x-location of movers exceeds width make it bounce back
      location.x = width;
      velocity.x *= -1;
      rgb = color(random(0,255),random(0,255),random(0,255));
      display();
    }
 
     if (location.x < 0) { // if x-location of movers goes below 0 make it bounce back
      location.x = 0;
      velocity.x *= -1;
      rgb = color(random(0,255),random(0,255),random(0,255));
      display();
    }
 
    if (location.y > height) { // if y-location of movers exceeds height make it bounce back
      location.y = height;
      velocity.y *= -1;
    }
  }
}


