
node[] pendulum;
float segmentLength = 12;
float gravity = 0.01;
float springRate = 0.2;
float damping = 0.01;
void setup() {
  size(640, 480);
  pendulum = new node[32];
  for (int i=0; i<pendulum.length; i++) {
    pendulum[i] = new node(width/2+i*segmentLength, segmentLength);
  }
//  smooth();
//  background(255-64);
  background(255);
}
void draw() {
//  noStroke();
//  fill(255,2);
//  rect(0,0,width,height);
//  stroke(0);
  noFill();
  stroke(
  128+127*cos(frameCount%128*TWO_PI/128),
  128+127*cos(frameCount%128*TWO_PI/128+TWO_PI/3),
  128+127*cos(frameCount%128*TWO_PI/128+2*TWO_PI/3));
  pendulum[0].location = new PVector(width/2, segmentLength);
  pendulum[0].velocity = new PVector();
  beginShape();
  for (int i=0; i<pendulum.length; i++) {
    pendulum[i].update();
    curveVertex(pendulum[i].location.x, pendulum[i].location.y);
  }
  endShape();
  for (int i=0; i<pendulum.length-1; i++) {
    PVector relativeLocation = 
      PVector.sub(pendulum[i].location, pendulum[i+1].location);
    PVector relativeVelocity = 
      PVector.sub(pendulum[i].velocity, pendulum[i+1].velocity);
    float forceMagnitude = (relativeLocation.mag()-segmentLength)*springRate;
    relativeLocation.normalize();
    forceMagnitude += relativeVelocity.dot(relativeLocation)*damping;
    PVector force = PVector.mult(relativeLocation, forceMagnitude);
    pendulum[i+1].forceSum.add(force);
    pendulum[i].forceSum.sub(force);
//    line(pendulum[i].location.x, pendulum[i].location.y, 
//    pendulum[i+1].location.x, pendulum[i+1].location.y);
  }
}
class node {
  PVector location;
  PVector velocity;
  PVector forceSum;
  node(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector();
    forceSum = new PVector();
  }
  void update() {
    velocity.add(forceSum);
    location.add(velocity);
    forceSum = new PVector(0, gravity);
  }
}
void mousePressed(){
  pendulum = new node[32];
  for (int i=0; i<pendulum.length; i++) {
    pendulum[i] = new node(width/2+i*segmentLength, segmentLength);
  }
  background(255);
}


