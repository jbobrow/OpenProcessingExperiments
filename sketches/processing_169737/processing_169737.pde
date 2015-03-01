
float gravity = 0.01;
float elasticity = 0.1;
float damping = 0.1;
float viscosity = 0.00001;
float orbitSpeed = 18;
float sphereSize = 2;
body[] bodies;
void setup() {
  size(800, 600, P3D);
  bodies = new body[35];
  reset();
  noStroke();
  fill(255);
}
void draw() {
  background(64);
  lights();
  translate(width/2, height/2);
  rotateX(PI/3);
  for (int i=0; i<bodies.length; i++) {
    bodies[i].update();
    pushMatrix();
    translate(bodies[i].location.x, bodies[i].location.y, bodies[i].location.z);
    sphere(bodies[i].radius);
    popMatrix();
  }
  for (int i=1; i<bodies.length; i++) {
    for (int j=0; j<i; j++) {
      PVector Force = bodies[i].forceField(bodies[j]);
      bodies[j].forceSum.add(Force);
      bodies[i].forceSum.sub(Force);
    }
  }
}
class body {
  PVector location;
  PVector velocity;
  PVector forceSum;
  float radius;
  float mass;
  body() {
//    location = PVector.mult(PVector.random3D(), width/2);
//    velocity = PVector.mult(PVector.random3D(),3);
    float angle = random(0,TWO_PI);
    float trajectoryAngle = angle + PI/2;
    float orbit = sqrt(random(0,1))*width/2;
    float speed = sqrt(1/orbit)*orbitSpeed;
    location = new PVector(orbit*cos(angle),orbit*sin(angle));
    velocity = new PVector(speed*cos(trajectoryAngle),speed*sin(trajectoryAngle),0.1*random(-1,1));
    forceSum = new PVector();
    radius = random(1, 10)*sphereSize;
    mass = PI*4/3*pow(radius,3);
  }
  void update() {
    forceSum.mult(1/mass);
    velocity.add(forceSum);
    velocity.mult(1-viscosity);
    forceSum = new PVector();
    location.add(velocity);
  }
  PVector forceField(body partner){
    PVector relativeLocation = PVector.sub(partner.location,location);
    float distance = relativeLocation.mag();
    relativeLocation.normalize();
    float touchDistance = radius+partner.radius;
    float gravitationalForce = 0;
    float elasticForce = 0;
    float dampingForce = 0;
    if(distance>touchDistance){
      gravitationalForce = gravity*mass*partner.mass/sq(distance);
    }else{
      gravitationalForce = gravity*mass*partner.mass*distance/pow(touchDistance,3);
      elasticForce = min(mass,partner.mass)*(touchDistance-distance)*elasticity;
      PVector relativeVelocity = PVector.sub(partner.velocity,velocity);
      float normalVelocity = relativeLocation.dot(relativeVelocity);
      dampingForce = min(mass,partner.mass)*normalVelocity*damping;      
    }
    relativeLocation.mult(elasticForce-gravitationalForce-dampingForce);
    return relativeLocation;
  }
}
void reset(){
  for (int i=0; i<bodies.length; i++) {
    bodies[i] = new body();
  }
  neutralizeMomentumSum();
}
void mousePressed(){
  reset();
}
void neutralizeMomentumSum(){
  PVector sum = new PVector();
  float massSum = 0;
  for (int i=0; i<bodies.length; i++) {
    sum.add(PVector.mult(bodies[i].velocity,bodies[i].mass));
    massSum += bodies[i].mass;
  }
  for (int i=0; i<bodies.length; i++) {
    bodies[i].forceSum.sub(PVector.mult(sum,bodies[i].mass/massSum));
  }
}


