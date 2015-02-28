
// Snowstorm!

int bigNumber = 2000;
color theSky = color(14,52,78);

ParticleSystem ps;


void setup()  {
  size(1000, 600, P3D);
  ps = new ParticleSystem();
  noStroke();
  fill(204);
}

void draw()  {
  background(0);
  lights();

  float fov = PI/3.0; 
  float cameraZ = (height/2.0) / tan(fov/2.0); 

  //perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0); 
  //translate(width/2, height/2, 0);

  camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);translate(width/2, height/2, -100);
  //rotateX(-PI/6); 
  //rotateY(PI/3); 

  background(theSky);
  ps.addParticle();
  ps.run();
  //box(160);
}


// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float diameter;
  float movement = 0.1;

  Particle(PVector l) {
    acceleration = new PVector(0,0,0.1); //new PVector(0,.1,0);
    velocity = new PVector(0,0,0); //random(-1,1),random(-1,1),0);
    location = l.get();
    lifespan = 255.0;
  }


  // Method to update location
  void update() {
    acceleration = new PVector(random(-movement,movement),random(-movement,movement),0.1);
    //velocity.add(wind);
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    pushMatrix();
    translate(location.x, location.y, location.z);
    //sphere(5);
    fill(100,150-lifespan);
    box(5);
    
    popMatrix();
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0) {
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
    origin = new PVector(random(bigNumber)-bigNumber/2, random(bigNumber)-bigNumber/2, -bigNumber);
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

