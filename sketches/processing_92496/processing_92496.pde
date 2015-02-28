
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass =1; 
  float rotation;   
  float spin;   
  float move;


  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, -2.9));
    rotation = random(0, 360);  
    spin = random(-5, 10);
    move = random(-100, 10);
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
    lifespan -= .3;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
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


float w=12;
float h=12;


class Ell extends Particle
{
  PVector velocity = new PVector(random(-3, 3), random(-2, -2.9));

  Ell(PVector l)
  {
    super(l);
  }
  void display()
  {   

    // velocity.y-=0.01;
    //image(snow,location.x,location.y,20,20);
    pushMatrix();
    translate(200, 0);
    fill(120, 0, 0, lifespan);
    stroke(0, lifespan);
    strokeWeight(2);
    ellipse(location.x, location.y, w/2, h);


    if (location.y>height-100-h/2-3)
    {  
      velocity.y=- velocity.y/1.3;
      ellipse(location.x, location.y+3, w, h/2);
    }
    if (location.y>height-100-h/2 || abs(velocity.x)<0.5 )
    {  
      velocity.x=0;
      location.y=height-100-h/2;
      lifespan=0;
      //ellipse(location.x, location.y, w, h);
    }
    popMatrix();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= .3;
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

    particles.add(new Snow(origin));
    particles.add(new Rec(origin)); 
    particles.add(new Ell(origin));
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

/*
class OtherParticleSystem extends ParticleSystem
 {
 OtherParticleSystem(float x, float y)
 {
 super(x, y);
 }
 
 void applyForce(PVector f) {
 PVector oh= new PVector(-f.x, -f.y);
 for (Particle p: particles) {
 p.applyForce(oh);
 }
 }
 }
 */
//OtherParticleSystem os;
ParticleSystem ps;
PImage snow;


void setup() {
  size(800, 400);
  snow=loadImage("snow.png");
  ps = new ParticleSystem(200, 50);
  // os = new OtherParticleSystem(width/2+100, 200);
}

void draw() {
  background(255);
  stroke(0);
  line(0, height-100, width, height-100);
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);  
  ps.addParticle();
  ps.run();

  //os.applyForce(gravity);  
  // os.addParticle();
  // os.run();
}

class Rec extends Particle
{
  float w=12;
  float h=12;


  Rec(PVector l)
  {
    super(l);
  }
  void display()
  {      
    fill(255);
    stroke(0);
    rotation+=spin;  
    pushMatrix();

    translate(location.x, location.y);
    rotate(radians(rotation)); 
    rect(0, 0, w, h);
    // println(velocity.y);

    popMatrix();
  }
}

class Snow extends Particle
{
  float w=12;
  float h=12;
  float mass =2;
  PVector velocity = new PVector(random(-2, 2), random(-4, -2.9)); 

  Snow(PVector l)
  {
    super(l);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= .3;
  }  

  void display()
  {   
    pushMatrix();
    // location.x+=10; 
    //translate(500+noise(100),0);
    translate(location.x+500+move, location.y-60);
    image(snow, 0, 0, w, h);
    // println(velocity.y);

    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }
}



