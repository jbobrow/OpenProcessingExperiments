
class Breathing {
  // Use orcillation values as a size of an ellipse
  float x, y;
  float rad;
  float theta;    // Angle for oscillate
  float dtheta;   // Increment
  
  Breathing() {
    x = random(width);
    y = random(height);
    rad = random(6, 24);
    theta = random(PI);
    dtheta = random(0.01, 0.1);
  }
  
  void breath() {
    theta += dtheta;
  }
  
  void display() {
    float r = rad + rad*(sin(theta) + 1);
    fill(127, 100);
    stroke(255);
    ellipse(x, y, r, r);
  }
}

