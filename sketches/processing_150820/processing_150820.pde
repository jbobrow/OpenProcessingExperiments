

ParticleSystem ps;
int n = 1000; //numero de particulas
int cont = 0;

void setup() {
  size(640,800);
  ps = new ParticleSystem(new PVector(width/2,70));
}

void draw() {
  background(0);
  fill(120, 100, 230);
  textSize(25);
  text("Pulse 'a' para volver a empezar.", 20,25);
  if(cont<n)
  {
    ps.addParticle();
    cont++;
  }
  ps.run();
}

void keyPressed(){
  if(key=='a'){
    n = 1000;
    cont = 0;
    ps = new ParticleSystem(new PVector(width/2,70));
    setup();
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float col1 = random(0,255);
  float col2 = random(0,255);

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-2,3),random(-2,3));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  void display() {
    stroke(255,lifespan);
    fill(lifespan,col1,col2);
    ellipse(location.x,location.y,15,15);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}


