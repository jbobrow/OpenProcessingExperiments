
    /*pushMatrix();
    translate(200,200);
    //rotate(radians(rad));
     
    ellipse(location.x,location.y,40,40);
    popMatrix();*/




class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass = 1; 
  float rotation;
  float fly;
  float radius = random(15,35);
  float xv = -3.2+random(6);
  float yv = 10;
  float y  =height;
  float x= width;
  
  
  Particle(PVector l) {
    location = l.get();
    lifespan = 255.0;
    acceleration = new PVector(0, 0.05);
    rotation=random(0,360);
    fly = random(-5,10);
    velocity = new PVector(random(-1, 1),random(-2,-2.9));
    rotation = random(0, 10); 
    
 
  }

  void run() {
    update();
    display();
  }

  // Update location/speed/lifespan
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= .2;
  }
  
 void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
   acceleration.add(f);
  }

  void display() {
    noStroke();
  
   rotation+=fly ; 
     
 pushMatrix();
    translate(location.x,location.y-100);
    rotate(radians(rotation));
    //translate(200,200);
    fill(100,200,255);
   // stroke(100,60);
   // strokeWeight(1);
    //fill(127,lifespan);
    rect(0,0,10,10);
    popMatrix();
    
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 1.0) {
      return true;
    } else {
      return false;
    }
  }
}

class Particle3 extends Particle2{
  PVector velocity = new PVector(random(-1, 3), random(-2, 2));
  Particle3(PVector r){
    super(r);
    
  }
void display(){
     pushMatrix();
    translate(location.x,location.y);
    fill(120,225,200);
   // stroke(0, lifespan);
    strokeWeight(2);
    ellipse(location.x, location.y, 12, 12);
   
    popMatrix();
  }
void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= .3;
  }
}


class Particle2 extends Particle {
    PVector velocity = new PVector(random(-3, 3), random(-2, -4));
  
     Particle2(PVector l){
       super(l);
      
     }
   
   void display(){
     
   // rotate(radians(rad));
 pushMatrix();
     translate(location.x,location.y-300);
     //rotation+=fly; 
     rotate(radians(rotation));
     if (a>=0){
      fill(255);
    ellipse(height/2,yPos,50,50);
    
   }
   else{
    fill(random(255));
     ellipse(height/2,yPos,30,40);
     
   }
   popMatrix();
   }
   //} else if (yPos >  500) {
  
 // ellipse(width/2, yPos, 60, 40);
  
//}
  void applyForce(PVector force) {
    PVector f = force.get();
   // f.div(mass);  
    //acceleration.add(f);
  }
  
}

  
  
import java.util.*;

//class ThirdParticleSystem extends UpParticleSystem {
       
     //  ThirdParticleSystem(float m, float n) {
       //   super(m,n);
      
    //  }
    
//}

//class UpParticleSystem extends ParticleSystem {
       
    //   UpParticleSystem(float x, float y) {
         // super(x,y);
      
    //  }
     // void applyForce(PVector f) {
     //   PVector aa = new PVector(f.x,f.y);
    
   //   for (Particle p: particles) {
   //   p.applyForce(aa);
   // }
      
 // }

//}
class ParticleSystem {
  
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float x, float y) {
    origin = new PVector(x,y);
    particles = new ArrayList<Particle>();
   
  }

  void addParticle() {
    particles.add(new Particle(origin));
    particles.add(new Particle2(origin));
    particles.add(new Particle3(origin));
  }
  
  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void run() {
    
   for (int i = particles.size()-1; i > 0; i--) {

      Particle p = particles.get(i);
      p.run();
      
      if (p.isDead()) {
        particles.remove(p); 
      }
    }
  }
}






ParticleSystem ps;
//Particle2 par = new Particle2(new PVector(0,0));
//Particle3 pic = new Particle3(new PVector(1,2));

float rad= radians(3);
float yPos=10;
float xPos=10;
float g= .10;
float a= 0;

void setup() {
  frameRate(50);
  size(800,600);
 

 ps = new ParticleSystem(width*1/3,height/2);
 //ps = new UpParticleSystem(width*2/3,height/2);
// pd[2]=  new ThirdParticleSystem(width*1/3, height/2);
 smooth();
}


void draw() {
  background(0);
 translate(100,100);
   rotate(radians(rad));
  // translate(0, 0);
  yPos += a;
  a += g;
  if (yPos>480){
    a=-a/1;
  
  }
  PVector gravity = new PVector(0,0.1);
 // for (int i=0;i< random(1,5) ;i++){
    ps.applyForce(gravity);
    ps.run();
    ps.addParticle();
}







