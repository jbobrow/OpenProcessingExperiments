
Circle[] myCircles; 

void setup() {
  size(600, 400);
  noStroke();
  
  // Creates an array for storing circle objects
  myCircles = new Circle[2]; 
    
  // Creates the actual circle objects
  for (int i = 0; i < myCircles.length; i++)
    myCircles[i] = new Circle();
}

void draw() {
  fill(255, 200);
  rect(0, 0, width, height);
  
  for (Circle c : myCircles) {
    c.display();
    c.update();
  } 
 
}





// *************** Change Circle Behavior *****************
// INSTEAD, CREATE Circle OBJECTS IN THE ABOVE CODE.
// A lot of credit for this code goes to Daniel Shiffman,
// from his book, "The Nature of Code".
// Defines the Circle class.  Don't modify this code.
// (Or, modify it after you leave class.)
class Circle {
  float rad;
  PVector location;
  PVector velocity;
  PVector acceleration;
  color col;

  // Constructs a circle with a random size,
  // initialy located in the center of the screen
  Circle() {
    rad = random(20);
    col = color(random(256), random(256), random(256), 100);
    // These floats aren't used, but could be used
    // to define the starting location of the circle
    //float x = rad + .1 + random(width - 2 * rad - .2);
    //float y = rad + .1 + random(height - 2 * rad - .2);
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-7,7), random(-7,7));
    acceleration = new PVector(.01, .1);
  }

  // Constructs a circle in a specified location, with
  // a random size.
  Circle(float x, float y) {
    rad = random(5);
    col = color(random(256), random(256), random(256));
    location = new PVector(x, y);
    velocity = new PVector(random(20), random(5));
    acceleration = new PVector(0, 0.1);
  }

  // Adjust the velocity and location
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    checkEdges();
  }

  // Check for collisions:
  void checkEdges() {
    if ((location.x >= width - rad - .1 && velocity.x > 0) || 
        (location.x <= rad && velocity.x < 0)) {
      velocity.x *= -1;
    }
    if ((location.y >= height - rad - .1 && velocity.y > 0) || 
        (location.y <= rad && velocity.y < 0)) 
      velocity.y *= -1;
  }

  // Display the circle
  void display() {
    stroke(0);
    fill(col);
    ellipse(location.x, location.y, 2*rad, 2*rad);
  }
}

