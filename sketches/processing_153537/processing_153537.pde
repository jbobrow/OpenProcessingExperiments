
import java.util.Iterator;
ArrayList <ParticleSystem> systems;
int c=0;

void setup() {
  size(600,800);
  systems = new ArrayList<ParticleSystem>();
  strokeWeight(0.2);
}

 
void draw() {
//  background(255);
 
 rectMode(CORNER);
 fill(255,100);
 //rect(0,0,600,800);
PVector gravity = new PVector(0,0.6);

 for (ParticleSystem ps: systems) {
    ps.applyForce(gravity);
    ps.run();
    if (c==0){
    ps.addParticle();
    c=1;
    }
 }
  
}

void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX,mouseY)));
}

void keyPressed(){
if (keyCode==32) {
saveFrame("ParticleDraw#####.jpg");
}
}

class Confetti extends Particle {
  
  Confetti (PVector l){
  
  super (l);
  
  }
    

  void display(){
  
  float theta = map(location.x,0,width,0,TWO_PI*2);
 
    rectMode(CENTER);
    fill(0,lifespan);
    stroke(0,lifespan);
   pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
   // rect(0,0,mass,mass);
     //line(location.x,location.y,mouseX,mouseY);
    
    popMatrix();
   line(location.x,location.y,mouseX,mouseY);
  
 }




}
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
      PVector dir;

  float lifespan;
   float mass = random(30);
   float mass2;
 
  float G;
  float strength;
 
  Particle(PVector l) {
    
    location = l.get();
    acceleration = new PVector(0,0.08*mass);
    velocity = new PVector(random(-10,10),random(-2,4));
    mass2=20;
    G=0.4;
    strength=0.5;
   
    

    lifespan = 2000;
  }
 
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
   PVector dir = PVector.sub(mouse,location);
    dir.normalize();
   float distance = dist(mouseX,location.x,mouseY,location.y);
    distance = constrain(distance,0,40);
  
     strength = (G * mass2 * mass) / ((distance * distance));
    
    
     
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(20);
    location.add(velocity);
     
    acceleration.mult(0);

   // lifespan -= 2.0;
  }
 
  void display() {

    stroke(0,lifespan);
    fill(175,lifespan);
    //ellipse(location.x,location.y,mass,mass);
    
    line(location.x,location.y,mouseX,mouseY);
  }
  
  void run() {
    
    update();
    checkEdges();
    display();
  }
 


boolean isDead() {

    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  
   void checkEdges() {

    if (location.x > width-mass) {
     
      velocity.x *= -1;
    } else if (location.x < 0+mass) {
    velocity.x *= -1;
    }

    if (location.y > height-mass) {
      
      velocity.y *= -1;
      
      
    }
    else if (location.y< mass) {
       
       velocity.y *= -1;
    }


  }
  }
class ParticleSystem {
   ArrayList<Particle> particles;
  PVector origin;
   PVector location;
 
  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList();
  }
 
  void addParticle() {
 PVector mouse = new PVector(mouseX,mouseY);
    
    origin =mouse;
 
   float r = random(1);
   for(int i=0;i<10;i++){
    
    if (r < 0.5) {
      particles.add(new Particle(origin));
    } else {
      particles.add(new Confetti(origin));
    }
  }
  }
  
  void run (){
  
  
  Iterator<Particle> it = particles.iterator();

  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    
    if (p.isDead()) {
       it.remove();
    }
  }
  
  
  }
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
}


