
float spiralRate = TWO_PI/128;
float spiralDecay = 0.01;
float spawnRate = 0.01;
ArrayList spiralList;
int spawnLimit = 1000;
void setup() {
  size(800, 600);
  background(32);
  fill(0, 4);
  smooth();
  spiralList = new ArrayList();
  spiralList.add(new spiral(new PVector(width/2, height/2), 
  new PVector(1, 0), random(width/8, width/4), 1.0));
}
void draw() {
  noStroke();
  rect(0, 0, width, height);
  stroke(255);
  for (int i=spiralList.size ()-1; i>=0; i--) {
    spiral s = (spiral) spiralList.get(i);
    s.update();
    if (s.dead&&spiralList.size()>2) {
      spiralList.remove(i);
    } else if (s.dead&&spiralList.size()==1) {
      s = new spiral(new PVector(width/2, height/2), 
      new PVector(1, 0), random(width/8, width/4), 1.0);
    }
  }
}
class spiral {
  PVector location;
  PVector previousLocation;
  PVector direction;
  PVector center;
  float clockWise;
  float radius;
  float angle;
  boolean dead;
  color clr;
  spiral(PVector loc, PVector dir, float rad, float clock) {
    location = loc;
    direction = dir;
    radius = rad;
    clockWise = clock;
    angle = atan2(direction.y, direction.x)-clockWise*PI/2;
    PVector arm = new PVector(cos(angle), sin(angle));
    arm.mult(radius);
    center = PVector.sub(location, arm);
    clr = color(255);
  }
  spiral(spiral parent) {
    location = parent.location.get();
    direction = parent.direction.get();
    angle = parent.angle + PI;
    clockWise = -1*parent.clockWise;
    radius = random(0, width/8);
    PVector arm = new PVector(cos(angle), sin(angle));
    arm.mult(radius);
    center = PVector.sub(location, arm);
    float mutation = 32;
    float r = constrain(red(parent.clr)+random(-mutation,mutation),0,255);
    float g = constrain(green(parent.clr)+random(-mutation,mutation),0,255);
    float b = constrain(blue(parent.clr)+random(-mutation,mutation),0,255);
    clr = color(r,g,b);
  }
  void update() {
    previousLocation = location.get();
    angle += spiralRate*clockWise;
    radius *= 1-spiralDecay;
    dead = radius<2;
    PVector arm = new PVector(cos(angle), sin(angle));
    arm.mult(radius);
    location = PVector.add(center, arm);
    direction = PVector.sub(location, previousLocation);
    if (random(0, 1)<spawnRate&&spiralList.size()<spawnLimit) {
      spiralList.add(new spiral(this));
    }
    stroke(clr);
    line(previousLocation.x, previousLocation.y, 
    location.x, location.y);
  }
}



