
Mover [] m = new Mover [200];
Attractor a;


void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mover();
  }
  a = new Attractor();
}

void draw() {
  background(255);
  background(0);
  a.update();
  a.display();
  for (int i = 0; i < m.length; i++) {
    m[i].update();
    if (m[i].isClose(a)) {
      PVector attraction = m[i].isAttracted(a);
      m[i].applyForce(attraction);
      for(int j = 0; j < m.length; j++) {
        for(int k = 0; k < m.length; k++) {
          if(j!=k) {
            PVector repulsion = m[j].isRepulsed(m[k]);
            m[j].applyForce(repulsion);
          }
        }
      }
    }
    float c = 0.1;
    PVector friction = m[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    m[i].applyForce(friction);
    m[i].bounce();
    m[i].display();
  }
}

class Attractor {
  PVector location;
  float xtime;
  float ytime;
  float mass = 1;
  float radius = 20;
  Attractor () {
    xtime = 0.0;
    ytime = 100;
    location = new PVector(width/2, height/2);
  }
  
  void update() {
    float increment = 0.01;
    location = new PVector(noise(xtime)*width, noise(ytime)*height);
    xtime+=increment;
    ytime+=increment;
  }
  
  void display() {
    stroke(0);
    fill(170, 100);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
}
class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius = 2;



  Mover () {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(100);
  }

  void update() {
    velocity.limit(5);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }


  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  boolean isClose(Attractor a) {
    PVector d = PVector.sub(location, a.location);
    float distance = d.mag();
    if (distance < radius + a.radius + 30) {
      return true;
    }
    else {
      return false;
    }
  }


  PVector isAttracted (Attractor a) {
    PVector force = PVector.sub(a.location, location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float g = 1;
    float magnitude = (g*mass*a.mass)/sq(distance);
    return force;
  }

  PVector isRepulsed(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    float g = 1;
    float magnitude = (g*mass*a.mass)/sq(distance);
    return force;
  }

  void display() {
    noStroke();
    smooth();
    fill(255, 210);
    ellipse(location.x, location.y, 2+ 8*(sin(location.x*2*PI/width - PI/2) + sin(location.y*2*PI/height - PI/2)), 2+ 8*(sin(location.x*2*PI/width - PI/2) + sin(location.y*2*PI/height - PI/2)));
  }


  void bounce() {
    if (location.x < 0 || location.x > width) {
      velocity.x*=-1;
      acceleration.x*=-1;
    }
    if (location.y < 0 || location.y > height) {
      velocity.y*=-1;
      acceleration.y*=-1;
    }
  }
}



