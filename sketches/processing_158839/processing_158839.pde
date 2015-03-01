
ParticleSystem ps;

void setup() {
  size(600,500);
  //background(255);
  ps = new ParticleSystem(new PVector(width/2,250));
}

void draw() {
  background(2);
  ps.addParticle();
  ps.run();
}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(0,0.005);
    velocity = new PVector(random(-1,1),random(-1,0));
    location = l.get();
    lifespan = 255.0;
  }
  
  void run() {
    update();
    push();
    display();
    pop();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void push() {
    pushMatrix();
  }
  
  
  void pop() {
    popMatrix();
  }
  
  void display() {
    stroke(255,lifespan);
    fill(5,12);
    translate(location.x,location.y);
    //triangle(0,0,200,20,200,0);
    //triangle(0,0,-200,20,-20,20);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    }else{
      return false;
    }
  }
}
class ParticleChild extends Particle {
  ParticleChild(PVector l) {
    super(l);
  }
  
  void display() {
    super.display();
    float theta = map(location.x,0,width,0,TWO_PI*4);
    rotate(theta);
    stroke(255);
    fill(5,238,250,10);
    //line(0,0,450,450);
    ellipse(0,0,250,250);
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
     float r = random(1);
     if (r < 0.05) {
       particles.add(new Particle(origin));
     }else{
       particles.add(new ParticleChild(origin));
     }
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


