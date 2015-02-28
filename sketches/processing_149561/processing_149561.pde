
/* This sketch is an implementation of example (1) in chapter 2.1
of Strogatz's nonlinear dynamics and chaos book
*/


// Initialize the grid
float dx, dy;
float xMin = -2*PI;
float xMax = 2*PI;
float yMin = -2*PI;
float yMax = 2*PI;

// set number of particles
int particleNum = 50;
// Initialize the particle array
Mover particle[] = new Mover[particleNum];


void setup() {
  size(512, 512);
  
  // set the sclae of the grid
  dx = (xMax - xMin) / width;
  dy = (yMax - yMin) / height;
  
  // fill the particle array
  for (int i = 0; i < particleNum; i++) {
  particle[i] = new Mover(random(xMin, xMax), random(yMin, yMax));
  }
}

void draw() {
  // Move the origin and set the background to black.
  background(0);
  translate(width/2, height/2);
    
  // run the algorithm
  for (int i = 0; i < particleNum; i++) {
    particle[i].update();
    particle[i].display();
  }
}


// Class for the moving particle
class Mover {
  
  // Use the PVector class for location and 
  // velocity of the particle
  PVector location;
  PVector velocity;
  
  color col;
  
  // Value to determine if the particle 
  // is resting on a fixed point
  float epsilon = pow(10, -5);
  
  Mover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    
    col = color(random(255), random(255), random(255), 128);
    
  }
  
  // update the location and velocity of the particle
  // based on the differential equation. We apply the same idea 
  // to the y direction as we do to the x direction
  void update() {
    velocity.x = dx*sin(location.x);
    velocity.y = dy*sin(location.y);
    
    location.x += velocity.x;
    location.y += velocity.y;
    
    // if the particle is at a fixed point give it a new random 
    // position
    if (velocity.x < epsilon && velocity.y < epsilon) {
      location = new PVector(random(xMin, xMax), random(yMin, yMax));
    }
  }
  
  // function to draw the particle on the grid
  void display() {
    noStroke();
    fill(col);
    ellipse(location.x / dx, location.y / dy, 16, 16);
  }
  
}


