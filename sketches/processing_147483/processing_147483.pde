
Ball cannonball = new Ball(140, 0, 0, 20);
float time = 0;
boolean stop;
PShape cannon;

void setup() {
  size(1400, 550);
  background(0);
  fill(255, 90);
  stroke(255);
  //noStroke();
  smooth();
  frameRate(100);
  //textAlign(CENTER);
  stop = false;
  
  /*cannon = createShape();
  cannon.beginShape();
  cannon.fill(70, 70, 255);
  cannon. */
}

void draw() {
  background(0);
  cannonball.update(time);
  if (stop != true) {
    time += 0.01;  
  }
  displayData();
}

void displayData() {
  int pos1 = 20;
  int pos2 = 180;
  int pos3 = 350;
  int pos4 = 530;
  int line1 = 20;
  int line2 = 43;
  int line3 = 66;
  fill(255, 128, 0);
  textSize(20);
  text("R(t) - Position", pos1, line1);
  text("x: " + round(cannonball.getX()) + " m", pos1, line2); 
  text("y: " + round(cannonball.getY()) + " m", pos1, line3); 
  
  text("Projectile info", pos2, line1);
  text("Vi = " + cannonball.getVi() + " m/s", pos2, line2);
  text("Theta = " + cannonball.getTheta() + " °", pos2, line3);
  
  text("Velocity info", pos3, line1);
  text("Vx = " + round(cannonball.getVx()) + " m/s", pos3, line2);
  text("Vy = " + round(cannonball.getVy()) + " m/s", pos3, line3);
  
  text("Other data", pos4, line1);
  text("Time = " + time + " s", pos4, line2);
  fill(255, 90);
}

class Ball {
  float vi, xi, yi;
  float x;
  float y;
  float theta;
  float time;
  
  Ball(float _vi, float _xi, float _yi, float _theta){
    vi = _vi;
    xi = _xi;
    yi = _yi;
    theta = _theta;  
  }
  
  void update(float t){
    if (x >= 0 && x <= width && y >= 0 && y <= height) {
      int radius = 200;
      x = vi * t * cos(radians(theta));
      y = vi * t * sin(radians(theta)) - 4.9 * pow(t, 2);
      ellipse(x + xi, mY(y + yi), 13, 13);
      time = t;
    }
    else { stop = true; }
  }
  
  float getVx() {
    return vi * cos(radians(theta));
  }
  
  float getVy() {
    return vi * sin(radians(theta)) - 9.8 * time;
  }
    
  float getX () { return x; }
  float getY () { return y; }
  float getVi () { return vi; }
  float getTheta() { return theta; }
  float getXi () { return xi; }
  float getYi () { return yi; }
  
}

float mX (float _value) {
  return map(_value, 0, width, width, 0);
}

float mY (float _value) {
  return map(_value, 0, height, height, 0);
}
