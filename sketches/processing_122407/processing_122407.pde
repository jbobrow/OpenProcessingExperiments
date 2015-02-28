
ParticleSystem ps;
Repeller repeller;
boolean colorwhite = false;
int frame = 0;



void setup() {
  colorMode(HSB,360,100,100);
  size(800,600);
 ps = new ParticleSystem(new PVector(width/2,height/2));
 background(0);
 frameRate=5000;

  
}

void draw() {

  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  ps.addParticle();
  ps.run();
  
  repeller = new Repeller(mouseX,mouseY);
  ps.applyRepeller(repeller);

   
  frame++;  
}











// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector noiseVec;
  float lifespan;
  float mass = 1;
  float age =250;
  float c =0; 
  float a;


  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
    noiseVec = new PVector();
     
  }

  void run() {
    update();
    display();
  }


 void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }




  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.0;
    
   // float noiseFloat =0.0002* noise(location.x , location.y , frame);
   float noiseFloat = noise(location.x * 0.0005, location.y * 0.0005, frame* 0.001);
   println(noiseFloat);
    noiseVec.x = cos(((noiseFloat/2) * 8*PI) * 10);
    noiseVec.y = sin(((noiseFloat/2) * 2*PI) * 10);
     
    velocity.add(noiseVec);
    velocity.div(10);
    location.add(velocity);
    
    
    c++;
    




    
    
  }

  // Method to display
  void display() {
    

   if(colorwhite) {
    fill(180,100,00,20);
   }
 else {
fill(20,0,100,20);
 }
  

    noStroke();
    ellipse(location.x, location.y, 1-(c/age), 1-(c/age));
  
  age++;
    
  }
  
 
  
  
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < -100.0) {
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


 void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }

void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
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








  

  
void keyReleased()
{
 switch(key){
 case ' ':
  
  
   noStroke();
    fill(0);
    rect(0, 0, width, height);
  
 }
  
}



 

void mousePressed(){
  
   if(colorwhite) colorwhite = false;
  else if(!colorwhite) colorwhite = true;
 
}









class Repeller {
 
//How strong is the repeller?
  float strength = -10000;
 PVector location;
  float r = 10;
 
  Repeller(float x, float y)  {
    location = new PVector(x,y);
  }
 
  void display() {
    /*
    stroke(255);
    fill(150);
    ellipse(location.x,location.y,r*2,r*2);*/
  }
 
  PVector repel(Particle p) {
//This is the same repel algorithm we used in Chapter 2: forces based on gravitational attraction.
    PVector dir = PVector.sub(location,p.location);//get force direction
    float d = dir.mag();//get distance
    dir.normalize();
    d = constrain(d,5,100);
    float force = -1 * strength / (d * d); //calculate magnitude
    dir.mult(force);
    return dir; //make a vector out of direction and magnitude
  }
}
