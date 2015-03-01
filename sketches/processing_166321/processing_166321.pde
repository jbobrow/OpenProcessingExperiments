
ArrayList lineArray;
ArrayList particles;

void setup() {
  size(600, 400);
  lineArray = new ArrayList();
  particles = new ArrayList();
}



void draw() {
  background(139);
  if (lineArray.size() > 1000) {
    lineArray.clear();
  }
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < lineArray.size (); i++) {
    line l = (line) lineArray.get(i);
    l.move();
    fill(206, 29, 29, random(200));
    vertex(l.x, l.y);
  }
  endShape();
  
  
  particles.add(new Particle());
  for (int i = 0; i < particles.size (); i++) {
    Particle p = (Particle) particles.get(i);
    PVector gravity = new PVector(0, 0.5*p.mass); 
    float c = 0.2;
    PVector friction = p.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    p.applyForce(gravity);
    p.applyForce(friction);
    p.update();
    p.display();
    p.checkEdge();
  }
}

void mousePressed() {
  noStroke();
  lineArray.add(new line(mouseX, mouseY));
}

void mouseDragged() {
  stroke(200);
  strokeWeight(1);
  lineArray.add(new line(mouseX, mouseY));
}

//void mouseReleased() {
//
//}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Particle() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.2, 1);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }


  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {

    noStroke();
    fill(200);
    rect(location.x, location.y, mass*5, mass*6);
  }

  void checkEdge() {
    if (location.x > width) {
      velocity.x *= -1;
      location.x = width;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }
  }
}


class line {
  float x, y;

  line(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void move() {
    x+=random(-1.5, 0.5);
  }
}



