
/*
Constantly Spawning Particle System
Citation: "particles" by Ka Kit Cheong

*/
//PImage fairy;
ParticleSystem ps;
 
void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colorMode(HSB, 360, 20, 10);
  //Start the system off with just one particle.
  ps = new ParticleSystem(1, new PVector(width/2, height/2));
  noCursor();
   
//  fairy = loadImage("fairy.png");
}
 
void draw() {
  background(25);
  //Run the ParticleSystem object.
  if(mousePressed){
  ps.run();
  //Add one new Particle to it each frame.
  ps.addParticle(mouseX, mouseY);
  }
  fill(mouseX,mouseY,100, 80);
  ellipse(mouseX,mouseY, 10,10);
//  image(fairy, mouseX-10,mouseY-10);
}
class Particle{
  //http://processing.org/learning/pvector/
  //PVector is just a way of storing X and Y values in one object.
  PVector loc;
  PVector vel;
  PVector acc;
  float life;
  float h; //hue
   
  Particle(PVector _loc){
    loc = _loc.get();
    vel = new PVector(random(-1, 1), random(-1, 1), 0);
    acc = new PVector(random(-0.05,0.05), random(-0.05, 0.05), 0);
    life = 150.0;
    h = random(360);
  }
 
  void run(){
    display();
    update();
  }
   
  void display(){
    //Fill with the selected hue. Sat/Bright = 90. Alpha is linked to the life.
    fill(h, 90, 90, life);
    float a = life * 0.05; //Size also linked to life.
    ellipse(loc.x, loc.y, a,a);
  }
   
  void update(){
    //"add" for PVectors is identical to
    //velocityX += accelerationX, velocityY += accelerationY
    vel.add(acc); //Add acceleration to velocity
    loc.add(vel); //Add velocity to position
    life -= 1.5;  //Decrease the lifespan by 2
  }
   
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
  }
   
  //Is the particle system dead for whatever reason?
  boolean dead(){
     if(particles.isEmpty())
      return true;
     else
      return false;
  }
}



