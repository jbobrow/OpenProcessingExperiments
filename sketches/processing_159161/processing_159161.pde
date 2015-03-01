
//Thank you Asher Salomon for the code 
class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  pathfinder() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, 0);
    diameter = 15;
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
    if (diameter>0.5) {
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

float r;
float g;
float b;
float a;

void setup() {
  size(800, 600);
  background(5,2,0);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
void draw() {
 r = random(255);
 g = random(83);
 b = random(13);
 a = random(180);
 fill(r,g,b,a);
  for (int i=0;i<paths.length;i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
   }
}
void mousePressed() {
  background(5,2,0);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}



