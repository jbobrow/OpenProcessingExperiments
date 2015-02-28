
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker w;

void setup() {
  size(400,400);
  frameRate(30);

  // Create a walker object
  w = new Walker();

}

void draw() {
  background(255);
  // Run the walker object
  w.walk();
  w.render();
}


// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

// A random walker class!

class Walker {
  PVector loc;

  Walker() {
    loc = new PVector(width/2,height/2);
  }

  void render() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(loc.x,loc.y,40,40);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector vel = new PVector(random(-2,2),random(-2,2));
    loc.add(vel);
    
    // Stay on the screen
    loc.x = constrain(loc.x,0,width-1);
    loc.y = constrain(loc.y,0,height-1);
  }
}
