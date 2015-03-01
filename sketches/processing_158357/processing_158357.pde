
int num = 1;
Particle[] particles = new Particle[num];
float noiseScale=500, noiseStrength=1;

void setup() {
  size(800, 600);
  noStroke();
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height), 2);
    float angle = random(TWO_PI);
    PVector dir = new PVector(cos(angle), sin(angle));
    float speed = random(.5, 2);
    particles[i]= new Particle(loc, dir, speed);
  }
}

void draw() {
  //background(0);
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  fill(255);  
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
}

class Particle {

  PVector loc, dir, vel;
  float speed;
  int d=1; // direction change
  color col;

  Particle(PVector _loc, PVector _dir, float _speed) {
    loc = _loc;
    dir = _dir;
    speed = _speed;
  }

  void run() {
    move();
    checkEdges();
    update();
  }

  void move() {
    float angle=noise(loc.x/noiseScale, loc.y/noiseScale, frameCount/noiseScale)*TWO_PI*noiseStrength;
    dir.x = cos(angle);
    dir.y = sin(angle);
    vel = dir.get();
    vel.mult(speed*d);
    loc.add(vel);
  }

  void checkEdges() {
    //float distance = dist(width/2, height/2, loc.x, loc.y);
    //if (distance>150) {
    if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) {    
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }

  void update() {
    fill(255);
    ellipse(loc.x, loc.y, loc.z, loc.z);
  }
}

void keyPressed() {
  saveFrame("image-###.gif");
}
