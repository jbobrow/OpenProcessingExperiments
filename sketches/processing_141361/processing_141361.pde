
Particle p;
ArrayList<Particle> particles;

void setup() {
  size(640,360);
  //for (int i = 0; i < 40; i = i+1)
  //p = new Particle(new PVector(width/2,50));
  particles = new ArrayList<Particle>();
}
 
void draw() {
  background(255);
  particles.add(new Particle(new PVector(width/2, 50)));
  
  // Operating the single Particle
  // ArrayList durchlaufen
  for(int i = 0; i < particles.size(); i++){
    Particle p = particles.get(i);
    p.run();
    if(p.isDead()){
      particles.remove(i);
    }
  }
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
 
  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.035);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255;
  }
 
  void run() {
    update();
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.5;
  }
 
  void display() {
    stroke(255, lifespan);
    //fill(153);
    fill(random(100, 255), random(200, 255), 255);
    ellipse(location.x,location.y,8,8);
  }
  boolean isDead() {
    if(lifespan<0){
      return true;
    }
    else{
      return false;
    }
  }
 
  
}


