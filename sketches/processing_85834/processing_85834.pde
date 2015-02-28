
// Particle Motion
// by Trevor Shaffer

ParticleSystem ps;
int noDiv = 20;

void setup() {
  size(500,500);
  background(0);
  smooth();
  
  ps = new ParticleSystem(noDiv);
  
}

void draw() {
  noStroke();
  fill(255);
  rect(0,0,width,height);
   
  ps.run();
}

void mousePressed(){
  ps.hole.loc.x = mouseX;
  ps.hole.loc.y = mouseY;
}

void mouseDragged(){
  ps.hole.loc.x = mouseX;
  ps.hole.loc.y = mouseY;
}
class Hole{
  PVector loc, vel, acc, fric;
  float mass, maxVel, drag;
  int d = 50; // diameter size of hole
  
  Hole(PVector loc_, float mass_){
    loc = loc_.get();
    mass = mass_;
    
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
    drag = -0.05;
    maxVel = 3.0;
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    fric = PVector.mult(vel,drag);
    applyForce(fric);
    
    vel.add(acc);
    vel.limit(maxVel);
    
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    stroke(0);
    noFill();
    ellipse(loc.x, loc.y, d, d);
  }
  
  void applyForce(PVector force){
    force.div(mass);
    acc.add(force);
  }
}
class Particle{
  PVector loc, vel, acc, dir, fric, grav;
  float mass, velMax, drag;
  int gConstant = -5;

  Particle(PVector loc_, float velMax_) {   
    loc = loc_.get();
    acc = new PVector(0,0);
    
    vel = new PVector(0,1);
    
    velMax = velMax_;
    drag = -0.005; // friction
    mass = 1.0;
  }
  
  void run(){
    
    update();
    display();
  }

  void update() {
    fric = PVector.mult(vel,drag);
    applyForce(fric);
    
    vel.add(acc);
    vel.limit(velMax);
    loc.add(vel);
    acc.mult(0);
  }

  void wrap() {
    
    if(loc.x > width + (mass/2)) {
      loc.x = 0-(mass/2);
    } else if (loc.x < 0 - (mass/2)) {
      loc.x = width + (mass/2);
    }
    
    if(loc.y > height + (mass/2)) {
      loc.y = 0 - (mass/2);
    } else if (loc.y < 0 - (mass/2)) {
      loc.y = height + (mass/2);
    }
  }

  void display() {
    noStroke();
    fill(0,0,255);
    ellipse(loc.x,loc.y,2*mass,2*mass);
  }
  
  PVector calcGrav(Hole h){
    dir = PVector.sub(loc,h.loc);
    float d = dir.mag();
    d = constrain(d,20,200);
    dir.normalize();
    float frc = (gConstant * mass * h.mass)/(d * d);
    dir.mult(frc);
    return dir;
  }
  
  void applyForce(PVector force){
    force.div(mass);
    acc.add(force);
  }
}
class ParticleSystem{
  ArrayList pa;
  Hole hole;
  float holeMass = 12.0;
  
  ParticleSystem(int noDiv_){
    pa = new ArrayList();
    
    for(int i = 0; i < width/noDiv_; i++){
      for(int j = 0; j < height/noDiv_; j++){
        pa.add(new Particle(new PVector(i*noDiv_, j*noDiv_), 2));
      }
    }
    
     hole = new Hole(new PVector(width/2,height/2), holeMass);
    
  }
  
  void run(){
    for(int i = pa.size() - 1; i >= 0; i--){
      Particle p = (Particle) pa.get(i);
      
      PVector f = p.calcGrav(hole);
      p.applyForce(f);

      p.run();
      
    }
    hole.run();
  }
  
  void addParticle(PVector loc_){
    pa.add(new Particle(loc_, 3));
  }
  
  void addParticle(Particle p){
    pa.add(p);
  }
  
  void addParticles(int no_, PVector loc_, float velMax){
    
    for(int i = 0; i < no_; i++){
      pa.add(new Particle(loc_, velMax));
    }
  }
}


