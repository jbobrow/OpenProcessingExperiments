

ParticleSystem ps;

float posX;
float speedX;
float speedY;
float posY;
float gravity;


void setup(){
  size(500, 500);
  
  ps = new ParticleSystem(new PVector(posX,posY));
  
  speedY = 0;
  speedX = 0;
  posX = width/2;
  posY = height;
  gravity = -0.1;
  speedX = -5;
}

void draw(){
  background(0);
  
  ps.addParticle();
  ps.run();
  
  
  posY += speedY;
  speedY += gravity;
  
  if(keyPressed){
    if(key =='s' || key =='S'){ 
         speedY = 5;
  }
    if(key == 'a' || key =='A'){
        
        posX += speedX;
        
      
      }
    if(key == 'd' || key =='D'){
        
        posX -= speedX;
      }
    
  }

  
  
   // if(particle)
  
  
  if(posY < 0){
    posY = 500;
    }
  ellipse(posX, posY, 50, 50);
}





class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;



  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = new PVector(posX,posY);
    
    lifespan = 255.0;
  }



  void run() {
    update();
    display();
  }




  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }



  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(255,lifespan);
    ellipse(location.x,location.y,8,8);
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




// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

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



