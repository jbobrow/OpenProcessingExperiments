
// An array of Rotater objects
class Rotater {
  
  float x,y;   // x,y location
  float theta; // angle of rotation
  float speed; // speed of rotation
  float w;     // size of rectangle
  float spin; // spin of the cube
  float r,g,b;
  
  Rotater(float tempX, float tempY, float tempSpeed, float tempW, float spin) {
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
    stroke(0);
    // pushMatrix() and popMatrix() are called inside the class' display() method. 
    // This way, every Rotater object is rendered with its own independent translation and rotation!
    pushMatrix(); 
    translate(x,y);
    rotate(theta);
    box(w,w,w);
    rotateZ(PI/spin);
    popMatrix();
  }
}


Rotater[] rotaters;

void setup() {
  size(400,400,P3D);
  
  rotaters = new Rotater[30];
  
  // Rotaters are made randomly
  for (int i = 0; i < rotaters.length; i++ ) {
    rotaters[i] = new Rotater(random(width),random(height),random(-0.1,.1),random(50),random(15));
    
  }
}

void draw() {
  background(255);
  
  // All Rotaters spin and are displayed
  for (int i = 0; i < rotaters.length; i++ ) {
    rotaters[i].spin();
    rotaters[i].display();
  }
}
