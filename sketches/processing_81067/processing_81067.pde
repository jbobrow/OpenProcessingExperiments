
//http://www.openprocessing.org/sketch/41450

PImage img;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
int counter = 0;
 
Minim m;
AudioPlayer wind;
AudioPlayer rain;
 
ParticleSystem ps;    
float w = 7;
float w1 = 1;
 
void setup() { 
  size(600, 400);
  ps = new ParticleSystem(1, new PVector(width/2, height/2, 0));
  smooth(); 
 
  m = new Minim(this);
  //wind = m.loadFile("windy.wav");
 
  m = new Minim(this);
  //rain = m.loadFile("rain.wav");
  
  img= loadImage("IMG_5527_b.jpg");
  image(img,0,0);
}    
 
void draw() { 
  background(img);
  ps.run();
  if (mousey) { 
    ps.addParticle(new PVector(mouseX, mouseY));
  } 
  mousey = false;
}    
 
boolean mousey = false;    
 
void mouseMoved() { 
  mousey = true;
  //rain.loop();
}  
 
class Particle { 
  PVector loc; 
  PVector vel;
  PVector acc;
  float r; 
  float timer;   
 
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get(); 
    vel = v.get(); 
    loc = l.get(); 
    r = r_; 
    timer = 100.0;
  } 
 
  Particle(PVector l) {
    acc = new PVector(0, 0.05, 0); 
    vel = new PVector(random(w1, w), random(-2, 0), 0); 
    loc = l.get(); 
    r = 10.0; 
    timer = 500.0;
  } 
 
 
 
  void run() { 
 
    update(); 
 
    render();
  } 
 
 
 
  // Method to update location 
 
  void update() { 
 
    vel.add(acc); 
 
    loc.add(vel); 
 
    timer -= 2.0;
  } 
 
 
 
  // Method to display 
 
  void render() { 
 
    ellipseMode(CENTER); 
    
    //random changes to the size of the stroke
    strokeWeight(random(8));
    
    stroke(random(100,255), timer); 
 
    fill(random(100,255), timer); 
 
    line(loc.x, loc.y, loc.x, loc.y + 5);
  } 
 
 
 
 
  boolean dead() { 
 
    if (timer <= 0.0) { 
 
      return true;
    }  
 
    else { 
 
      return false;
    }
  }
} 
 
 
 
class ParticleSystem { 
 
 
 
  ArrayList particles;    // An arraylist for all the particles 
 
    PVector origin;        // An origin point for where particles are birthed 
 
 
 
  ParticleSystem(int num, PVector v) { 
 
    particles = new ArrayList();              // Initialize the arraylist 
 
      origin = v.get();                        // Store the origin point 
 
      for (int i = 0; i < num; i++) { 
 
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  } 
 
 
 
  void run() { 
 
    // Cycle through the ArrayList backwards b/c we are deleting 
 
    for (int i = particles.size()-1; i >= 0; i--) { 
 
      Particle p = (Particle) particles.get(i); 
 
      p.run(); 
 
      if (p.dead()) { 
 
        particles.remove(i);
      }
    }
  } 
 
 
 
  PVector place; 
 
  void addParticle(PVector _place) { 
 
    place = _place.get(); 
 
 
 
    particles.add(new Particle(place));
  } 
 
 
 
 
 
  // A method to test if the particle system still has particles 
 
  boolean dead() { 
 
    if (particles.isEmpty()) { 
 
      return true;
    }  
 
    else { 
 
      return false;
    }
  }
}
 

