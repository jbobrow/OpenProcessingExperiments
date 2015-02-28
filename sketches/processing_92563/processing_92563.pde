
/*
Constantly Spawning Particle System
Written by Ka Kit Cheong, Modified by Jeannie Park, Floriano Giudice
Project C | Template 1
*/
 
ParticleSystem ps;
ParticleSystem myps;
 
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colorMode(HSB, 178, 81, 96);
  //Start the system off with just one particle.
  ps = new ParticleSystem(1, new PVector(width/2, height/2));
  noCursor();
  myps = new ParticleSystem(1, new PVector(width/2, height/2));
  noCursor();
 
   
}
 
void draw() {
  background(25,10,10,100);
  //Run the ParticleSystem object.
  ps.run();
  myps.run();
  //Add one new Particle to it each frame.
  ps.addParticle(mouseX, mouseY);
  myps.addParticle(mouseX, mouseY);
 
     
}
class Particle{
                 
                 // FIELDS
                 // PVector is a way of storing X and Y values in one object
  PVector loc;   // location
  PVector vel;   // velocity
  PVector acc;   // acceleration
  float life;    // duration
  float h;       //  hue
   
   
  Particle(PVector _loc){    // CONSTRUCTOR: assigns initial values to fields
    loc = _loc.get();
    vel = new PVector(random(-2, 2), random(0, 10), 0);
    acc = new PVector(0, random(0, 0.05), -10);
    life = 40.0;            // lower= smaller rectangles
    h = random(25);          // lower= less variations in color
  }
 
  void run(){                // FUNCTIONS (nesting display & update fcns in run)
    display();
    update();
  }
   
  void display(){
    //Fill with the selected hue. Sat/Bright = 90. Alpha is linked to the life.
    fill(h, 20, 120, life*6);
    float a = life * 1.2; // Size also linked to life.
    ellipse(loc.x, loc.y, a, a);
    rect(loc.x,loc.y,a,a);
  }
   
  void update(){
     
    // "add" for PVectors is identical to
    // velocityX += accelerationX, velocityY += accelerationY
    vel.add(acc); //Add acceleration to velocity
    loc.add(vel); //Add velocity to position
    life -= 0.3;  //Decrease the lifespan by 1.5
     
    if (mousePressed){
      h = random(230);
      vel = new PVector(random(-2, 2), random(-5, 5), 0);
      acc = new PVector(random(-0.3, 0.3), random(-0.3, 0.3), -10);
     
      
         
      
       
       
    }
     
  
  }
  /*
  void checkCollisions() {
      
    float r = circleSize/2;
      
    if ( (x<r) || (x>width-r)){
      xSpeed = -xSpeed;
    }
      
    if( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
      
  }
*/
   
  boolean dead(){
    if(life <= 0.0){ //Am I dead???
      return true;
    } else{
      return false;
    }
  }
}
/*  ParticleSystem class.
    Manages a list of Particle objects.
    We use an ArrayList because it's easier to remove things from and the size
    can change dynamically: http://www.processing.org/reference/ArrayList.html
 */
 
class ParticleSystem {
 
  ArrayList particles; //The list of Particles
  PVector origin; 
 
  ParticleSystem(int num, PVector _origin) {
    particles = new ArrayList();
    origin = _origin.get();
    //Add "num" particles to this system.
    for ( int i=0; i<num; i++) {
      particles.add(new Particle(origin));
    }
  }
 
  void run() {
    //Cycle through the list of particles
    for (int i = particles.size()-1; i>=0; i--) {
      //Grab a reference to the current particle we're looking at
      Particle p = (Particle) particles.get(i);
      //Call this particle's "run" method
      p.run();
      //Check to see if it's dead. If so, remove it from this list.
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }
  //Add a single Particle
  void addParticle(float _x, float _y) {
    particles.add(new Particle(new PVector(_x, _y)));
    particles.add(new Particle(new PVector(_x, _y)));
    particles.add(new Particle(new PVector(_x, _y)));
  }
   
  //Is the particle system dead for whatever reason?
  boolean dead(){
     if(particles.isEmpty())
      return true;
     else
      return false;
  }
}


