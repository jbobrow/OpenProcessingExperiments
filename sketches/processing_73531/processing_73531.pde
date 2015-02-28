
// Set how many shapes will be drawn
int numCircles = 10, numTriangles = 3;

// Declare objects
Circle[] circle = new Circle[numCircles];
Tri[] tri = new Tri[numTriangles];

void setup() {
  // Set screen size
  size(600, 600);
  noStroke();
  smooth();

  // Initialise objects by passing random parameters to the classes
  for (int i=0;i<numCircles;i++) {
    circle[i] = new Circle(color(random(255), random(255), random(255)), random(width), random(height), random(-8, 8));
  }

  for (int j=0;j<numTriangles;j++) {
    tri[j] = new Tri(color(random(255), random(255), random(255)), random(width), random(height), random(width), random(height), random(width), random(height), random(-2, 2));
  }
}

void draw() {
  // Call class methods to animate and display the objects on screen
  for (int j=0;j<numTriangles;j++) {
    tri[j].animate();
    tri[j].display();
  }

  for (int i=0;i<numCircles;i++) {
    circle[i].animate();
    circle[i].display();
  }
}

/**
 * Class to define attributes and methods of circles
 *
 * @version 02-Oct-12
 */
class Circle {
  // Instance variables
  color c;
  float xPos;
  float yPos;
  float xSpeed;

  // Constructor for objects of Circle class
  Circle(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xPos = tempXpos;
    yPos = tempYpos;
    xSpeed = tempXspeed;
  }

  // Method to draw ellipse to screen using inputted parameters
  void display() {
    fill(0, 0, 0, 5);
    rect(0, 0, width, height);
    fill(c);
    ellipse(xPos, yPos, 20, 20);
  }

  // Method to move objects of the Circle class across the screen in the x axis
  void animate() {
    xPos = xPos + xSpeed;

    // Reverse direction of movement of objects if they hit the edge of the screen
    if (xPos > width) {
      xSpeed = xSpeed * (-1);
    }
    if (xPos < 0) {
      xSpeed = xSpeed * (-1);
    }
  }
}

/**
 * Class to define attributes and methods of triangles
 *
 * @version 05-Oct-12
 */
class Tri {
  // Instance variables
  color c;
  float xPos1;
  float yPos1;
  float xPos2;
  float yPos2;
  float xPos3;
  float yPos3;
  float ySpeed;

  // Constructor for objects of the Tri class
  Tri(color tempC, float tempXpos1, float tempYpos1, float tempXpos2, float tempYpos2, float tempXpos3, float tempYpos3, float tempYspeed) {
    c = tempC;
    xPos1 = tempXpos1;
    yPos1 = tempYpos1;
    xPos2 = tempXpos2;
    yPos2 = tempYpos2;
    xPos3 = tempXpos3;
    yPos3 = tempYpos3;
    ySpeed = tempYspeed;
  }

  // Method to draw triangle to screen using inputted parameters
  void display() {
    fill(0, 0, 0, 5);
    rect(0, 0, width, height);
    fill(c);
    triangle(xPos1, yPos1, xPos2, yPos2, xPos3, yPos3);
  }

  // Method to move objects of the Tri class across the screen in the y axis
  void animate() {
    yPos1 = yPos1 + ySpeed;
    yPos2 = yPos2 + ySpeed;
    yPos3 = yPos3 + ySpeed;

    // If a corner of the triangle hits the edge of the screen, redraw it at opposite
    // screen edge
    if (yPos1 > height) {
      yPos1 = 0;
    }
    if (yPos2 > height) {
      yPos2 = 0;
    }
    if (yPos3 > height) {
      yPos3 = 0;
    }

    if (yPos1 < 0) {
      yPos1 = height;
    }
    if (yPos2 < 0) {
      yPos2 = height;
    }
    if (yPos3 < 0) {
      yPos3 = height;
    }
  }
}

