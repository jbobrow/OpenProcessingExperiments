
Particle p; // particle
PVector g; // gravity
PVector t; // tension
PVector c; // center
boolean cut = false;

void setup() {
  size(1000, 800);
  c = new PVector(width/2, height/2);
  p = new Particle(1, c.x + 200, c.y, 0, 10, color(255));
  g = new PVector(0, 0.5 * p.mass);
  background(0);
}

void draw() {
    fill(color(0, 256 / 4));
    rect(0, 0, width, height);
    // find tension
    t = PVector.sub(c, p.location);
    t.normalize();
    t.mult(p.velocity.mag() * p.velocity.mag());
    t.mult(p.mass);
    t.div(p.location.dist(c));
    t.sub(g.get());
    p.applyForce(g);
    if(!cut) {
        p.applyForce(t);
    }
    p.update();
    p.checkEdges();
    p.display();
    fill(color(255, 0, 0, 256 / 4));
    noStroke();
    ellipse(c.x, c.y, 20, 20);
    if(!cut) {
        stroke(color(255));
        line(c.x, c.y, p.location.x, p.location.y);
    }
}

void keyPressed() {
    if(!cut) {
        cut = true;
    }
    else {
        cut = false;
        c = new PVector(width/2, height/2);
      p = new Particle(1, c.x + 200, c.y, 0, 10, color(255));
      g = new PVector(0, 0.5 * p.mass);
    }
}

void mousePressed() {
    if(!cut) {
        cut = true;
    }
    else {
        cut = false;
        c = new PVector(width/2, height/2);
      p = new Particle(1, c.x + 200, c.y, 0, 10, color(255));
      g = new PVector(0, 0.5 * p.mass);
    }
}

class Particle {
    Particle(float m, float x, float y, float vx, float vy, color c_) {
        mass = m;
        location = new PVector(x, y);
        velocity = new PVector(vx, vy);
        acceleration = new PVector(0, 0);
        c = c_;
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
        fill(c);
        ellipse(location.x, location.y, mass * 20, mass * 20);
    }

    void checkEdges() {
        if(location.x > width) {
            location.x = width;
            velocity.x *= -1;
        }
        else if(location.x < 0) {
            location.x = 0;
            velocity.x *= -1;
        }
        if(location.y > height) {
            location.y = height;
            velocity.y *= -1;
        }
        else if(location.y < 0) {
            location.y = 0;
            velocity.y *= -1;
        }
    }

    PVector location, velocity, acceleration;
    float mass;
    color c;
};
