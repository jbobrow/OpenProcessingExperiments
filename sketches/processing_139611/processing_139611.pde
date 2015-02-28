
Circle[] circles = new Circle [200]; // Array of 200 circles

void setup() {
  background(255);
  size(800, 600);
  smooth();
  for (int i = 0; i < circles.length; i++) { //declare the circles and pass in the their starting points 
    circles[i] = new Circle(mouseX, mouseY, random(.1, 1), random(.1, .5)); //and velocity values
  }
}

void draw() {
  background(255);
  fill(255, 10);
  for (int i = 0; i < circles.length; i++) { //For all the objects run functions in the class
    circles[i].drawCircle();
    circles[i].passEdges();
  }
}


class Circle {
  PVector circle = new PVector(0, 0); //make a vector for the circle
  PVector velocity = new PVector(0, 0); // make a vector for the velocity
  float r = random(255); //color random
  float g = random(255); //color random
  float b = random(255); //color random
  int circleSize = 25; //size of the circle
  int trans = 255; // initial value for transparency

  Circle(float tempX, float tempY, float tempVx, float tempVy) {
    circle.set(tempX, tempY, 0);
    velocity.set(tempVx, tempVy);
  }

  void drawCircle() {
    if (trans < 1) { // makes the circles flash together like a pulse
      trans = 255;
    }
    fill(r, g, b, trans); //passes the pulsing transparency and color to the circle
    noStroke();   

    PVector mouse = new PVector(mouseX, mouseY); //creates vector for the mouse
    mouse.sub(circle); 
    mouse.normalize();
    mouse.mult(5);
    mouse.mult(velocity.mag());  
    circle.add(mouse);
//the functions above essentially allows the circle vector to follow the mouse vector based on the velocity

    ellipse(circle.x, circle.y, circleSize, circleSize); //draws circles

    trans = trans - 10;
  }
  void passEdges() {
    if (circle.x > width) {
      circle.x = 0;
    }
    else if (circle.x < 0) {
      circle.x = width;
    }
    if (circle.y > height) {
      circle.y = 0;
    }
    else if (circle.y < 0) {
      circle.y = height;
    } //the function above makes it such that if the mouse passes over the width or height it wraps around
  }
}
//Inspiration video: http://vimeo.com/2481794
