

SpinSpots spots, spots2;
 SpinArm arm, arm2, arm3, arm4;
void setup() {
size(400, 400);
smooth();
arm = new SpinArm(width/HALF_PI, height/2, 100);
arm2 = new SpinArm(width/2, height/2, 10);
arm3 = new SpinArm(width*2, height/2, .02);
arm4 = new SpinArm(width/2, height/2, 10);
spots = new SpinSpots(width/HALF_PI, height/PI, -0.2, 100.0);
spots2 = new SpinSpots(width*10, height*2, -.001, 10.0);
}
void draw() { 
background(200, 90, 204); 
arm.update(); 
arm.display(); 
spots.update(); 
spots.display();
}

class SpinSpots extends Spin {
  float dim;
  SpinSpots(float x, float y, float s, float d) {
    super(x, y, s);
    dim = d;
}
  void display() {
    stroke(20, 250, 200, 200);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    ellipse(-dim/2, 0, dim, dim);
    ellipse(dim/2, 0, dim, dim);
    //ellipse(dim/PI, HALF_PI, x*2, dim);
    popMatrix();
} 
}


class Spin {
  float x, y, speed;
  float angle = 0.0;
  Spin(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
}
  void update() {
    angle += speed;
} 
}

class SpinArm extends Spin {
  SpinArm(float x, float y, float s) {
    super(x, y, s);
}
  void display() {
    strokeWeight(1);
    stroke(0);
    pushMatrix();
    translate(x, y);
    angle += speed;
    rotate(angle);
    line(0, 0, 100, 0);
    popMatrix();
}
}


