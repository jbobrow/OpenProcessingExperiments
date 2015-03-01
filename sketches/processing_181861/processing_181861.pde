
import java.util.Iterator;
ArrayList<ParticleSystem> ps;

PImage img;

void setup(){
  size(600, 600);
  ps = new ArrayList<ParticleSystem>();
  img = loadImage("globe.png");
}

void draw(){
  
  background(255);
  if (mousePressed){
    ps.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  }
  for (ParticleSystem p:ps){
  p.addParticle();
  p.run();
  }
  
  if (keyPressed){
      background(255);
      for (ParticleSystem p:ps){
      p.remove();
      }
      }
  
}



class Particle{
  
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  
  Particle(PVector l){
    loc = l.get();
    vel = new PVector (random(-1, 1),random(-2, 0));
    acc = new PVector (0, 0.05);
    lifespan = 255.0;
  }
  
  void update(){
    vel.add(acc);
    loc.add(vel);
    lifespan -= 25.0;
    
    
    
    if (loc.x>width || loc.x < 0) vel.x *= -1;
    if (loc.y>height || loc.y < 0) vel.y *= -1;
    
  }
  
  void display(){
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(loc.x, loc.y, 8, 8);

//      imageMode(CENTER);
//      tint(255, lifespan);
//      image(img, loc.x, loc.y);
  }
  
  boolean isDead(){
    if (lifespan > 0.0) return false;
    else return true;
  }
  
  void run(){
    update();
    display();
  }
}

class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void run(){
    Iterator<Particle> it = particles.iterator();
    
    while (it.hasNext()){
      Particle p = it.next();
      p.run();
      if (p.isDead()) it.remove();
    }
  }
  
  void remove(){
  Iterator<Particle> it = particles.iterator();
    
    while (it.hasNext()){
      Particle p = it.next();
      it.remove();
      }
  }
}
    
    
