
// paramaters to determine shape and size of antlers
int   startR = 12;
float dTheta = .9;
float rRatio = .7;

void setup() {
  size(600, 400);
  background(0);
  ellipseMode(RADIUS);
  noStroke();
  moose(width/2, height, 0, startR);
}

void moose(int x, int y, float theta, int r) {
  pushMatrix();
  translate(x, y);
  rotate(theta);
  // head
  fill(210, 105, 30);  
  ellipse(0, -8*r, 6*r, 8*r);
  // ears
  triangle(-5*r, -6*r, -8*r, -12*r, -5*r, -12*r);
  triangle( 5*r, -6*r,  8*r, -12*r,  5*r, -12*r);
  fill(165, 42, 42);
  triangle(-6*r, -9*r, -7*r, -11*r, -6*r, -11*r);
  triangle( 6*r, -9*r,  7*r, -11*r,  6*r, -11*r);
  // nose
  fill(210, 180, 140);
  ellipse(0, -5*r, 5*r, 4*r);
  fill(165, 42, 42);
  ellipse(-2*r, -5*r, r, 2*r);
  ellipse( 2*r, -5*r, r, 2*r);
  // eyes
  fill(255);
  ellipse(-2*r, -12*r, 2*r, 2*r);
  ellipse( 2*r, -12*r, 2*r, 2*r);
  fill(0);
  ellipse(r, -11*r, r, r); 
  ellipse(-r, -11*r, r, r);
  popMatrix();
  // antlers
  int newR = int(r*rRatio);
  if((newR) >= 1) {
    float c = cos(theta);
    float s = sin(theta);
    moose(x + int(r*(14*s - 3*c)), y + int(r*(-14*c - 3*s)), theta - dTheta, newR);
    moose(x + int(r*(14*s + 3*c)), y + int(r*(-14*c + 3*s)), theta + dTheta, newR);
  }
}
