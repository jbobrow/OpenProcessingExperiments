
/*
Constantly Spawning Particle System
 Written by Ka Kit Cheong, Modified by Michael Kontopoulos
 Project C | Template 1
 */

PImage fairy;
float scaler = 1;
ParticleSystem ps;

void setup() {
  size(1000, 600);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);
  //Start the system off with just one particle.
  ps = new ParticleSystem(1, new PVector(mouseX, mouseY));
  noCursor();
  //imageMode(CENTER);

  fairy = loadImage("fairy_1.png");
}

void draw() {
  background(25);
  //Run the ParticleSystem object. 
  
  ps.run();
  //Add one new Particle to it each frame.
  ps.addParticle(mouseX, mouseY);
  
  if (mouseX - pmouseX > 0) {
    scaler = -1.0;
  }
  else if (mouseX - pmouseX <0) {
    scaler = 1.0;
  }

  pushMatrix();
  translate(mouseX,mouseY);
  scale(scaler,1.0);
  image(fairy, -2, -5);
  popMatrix();
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
    vel = new PVector(random(-1, 1), random(0, 5), 0);
    acc = new PVector(0, random(0, 0.001), -100);
    life = 800.0;
    h = random(90, 300);
  }

  void run() {
    display();
    update();
  }

  void display() {
    //Fill with the selected hue. Sat/Bright = 90. Alpha is linked to the life.
    fill(h, 90, 90, life);
    //float a = life * 0.1; //Size also linked to life.\
    star(loc.x, loc.y, 3, 8, 5); 

    if (mousePressed) {
      vel = new PVector(random(-5, 5), random(-1, 1), 0);
      acc = new PVector(random(-0.5, 0.5), random(-0.1, 0.1), 0);
      h=random(360);
    }
  }


  void update() {
    //"add" for PVectors is identical to 
    //velocityX += accelerationX, velocityY += accelerationY
    vel.add(acc); //Add acceleration to velocity
    loc.add(vel); //Add velocity to position
    life -= 9;  //Decrease the lifespan by 2
  }

  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
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



