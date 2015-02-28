
ParticleSystem ps;

void setup() {
  size(800, 400);
  ps = new ParticleSystem(width/2, 50);
  smooth();
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  move();

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);

  ps.addParticle();
  ps.run();
}

int n = 100;

int mk = 0;
float[] mx = new float[n]; 
float[] my = new float[n]; 
float[] msx = new float[n]; 
float[] msy = new float[n]; 
float ma = 0;
float mcx = 80;
float mcy = 60;

void move()
{
  {
    for (int i=0; i<n; i++)
    {
      fill(255);
      ellipse(mx[i], my[i], 5, 5);
      mx[i] += msx[i];
      my[i] += msy[i];
      translate(mcx, mcy);
      rotate(ma - PI/2);
    }

    {
      mx[mk] = mouseX;
      my[mk] = mouseY;
      msx[mk] = random(-0.5, 0.5);
      msy[mk] = random(-0.5, 0.5);
      mk++;
      if (mk == n) { 
        mk = 0;
      }

      float mdx = mouseX - mcx;
      float mdy = mouseY - mcy;
      ma = atan2(mdy, mdx);
      mcx += mdx * 0.005;
      mcy += mdy * 0.005;
      translate(mcx, mcy);
      rotate(ma - PI/2);
    }
  }
}
class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 0.5; 
  PImage img = loadImage("star.png");

  Particle(PVector l) {
    location = l.get();
    lifespan = 200.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1),random(-5, 0));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(random(0.5));
    lifespan -= 1.5;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
    image(img, location.x, location.y, 10, 10);
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
  }
  
  // A function to apply a force to all Particles
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







