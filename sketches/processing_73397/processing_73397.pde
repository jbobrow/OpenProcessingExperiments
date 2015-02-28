
ParticleSystem ps;
int time_counter = 0;
PFont f1;

void setup() {
  size(640,360);
  smooth();
  ps = new ParticleSystem(new PVector(random(0,width),random(0,height)), color(255,255,255));
  f1 = createFont("Arial",40,true);
}

void draw() {
  if (time_counter < 30)
  {
    background(0);
    textFont(f1,40);
    fill(255,100,120);
    textAlign(CENTER);
    text("fireworks",width/2,180);
    textFont(f1,20);
    fill(255,200,120);
    text("kinda dark", width/2, 250);
    ps.addParticle();
    ps.run();
    time_counter++;
  }
  else
  {
    ps.origin = new PVector(random(0,width),random(0,height));
    ps.firework_color = color(random(0,255), random(0,255), random(0,255));
    time_counter = 0;
  }
}





// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  color firework_color;

  ParticleSystem(PVector location, color _firework_color) {
    firework_color = _firework_color;
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin, firework_color));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}



// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color particle_color;
  float particle_red;
  float particle_green;
  float particle_blue;

  Particle(PVector l, color _particle_color) {
    particle_color = _particle_color;
    acceleration = new PVector(0,0.1);
    velocity = new PVector(random(-2,2),random(-2,1));
    location = l.get();
    lifespan = 100.0;
    
    particle_red = red(particle_color);
    particle_green = green(particle_color);
    particle_blue = blue(particle_color);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 0.75;
  }

  // Method to display
  void display() {
//    stroke(particle_red, particle_green, particle_blue,lifespan);
    noStroke();
    fill(particle_red, particle_green, particle_blue, lifespan);
    ellipse(location.x,location.y,random(1,8),random(1,8));
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
