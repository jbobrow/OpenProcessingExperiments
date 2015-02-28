
// Simple class to represent a cube.  
// Each cube has a position, a rotation along each axis
// and a speed of rotation for each axis
// Each cube also has a color. 
class Cube {
  float x, y, z;
  float rX, rY, rZ;  
  float spinX, spinY, spinZ;
  color c;
  
  // Constructor
  Cube(float x, float y, float z) {
    // store this cube's starting position
    this.x = x;
    this.y = y;
    this.z = z;
    
    // random rotation speeds for every axis
    this.spinX = random(-0.05, 0.05);
    this.spinY = random(-0.05, 0.05);
    this.spinZ = random(-0.05, 0.05);
    
    // 10% probability to be orange
    if (random(100) < 10) this.c = color(240, 150, 32);
    else this.c = color(255);

    // note that we didn't touch rX, rY and rZ. We just assume
    // they will start at 0.
  }
  
  void display() {
    // pushMatrix() is important, since we are using translate/rotate.. we don't
    // a given cube's transformation to affect other things 
    pushMatrix(); 
    translate(x, y, z);
    rotateX(rX);
    rotateY(rY);
    rotateZ(rZ);
    fill(c);
    box(20);
    popMatrix();  
  }
  
  void update() {
    y -= 1;      // move up
    rX += spinX; // spin
    rY += spinY;
    rZ += spinZ;  
  }
  
}

