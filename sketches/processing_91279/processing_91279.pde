
ParticleSystem ps;
PImage p;
PImage pic;

int Scale = 50;
int cols, rows;

  PVector gravity = new PVector(0, 0.2);
void setup() {
  size(800, 400);
frameRate(12.5);

  cols = width/Scale;
  rows = height/Scale;

  p = loadImage("curve1.png");
    pic = loadImage("curve2.png");
  ps = new ParticleSystem(width/2, 50);//50
}

void draw() {
  
 // background(0);
  fill(0);
  //fill(random(0,mouseX));
  //fill(0);
  //rect(0, 0, width, height);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      int x = i*Scale;
      int y = j*Scale;

      stroke(random(0, 200));
      rect(x, y, Scale, Scale);
    }
  }


  // Apply gravity force to all Particles

  ps.applyForce(gravity);

  ps.addParticle();
  ps.run();
}

class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; //1

  Particle(PVector l) {
    location =new PVector(random(width),random(height)); 
    //location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.5);
velocity = new PVector(random(-1, 2),random(-2, 0));
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
   /// stroke(0,lifespan);
   // strokeWeight(2);
    //fill(127,lifespan);
    //ellipse(location.x,location.y,12,12);
 //  translate(10, 10);
    rotate(PI/3.0);
    //tint(255, random(80,150));
    image(p, location.x,location.y,100,100);
    image(pic, location.x,location.y,100,100);

    
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) { //0.0
      return true;    } else {
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







