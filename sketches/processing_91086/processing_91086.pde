
ParticleSystem ps;

void setup() {
  size(400,400);
  ps = new ParticleSystem(width/2, height/2);
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();
}
class Particle {
  
  PVector location;
  PVector velocity;
  float lifespan;
  float a;
  float x0=0;
  float y0=0;

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    velocity = new PVector(random(-1, 1),random(-1, 1));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    x0 = map(sin(a), -1, 1, 50, width-50);
    y0 = map(cos(a), -1, 1, 50, height-50);
    float radius = dist(location.x,location.y,x0,y0);
    if(radius < 150){
      float angle = atan2(location.y-y0,location.x-x0);
        velocity.x -= (150 - radius) * 0.01 * cos(angle + (0.7 + 0.0005 * (150 - radius)));
        velocity.y -= (150 - radius) * 0.01 * sin(angle + (0.7 + 0.0005 * (150 - radius)));
    }
    location.x+= velocity.x*3;
    location.y+= velocity.y*3;
    velocity.mult(0.93);
    lifespan -= 0.05;
    a += 0.9;
    if (location.x > width) {
      velocity.x *= -1;
      location.x = width-1;
    }
    if (location.x < 0) {
      velocity.x *= -1;
      location.x = 1;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height-11;
    }
    if (location.y < 0) {
      velocity.y *= -1;
      location.y = 11;
    }
  }

  void display() {
    stroke(0,lifespan);
    strokeWeight(2);
    point(location.x,location.y);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


import java.util.*;

class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
    origin = new PVector(width/2,height/2);
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







