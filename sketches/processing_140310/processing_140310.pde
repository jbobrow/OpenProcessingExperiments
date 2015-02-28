
// Snowstorm!

color theSky = color(14,52,78);

ParticleSystem ps;

void setup() {
  size(1000,600);
  ps = new ParticleSystem();
  noStroke();
}

void draw() {
  background(theSky);
  ps.addParticle();
  ps.run();
}





// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector wind = new PVector(random(-1,1),random(-1,1));
  float lifespan;
  float diameter;
  float movement;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-1,1));
    location = l.get();
    lifespan = 255.0;
  }


  // Method to update location
  void update() {
    //acceleration = new PVector(float (mouseX-width/2)/(10*width), float (mouseY-height/2)/(10*height));
    movement= 1 -(lifespan - 255)/5000;
    acceleration = new PVector(random(-movement,movement),random(-movement,movement));
    //velocity.add(wind);
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    // note: lifespan counts down from 255 to zero
    diameter = 1 -(lifespan - 255)/10; // diameters from 1 to 26.6
    fill(255-lifespan/2, lifespan); // fill color from 125 to 255, alpha 255 to zero
    ellipse(location.x, location.y, diameter, diameter);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 100.0) {
      return true;
    } else {
      return false;
    }
  }
}




// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    origin = new PVector(random(width),random(height));
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
