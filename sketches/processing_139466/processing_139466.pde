
void setup() {
  size(500, 400);
  background(255);
  balls = new Ball[num];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(balls, i);
  }
}

int num = 4;
Ball[] balls;

void draw() {
  background(255);
  for (Ball b : balls) {
    b.applyForce(new PVector(0, 0.2)); //gravity
    b.applyForce(new PVector(0.1, 0.0)); //wind
    b.collision();
    b.edges();
    b.move();
    b.display();
  }
}

class Ball {

  Ball[] others;
  int ballID;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float massDisplayFactor;
  float spring;
  float friction = -1;
  float diameter;


  Ball(Ball[] _others, int _ballID) {
    ballID = _ballID;
    others = _others;
    location = new PVector(random(width), random(height/4, height-(height/4)));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.5, 5);
    massDisplayFactor = 17;
    diameter = mass * massDisplayFactor;
    spring = 0.1;
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void collision() {
    //Kollision mit anderen Objecten
    for (int i = ballID+1; i < others.length; i++) {
      PVector d = new PVector(others[i].location.x - location.x, others[i].location.y - location.y);
      float defDist = sqrt(d.x*d.x + d.y*d.y);
      float minDist = others[i].diameter / 2 + diameter / 2;
      if (defDist < minDist) {
        float angle = atan2(d.y, d.x);
        PVector target = new PVector(location.x + cos(angle)*minDist, location.y + sin(angle)*minDist);
        PVector a = new PVector((target.x - others[i].location.x) * spring, (target.y - others[i].location.y) * spring);
        velocity.sub(a);
        others[i].velocity.add(a);
      }
    }
  }

  void edges() {
    //An Fenster abprallen
    if (location.x - diameter / 2 < 0) {
      location.x = diameter / 2;
      velocity.x *= friction;
    }
    if (location.x + diameter / 2 > width) {
      location.x = width - diameter / 2;
      velocity.x *= friction;
    }
    if (location.y  - diameter / 2< 0) {
      location.y = diameter / 2;
      velocity.y *= friction;
    }
    if (location.y + diameter / 2 > height) {
      location.y = height - diameter / 2;
      velocity.y *= friction;
    }
  }

  void display() {
    //Ball anzeigen
    strokeWeight(3);
    stroke(0);
    fill(#0072bc, 127);
    ellipse(location.x, location.y, mass*massDisplayFactor, mass*massDisplayFactor);
  }
}

