
/*
Constantly Spawning Particle System
Written by Ka Kit Cheong, Modified by Michael Kontopoulos
Project C | Template 1
*/

ParticleSystem ps;
String Quote = "The Sixth Street Bridge As A Symbol For Los Angeles";
PFont f;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  f = loadFont("Flama-Medium-48.vlw");
  colorMode(HSB, 360, 100, 100);
  //Start the system off with just one particle.
  ps = new ParticleSystem(1, new PVector(width/2, height/2));
  noCursor();
}

void draw() {
  background(25);
  //Run the ParticleSystem object. 
  ps.run();
  //Add one new Particle to it each frame.
  ps.addParticle(mouseX,mouseY);
  
}
class Particle {
  //http://processing.org/learning/pvector/
  //PVector is just a way of storing X and Y values in one object.
  PVector loc;
  PVector vel;
  PVector acc;
  float life;
  float h; //hue

  Particle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(random(-1, 0.5), random(-1, 1), 0);
    acc = new PVector(random(-0.1, -.01), random(-0.1, -0.01), 0);
    life = 10.0;
    h = random(0,100);
  }

  void run() {
    display();
    update();
  }

  void display() {
    //Fill with the selected hue. Sat/Bright = 90. Alpha is linked to the life.

    fill(h, 90, 90, life);
    float a = life * 0.1; //Size also linked to life.
    textFont(f, 32);
    int x = 10;
      fill(h, 90, 90);
    textAlign(CENTER, CENTER);
    textSize(random(mouseX, mouseY));
    text (Quote, width/2,height/2);
    for (int i = 0; i < Quote.length(); i++) {
      textSize(random(12, 52));
      text(Quote.charAt(i), x+i, random(0,height));
      // textWidth() spaces the characters out properly.
      x += textWidth(Quote.charAt(i));
    }
   
    fill(25);
    ellipse(mouseX,mouseY,150,150);


  }

  void update() {
    //"add" for PVectors is identical to 
    //velocityX += accelerationX, velocityY += accelerationY
    vel.add(acc); //Add acceleration to velocity
    loc.add(vel); //Add velocity to position
    life -= 1.5;  //Decrease the lifespan by 2
  }

  boolean dead() {
    if (life <= 0.0) { //Am I dead???
      return true;
    } 
    else {
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
    for ( int i=0; i<num; i+=20) {
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
  void addParticle(float i, float _y) {
    particles.add(new Particle(new PVector(i, _y)));
  }
  
  //Is the particle system dead for whatever reason?
  boolean dead(){
     if(particles.isEmpty())
      return true;
     else
      return false; 
  }
}



