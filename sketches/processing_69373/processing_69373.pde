
class Creator {
  PVector loc;
  PVector vel;
  PVector acc;
  float maxvel;
  int count =0;
  
  Creator (PVector _loc, PVector _vel, float _maxvel) {
    loc = _loc;
    vel = _vel;
    maxvel = _maxvel;
  }

  void run() {
    display();
    update();
    spawn();
    checkEdges();
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(loc.x, loc.y, 100, 100);
  }

  void update () {
    acc = new PVector (random(-5,5),random(-5,5));
    vel.add(acc);
    loc.add(vel);
    vel.limit(maxvel);
    acc.mult(0);
  }
  void spawn () {

    msystems.add(new moversystem(numMovers, new PVector(loc.x, loc.y), new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed))));
  
  }

  void checkEdges() {
    if (loc.x > width) {
      vel.x = vel.x*-1;
    }
    if (loc.x < 0) {
      vel.x = vel.x* -1;
    }
    if (loc.y < 0) {
      vel.y = vel.y*-1;
    }
    if (loc.y > height) {
      vel.y = vel.y*-1;
    }
  }
}


