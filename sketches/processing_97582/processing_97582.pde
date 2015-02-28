
import processing.video.*;

Capture cap;
ArrayList particles;
Particle a ;
float gravity = 5;
int GrilleLevel = 10;;



void setup(){
  size(640, 480);
  background(0);
  noStroke();
  fill(150);
  smooth();
  frameRate(30);

  particles = new ArrayList(); 
  GenerateParticles();

  // crate capture
  cap = new Capture(this, width, height);
  cap.start();


  a = new Particle(0, 0, 0, 0,0);
  a.location = new PVector(-500, height/2);
  a.mass = 8;
  particles.add(a);   

}


void draw() {
  background(0);

  if (cap.available()) {
    cap.read();
  }

  // parse Cam
  int n = 0;
  for( int x=0; x<width; x+=GrilleLevel ){
    for(int y=0; y<height; y+=GrilleLevel){
      // get cam
      color c = cap.get(x, y);
      float t = (brightness(c)/255); // entre 0 et 1
      // apply to particles
      if(n<=particles.size()){
        Particle p = (Particle)particles.get(n);
        float vat_t = (p.diam - t*GrilleLevel)*10;
        p.velocity = new PVector(vat_t,vat_t);
        p.diam = t*GrilleLevel;
      }
      n++;
    }
  }

  // apply life to particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    applyDissipativeForce(p, 0.1);
    applyAttractiveDest(p, 500f, 50f);
    applyAttractiveForce(p, a, -1000f, 50f);
    if(!p.exist()) {
      particles.remove(i);
    }
  }  
}


void mouseMoved() {
  
  a.location = new PVector(mouseX, mouseY);
  a.velocity = new PVector(mouseX-pmouseX, mouseY-pmouseY);
  a.acceleration = new PVector(0, 0, 0);
}

void mousePressed(){

 for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
   // p.position = new PVector(random(0,width), random(0,20));
  }
  // a.location = new PVector(mouseX, mouseY);
}






void GenerateParticles(){
 
  for( int x=0; x<width; x+=GrilleLevel ){
    for(int y=0; y<height; y+=GrilleLevel){
       particles.add(new Particle(x, y, x, y , GrilleLevel));
    }
  }
}

void applyDissipativeForce(Particle p, float friction) {
  PVector f = PVector.mult(p.velocity, -friction);
  p.applyForce(f);
}

void applyAttractiveDest(Particle a, float strength, float minDistance) {
  PVector dir = PVector.sub(a.location, a.destination);
  float d = dir.mag();
  if (d < minDistance) d = minDistance;
  dir.normalize();
  float force = (strength * a.mass * gravity) / (d * d);
  dir.mult(force);
   if (!a.fixed) {
    dir.mult(-1f);
    a.applyForce(dir);
  }
}


void applyAttractiveForce(Particle a, Particle b, float strength, float minDistance) {
  PVector dir = PVector.sub(a.location, b.location);
  float d = dir.mag();
  if (d < minDistance) d = minDistance;
  dir.normalize();
  float force = (strength * a.mass * b.mass) / (d * d);
  dir.mult(force);
  if (!b.fixed) b.applyForce(dir);
  if (!a.fixed) {
    dir.mult(-1f);
    a.applyForce(dir);
  }
}

public class Particle {

  PVector location;
  PVector destination;
  PVector velocity;
  PVector acceleration;
  float mass, diam;
  boolean fixed;

  public Particle(float posX, float posY, float destX, float destY, float diametre) {
    location = new PVector(posX, posY);
    destination = new PVector(destX, destY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0, 0);
    mass = 1;
    diam = diametre;
    fixed = false;
  }

  public boolean exist() {
   
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    fill(255);    
    noStroke(); 
    ellipse(location.x, location.y, diam,diam);
    return true;
  }

  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));
  }
}


