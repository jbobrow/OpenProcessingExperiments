
ParticleSystem ps, ps1, ps2;
PImage img;
PImage img1;
PImage img2;
PImage bg;

void setup() {
  size(800, 400);
  ps = new ParticleSystem(width/2-300, 350);
  ps1 = new ParticleSystem2(width/2+300, 350 );
  ps2 = new ParticleSystem3(width/3-100, 400 );
  bg = loadImage("bg1.jpg");
}

void draw() {

  background(bg);

  // Apply gravity force to all Particles
  PVector gravity = new PVector(-0.1, 0.005);
  //PVector gravity1 = new PVector(0, -0.2);
  PVector hoho= new PVector(0.01*sin(radians(frameCount)), 0);


  //ps.applyForce(gravity);
  ps.applyForce(hoho);

  ps.addParticle(new Particle(ps.origin));
  //ps.addParticle(new Confetti(ps.origin));
  //ps.addParticle(new Daniel(ps.origin));


  ps.run();

  ps1.applyForce(gravity);


  ps1.addParticle(new Confetti(ps1.origin));
  // ps1.addParticle(new Daniel(ps1.origin));


  ps1.run();


  ps2.applyForce(gravity);


  //ps2.addParticle(new Confetti(ps2.origin));
  ps2.addParticle(new Daniel(ps2.origin));


  ps2.run();
}

class Confetti extends Particle {
  
  PImage img=loadImage("haha.png");
 
  Confetti(PVector l) {
    super(l);
  
  }

  void display() {
//    stroke(0, lifespan);
   // strokeWeight(2);
//    fill(255,255,130, lifespan);
//    rect(location.x, location.y, 20, 20);
    
    
    smooth();
    tint(255, 126);  
    image(img,location.x, location.y,50,50);
    
    
     if(location.y<0){
      velocity.y *= -2;
       //velocity.y=- velocity.y;
      //ellipse(location.x, location.y+3, 10,10);
  }
  
     
    if(location.y>height){
      velocity.y *= -velocity.y*1;
       //velocity.y=- velocity.y;
      //ellipse(location.x, location.y+3, 10,10);

  }
  }
}

class Daniel extends Confetti {
  
  float rotation,rotationSpd;
  PImage img=loadImage("haha2.png");
  
  Daniel(PVector l) {
    super(l);
    rotationSpd = random(-1,2);
    rotation = random(0,360);
  }

  void display() {

    stroke(0, lifespan);
    strokeWeight(2);

    pushMatrix();
    translate(location.x, location.y);
    translate(25, 25);
    fill(255, 255, 255, lifespan);
    translate(-25, -25);
    rotate(radians(rotation));
    tint(255, 126);  
    image(img,location.x, location.y,50,50);
    popMatrix();
    
    rotation = rotation + rotationSpd;
  }
}

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 50; 

PImage img=loadImage("haha1.png");

  Particle(PVector l) {
    location = l.get();
    lifespan = 255;
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
    lifespan -= 5.0;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }




  void display() {
    
    
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    // ellipse(location.x, location.y, 12, 12);
    tint(255, 150);  
     image(img,location.x, location.y,50,50);
     
     
      
    if(location.y<0){
      velocity.y *= -2;
       //velocity.y=- velocity.y;
      //ellipse(location.x, location.y+3, 10,10);
  }
  
     
    if(location.y>height){
      velocity.y *= -velocity.y*1;
       //velocity.y=- velocity.y;
      //ellipse(location.x, location.y+3, 10,10);

  }
  
   if(location.x>width){
      velocity.x *= -velocity.x*1;
       //velocity.y=- velocity.y;
      //ellipse(location.x, location.y+3, 10,10);

  }
  
  
      
  }

  // Is the particle still useful?
  //  boolean isDead() {
  //    if (lifespan < 0.0) {
  //      return true;
  //    } else {
  //      return false;
  //    }
  //  }
}

import java.util.*;

class ParticleSystem {
  
  ArrayList<Particle> particles;
  
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
  }

  void addParticle(Particle p) {
    particles.add(p);
      

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
//      
//      if (p.isDead()) {
//        particles.remove(p); 
//      }
    }
  }
 
}





class ParticleSystem2 extends ParticleSystem {
  
  
  ParticleSystem2(float x, float y) {
    super(x,y);
   
  }

  
  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    PVector fb=new PVector(f.x, -f.y);
    for (Particle p: particles) {
      p.applyForce(fb);
    }
  }
}
  
 
class ParticleSystem3 extends ParticleSystem {


  ParticleSystem3(float x, float y) {
    super(x, y);
  }


  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    PVector fc=new PVector(f.x, -f.y);
    for (Particle p: particles) {
      p.applyForce(fc);
    }
  }
}




