
// forked Learning Daniel Shiffman's Example 14-15 in learningprocessing.com

// A Rotater class
Rotater[] rotaters;

PShape star;

void setup() {
  size(800,800);
  
  rotaters = new Rotater[40];
  
  // Rotaters are made randomly
  for (int i = 0; i < rotaters.length; i++ ) {
    rotaters[i] = new Rotater(random(width),random(height),random(-0.1,0.1),random(20));
  }
}

void draw() {
  background(0);
  
  // All Rotaters spin and are displayed
  for (int i = 0; i < rotaters.length; i++ ) {
    rotaters[i].spin();
    rotaters[i].display();
  }
}

class Rotater {
  
  float x,y;   // x,y location
  float theta; // angle of rotation
  float speed; // speed of rotation
  float w;     // size of rectangle
  
  Rotater(float tempX, float tempY, float tempSpeed, float tempW) {
    x = tempX;
    y = tempY;
    // Angle is always initialized to 0
    theta = 0; 
    speed = tempSpeed;
    w = tempW;
  }
  
  // Increment angle
  void spin() {
    theta += speed;
  }
  
  // Display rectangle
  void display() {
    rectMode(CENTER);
    // pushMatrix() and popMatrix() are called inside the class' display() method. 
    // This way, every Rotater object is rendered with its own independent translation and rotation!
    pushMatrix(); 
    translate(x,y);
    rotate(theta);
    stroke(random(255), random(255), random(255), random(255));
    fill(random(255), random(255), random(255), random(255));
    scale(random(1.5));
    strokeWeight(2);
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape(CLOSE);
    popMatrix();
  }
}



