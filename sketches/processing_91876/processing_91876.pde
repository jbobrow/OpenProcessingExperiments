
//Draw 
Line[] line = new Line[30];
ParticleSystem ps;
float t = 0;
 
void setup() {
  size(600, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
  ps = new ParticleSystem(width/2, height/2);
  background(39);
 
  rectMode(CENTER);
 
  for (int i = 0; i < line.length;i++) {
    line[i] = new Line();
  }
}
 
void draw() {
  noStroke();
  fill(0, 20);
  rect(width/2, height/2, width, height);
 rect(0, 0, width, height);
  ps.origin.x=mouseX;
  ps.origin.y=mouseY;
  PVector gravity = new PVector(0, -0.05);
  ps.applyForce(gravity);
  ps.addParticle();
  ps.addParticle();
  ps.addParticle();
  ps.addParticle();
  ps.addParticle();
  ps.addParticle(); 
  ps.addParticle();
  ps.addParticle();
  ps.addParticle(); 
  ps.addParticle();
  ps.addParticle();
  ps.addParticle(); 

  for (int i = 0; i < line.length;i++) {
    line[i].display();
    line[i].move();
  }
    ps.run();

 
}
 
class Line {
  float x;
  float y;
  float speed;
  float rect_w;
  float rect_h;
  float hue;
 
  Line() {
    if (random(1) >= 0.5) {
      speed = 1.5;
    }
    else {
      speed = -1.5;
    }
 
    rect_w = random(1, 5);
    rect_h = random(220, 280);
 
    x = random(width);
    y = random(height);
 
    hue = 0;
  }
 
  void display() {
    noStroke();
    fill(hue, 100, 100, 50);
    rect(x, y, rect_w, rect_h);
 
    hue++;
    if (hue > 360) {
      hue = 0;
    }
  }
 
  void move() {
    x += speed;
    if (x > width + rect_w/2  || x < -rect_w/2) {
      rect_w = random(1, 5);
      rect_h = random(220, 280);
      y = random(width);
 
      if (speed > 0) {
        x = - rect_w/2;
      }
      else {
        x = width+rect_w/2;
      }
    }
  }
}

class Particle {
  PVector location;
  PVector acceleration;
  PVector velocity;
 
  float life;
  float mass = 1;
  float yellow = 255;
  float red = 255;
 
  Particle(PVector loc) {
    location = loc.get();
    life = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-3, 3), random(-2, 0));
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    life -= 2.0;
  }
 
  void display() {
    stroke(red, yellow, 0);
    point(location.x, location.y);
    yellow -= 5;
  }
 
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
   
   void fireGrav(PVector FGrav) {
       
    if (life < 200) {
      PVector fire = new PVector(0, mouseY);
      velocity.add(fire);
    }
  }
 
  void run() {
    update();
    display();
  }
 
  boolean isDead() {
    if (life < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
}
 
 
//particleSystem Class
import java.util.*;
 
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
 
  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
 
    particles = new ArrayList<Particle>();
  }
 
  void addParticle() {
    particles.add(new Particle(origin));
  }
 
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
   
 
  void run() {
    for (int i = particles.size()-1; i > 0; i--) {
      Particle p = particles.get(i);
      p.run();
 
      if (p.isDead()) {
        particles.remove(p);
      }
    }
  }
}

