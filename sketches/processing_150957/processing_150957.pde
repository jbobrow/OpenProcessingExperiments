
//Fuente

ParticleSystem ps;
float num_p = 100;
PVector gravity = new PVector(0,9.8);
PVector pos;
int mode = 1;
int i=0;

void setup(){
  size(438,380);
  pos = new PVector(width/2,height/2+100);
  ps = new ParticleSystem(pos);
  background(50);
}

void draw(){
  
  if(mode == 0){
    if(i == 0){
      background(50);
      i++;
    }
    fill(255);
    text("Modo Artístico",50,50);
  }else if(mode == 1){
    background(50);
    fill(255);
    text("Modo Clásico",50,50);
  }
  
  ps.run();
  ps.addParticle();
}

void keyPressed(){
  
  if(key == '0'){
    mode = 0;
  }else if(key == '1'){
    mode = 1;
    i = 0;
  }
}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1000;
  float lifespan;
  float angulo;

  Particle(PVector l) {
    acceleration = new PVector();
    angulo=random(QUARTER_PI,3*QUARTER_PI);
    velocity = new PVector(-cos(angulo),-sin(angulo));
    velocity.mult(random(1.5,1.6));
    
    location = l.get();
    lifespan = 255.0;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force.get(), mass);
    acceleration.add(f);
  } 

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    //applyForce(gravity);
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
    acceleration.set(0,0);
  }

  // Method to display
  void display() {
    //stroke(255,lifespan);
    noStroke();
    fill(random(0,255),random(0,255),random(0,255),lifespan);
    ellipse(location.x,location.y,4,4);
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

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
    for (int i = 0; i < num_p; i++) {
      particles.add(new Particle(origin));         // Añadimos la cantidad de partículas que le hayamos fijado en la variable 'nParticulas'
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      p.applyForce(gravity);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}



