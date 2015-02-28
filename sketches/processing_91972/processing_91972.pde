
import ddf.minim.*;
Minim minim;
AudioSample player;

ParticleSystem ps, ps2;
PImage particleImage, bg;
int nextTriggerTime = 0;
int lastTriggerTime = 0;

void setup() {
  minim = new Minim(this);
  player = minim.loadSample("test.mp3");

  size(800, 400);

  bg = loadImage("bg.jpg");
}


void startNewFireWork() {
  player.trigger();
  ps = new ParticleSystem(width/2, height);
  //ps2 = new ParticleSystem(50, height);
}

void draw() {

  println(millis()/1000);
  image(bg, 0, 0, 800, 400);

  int s = second();
  if (millis() > nextTriggerTime) {
    startNewFireWork();
    lastTriggerTime = millis();
    nextTriggerTime += 15000;
  }

  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.003);
  PVector upAcel = new PVector(0, -0.00005);
  PVector down = new PVector(0, 0.00005);




  if (millis() < lastTriggerTime+10000) { // < 5 secs have elapsed since firing
    ps.applyForce(upAcel);
   
  }
  else if (millis() > lastTriggerTime+8000) { // >  10 seconds elapsed since firing
    ps.applyForce(down);
     ps.applyForce(gravity);
    // ps.invisible(-1);
    // sideways + gravity
  }
  else // between 5 & 10 seconds since firing
  {
   // ps.applyForce(upAcel);
    ps.invisible(-1);


    // up-only, but invisible...
  }

  ps.addParticle();
  ps.run();
}

void stop()
{
  player.close();
  minim.stop();

  super.stop();
}

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan=200;
  float mass = 1; 
  float particleSize;
  PVector v1, v2;
  color c1, c2;
  int m = millis();
  int s = second();
  int nextTriggerTime = 0;
  int nextTriggerTime2 = 5;

  Particle(PVector l) {
    location= l.get();
    acceleration = new PVector(0, -0.05);
    lifespan = 255.0;

    c1 =color(155, 13, 50, 0);
    c2 =color(155, 13, 50, lifespan);
    v1 = new PVector(0, -0.9);
    v2 = new PVector(random(-0.35, 0.35), random(-.3, -.7)); 
    particleSize = 3;
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {


    if (location.y>height/2 ) // bottom
    {   
      v1.add(acceleration);
      location.add(v1);
    }
    else if (location.y<=height/2) // top
    { 
      // if (lifespan == 0) {
      particleSize += 0.03;
      ;
      lifespan-=0.5;
      //  lifespan = 255;

      //   else if (lifespan > 1)
      //   lifespan--;

      v2.add(acceleration);
      location.add(v2);

      //particleSize += random(-0.13, 0.23);
    }
    else {   // middle
      //  println(velocity);
      //v1.add(acceleration);
      location.add(v1);
      lifespan = 0;
    }
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void invisible(float i) {
    lifespan=i;
  }
  void display() {
    stroke(0, lifespan);
    //strokeWeight(0.2);
    fill(255, 185, 15, lifespan);
    ellipse(location.x, location.y, particleSize*(lifespan/255.0), particleSize*(lifespan/255.0));
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } 
    else {
      return false;
    }
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

  void addParticle() {
    particles.add(new Particle(origin));
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }

  void invisible(float i) {
    for (Particle p: particles) {
      p.invisible(i);
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




