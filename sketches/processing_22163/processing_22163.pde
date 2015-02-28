
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 14-15: Rotating many things using objects

// A Rotater class
class Rotater {
  
  float x,y;   // x,y location
  float theta; // angle of rotation
  float speed; // speed of rotation
  float w;     // size of rectangle
  
  Rotater(float tempX, float tempY, float tempSpeed, float tempW) {
    x = random(210, 300);
    y = random(100, 200);
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
       ellipseMode(CORNER);
    ellipse(0, 0, 0, 0);
    noStroke();
    fill(255, 40);
    // pushMatrix() and popMatrix() are called inside the class' display() method. 
    // This way, every Rotater object is rendered with its own independent translation and rotation!
    pushMatrix(); 
    translate(x,y);
    rotate(theta);
    ellipse(0,0,w,w);
    popMatrix();
  }
}


