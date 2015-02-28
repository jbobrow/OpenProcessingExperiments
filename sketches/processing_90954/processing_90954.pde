
class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  

  
  Particle(PVector l) {
    location = l.get();
    
    lifespan = 255.0;
    acceleration = new PVector(0, 0.005);
    velocity = new PVector(random(-4, 4),random(-2, 0));
    
 
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
// stroke(0,lifespan);
 //strokeWeight(2);
 
 //fill(255,255,0,lifespan);
//fft.forward(player.mix);
//  
//    float b = fft.getBand(1);
//    
    
image(img,location.x,location.y,500,700);
  }

  
 

  
    
        
   
 
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0 ) {
     
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





ParticleSystem ps;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//Minim minim;
//AudioPlayer player;
//FFT fft;
PImage img;

void setup() {
  size(800,800);

    img = loadImage("12.png");
//    minim = new Minim(this);
//  player = minim.loadFile("burning.mp3");
// 
//fft = new FFT(player.bufferSize(), player.sampleRate());
//   
// player.play();
//  player.loop();
  ps = new ParticleSystem(width/2, height/1.5);
  imageMode(CENTER);
}

void draw() {
  background(255);
    
   // Apply gravity force to all Particles
  PVector gravity = new PVector(0, -0.1);
  ps.applyForce(gravity);
  
  ps.addParticle();
  ps.run();
}
//void stop()
//{
//player.close();
//minim.stop();
//super.stop();
//}


