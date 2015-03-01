
class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  pathfinder() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1,2), random(-1,2));
    diameter = 8;
  }
  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/2);
    float newDiam = sqrt(area/2/PI)*2;
    diameter = newDiam;
    parent.diameter = newDiam;
  }
  void update() {
    if (diameter>0.8) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.1);
      velocity.add(bump);
      velocity.normalize();
      if (random(0, 1)<0.02) {
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    }
  }
}
pathfinder[] paths;
void setup() {
  size(800, 600);
  background(255);
  ellipseMode(CENTER);
  fill(0);
  noStroke();
  smooth();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
void draw() {
//fill(0, 10);
//rect(0,0,width,height);
  for (int i=0;i<paths.length;i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
  }
}
void mousePressed() {
  background(0);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}



