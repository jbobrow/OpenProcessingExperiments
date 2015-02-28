
class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  float r = random(-1,1);
  float t = random(1.1,1.5);
 float cr =  random(255);
  float cg =  random(255);
   float cb =  random(255);

  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
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
    if (location.y>height) { 
    velocity.y=-velocity.y/t; 
    
  } 
    lifespan -= 2.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  void display() {
     pushMatrix();   
 if (location.y>0 && location.y<=height-10) {
      stroke(255, lifespan);
    strokeWeight(2);
    fill(cr,cg,cb, lifespan);
      ellipse(location.x, location.y, 12, 12);
  
      
    }
    else {
   
      ellipse(location.x, location.y, 12, 12);
     
    }
  
   if (location.y>height-10 && location.y<height) {
  
    ellipse(location.x, location.y, 14, 10);
  
  }
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

class Particle2 extends Particle
{

  Particle2(PVector l) {
    super(l);

  }

 



  void display() {
  
  pushMatrix();

 
    
  translate(location.x,location.y);
  rotate(radians(frameCount*r));


 line(0,0,10,10);
  line(10,0,0,10);
    popMatrix();    
       
    
  }
}
class Particle3 extends Particle
{

  Particle3(PVector l) {
    super(l);

  }

 



  void display() {
  pushMatrix();

 
    
  translate(location.x,location.y);
  rotate(radians(frameCount/1*r));


 rect(0,0,10,10);

    popMatrix();    
       
    
  }
}
class Particle4 extends Particle
{

  Particle4(PVector l) {
    super(l);

  }

 



  void display() {
    
  pushMatrix();

 
    
  translate(location.x,location.y);
  rotate(radians(frameCount/1*r));


 line(0,0,10,0);
 line(5,8.66,10,0);
 line(0,0,5,8.66);

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

  void addParticle() {
    particles.add(new Particle(origin));
     particles.add(new Particle2(origin));
     particles.add(new Particle3(origin));
     particles.add(new Particle4(origin));
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
class ParticleSystem2 extends ParticleSystem {


  ParticleSystem2(float x, float y) {
    super(x, y);
  }

  void applyForce(PVector f) {
    PVector f1 = new PVector (-f.x,-f.y);
    for (Particle p: particles) {
      p.applyForce(f1);
    }
  }
    
}

class ParticleSystem3 extends ParticleSystem {


  ParticleSystem3(float x, float y) {
    super(x, y);
  }
 
  void applyForce(PVector f) {
    PVector f1 = new PVector (-f.x*(cos(frameCount/10)),-f.y*(cos(frameCount/10)));
    for (Particle p: particles) {
      p.applyForce(f1);
    
    }
  }
    
}

//ParticleSystem ps;
//ParticleSystem2 ps2;
ParticleSystem3 ps3;
void setup() {
  size(800,400);
  //ps = new ParticleSystem(width/1.3, height/2);

//ps2 = new ParticleSystem2(width/4, height/2);
ps3 = new ParticleSystem3(width/2, height/2);
}

void draw() {
  background(0);
  
   // Apply gravity force to all Particles
   
  PVector gravity = new PVector(0, 0.2);
 // ps.applyForce(gravity);  
 //ps.addParticle();
 // ps.run();
  
 //ps2.applyForce(gravity);  
 // ps2.addParticle();
 // ps2.run();
  
   ps3.applyForce(gravity);  
  ps3.addParticle();
  ps3.run();

 
}



