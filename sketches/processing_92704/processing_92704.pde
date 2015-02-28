
class  Particle2 extends Particle {  //red
  Particle2(PVector l) {

    super(l);
  }

  void display() {

    pushMatrix();
    translate(location.x+50, location.y-50);
    stroke(0, lifespan);

    fill(200, 0, 0, lifespan);  
    rotate(rads*2);
     rect(0, 0, 20, 20);

      popMatrix();
    }

  }

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  float i;

  float rads = radians(frameCount); 

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 2), random(-2, 0));
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

  void display() {   //blue
    pushMatrix();
    translate(location.x, location.y);
    stroke(0, lifespan);
    strokeWeight(2);
    fill(0, 0, 200, lifespan);
    rotate(rads);

    rect(0, 0, 40, 40);

    if (location.y>=height-5) {

      float a=random (0.1, 0.5);
      for (i=1;velocity.y>0;i--) {

        velocity.y= -velocity.y*i;

      }}
          popMatrix();
      }

      // Is the particle still useful?
      boolean isDead() {
        if (lifespan < 0.0) {
          return true;
        } 
        else {
          return false;
        }
      }
    }

class  Particle3 extends Particle { //pink

  Particle3(PVector l) {
    super(l);
  }
  
  void display() {
          pushMatrix();
      translate(location.x, location.y);
    stroke(0, lifespan);
    strokeWeight(2);
    fill(255,10, lifespan); 
    rotate(rads*2);
 rect(0, 0, 40, 40);


    if (location.y>=height-5) {

      float a=random (0.1, 0.5);
      for (i=1;velocity.y>0;i--) {

        velocity.y= -velocity.y*i;

      }}


      popMatrix();

}
    
  }
  

import java.util.*;

class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
  }

  void addParticle(Particle p) { //p=variable ..
    particles.add(p);
    //particles.add(new Particle2(origin));
    //particles.add(new Particle y(origin));
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



ParticleSystem[] ps =  new ParticleSystem[2];

void setup() {
  size(600, 400);
//frameRate(10);
  ps[0]= new ParticleSystem(width/2, 150);
 // ps[1] = new NewPs(width/2+100, 250);
}

void draw() {
  background(0);

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  
 
  
    ps[0].applyForce(gravity); // the par = f 

    if (frameCount % 10 == 0) 
      ps[0].addParticle(new Particle2(ps[0].origin));
    else
      ps[0].addParticle(new Particle(ps[0].origin));
   ps[0].addParticle(new Particle3(ps[0].origin));
    ps[0].run();
  
}



