
/*
Simple Particle System by Daniel Shiffman.
 
 Particles are generated each cycle through draw(), fall with gravity and fade out over time A ParticleSystem object manages a variable size (ArrayList) list of particles.
 */

int numBalls = 250;

ParticleSystem ps;
ParticleSystem electrons_ps;
ParticleSystem explosions_ps;

void setup() {
  noSmooth();
  size(640, 480, P2D);
  colorMode(RGB, 255, 255, 255, 100);
  frameRate(30);
  
  explosions_ps = new ParticleSystem();
  electrons_ps = new ParticleSystem();
  ps = new ParticleSystem();
  
  for (int i = 0; i < numBalls; i++) {
    PVector l = randomPosition();   
    Particle p = new Particle(l);
    ps.addParticle(p);
  }
  
  ps.poke();ps.poke();ps.poke();
  ps.poke();ps.poke();ps.poke();
  background(50);
  
  /*
  noLoop();  
  for (int f = 0; f < frameRate*30; f++) {
    drawing();
    saveFrame("frames/" + f + ".png");  
    println("frames/" + f + ".png");
  }
  println("Done!");
  exit();
  */
}

void draw() {
  drawing();
}

void drawing() {
  fill(20,25,30,20);
  rect(0,0,width,height);
  
  explosions_ps.run();
  electrons_ps.run();  
  ps.run();  
  //fill(255);
  //text(ps.particles.size() + " " + frameRate, 50, 50);
  
  if (electrons_ps.particles.size() > 10000) {
    exit();  
  }
}



PVector randomPosition() {
  PVector l = new PVector( random(0,width), random(0,height) );   
  return l; 
}

// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float timer;
  float r = 6;

  // Another constructor (the one we are using here)
  Particle(PVector l, PVector v) {
    init();
    loc.set(l);
    vel.set(v);
  }
  
  Particle(PVector l) {
    init();
    loc.set(l);
  }

  void init() {
    acc = new PVector();    
    loc = new PVector();
    vel = new PVector();
    timer = 100;
  }

  void run() {      
    update();
    render();
  }

  void explode() {
    //print("bank! ");
    for (int i = 0; i < 2; i++) {
      Electron e = new Electron(loc);
      electrons_ps.addParticle(e); 
    }
    
    Boom ex = new Boom(loc);
    explosions_ps.addParticle(ex);
    
    fill(255,250,200, 5);
    rect(0,0,width, height);
    
    
    //println(electrons_ps.particles.size());
    timer -= 33.4; 
    r -= 1.5;
  }

  void calcGravity() {
    // gravity fra alle partikler
    //PVector gr = gravity(this);  
    //acc.add(gr); 

    // gravity til det sorte hul
    PVector bh_acc = new PVector();
    float dx, dy, ax, ay, force, i_dist, sq_dist;
    /*
    dx = mouseX - loc.x;
     dy = mouseY - loc.y;
     */
    dx = width/2- loc.x;
    dy = height/2- loc.y;

    i_dist = pow(dx,2) + pow(dy,2);
    sq_dist = sqrt(i_dist);

    if (sq_dist > 0) {
      force = 10 + (1000 / i_dist);             // FORCE!!!
      ax = force * dx / i_dist;
      ay = force * dy / i_dist;          
      bh_acc.x = ax;
      bh_acc.y = ay;
    }            
    acc.add(bh_acc);
  }


  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);    

    acc.x = 0;
    acc.y = 0;
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(0);
    fill(255,40,50);
    ellipse(loc.x,loc.y,r,r);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
}


// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born

    ParticleSystem() {
    particles = new ArrayList();
  }

  ParticleSystem(int num, PVector _origin) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = _origin;                        // Store the origin point
    int r = 200;
    numBalls = num;
    float vMult = 4;    // velocity multiplier

    for (int i = 0; i < numBalls; i++) {
      float vx = cos(TWO_PI * i/numBalls);
      float vy = sin(TWO_PI * i/numBalls);
      PVector l = new PVector(width/2 + vx*r, height/2 + vy*r);
      vx *= vMult;
      vy *= vMult;  
      PVector v = new PVector(vx, vy);
      // new PVector(random(0,width),random(0,height))
      addParticle( new Particle(l, v) );
    }
  }
  
  void poke() {
    int i = floor(random(0, particles.size()) );
    Particle p = (Particle) particles.get(i);
    p.explode();
  }

  
  void addParticle(float x, float y) {
    Particle p = new Particle(new PVector(x, y), new PVector());
    particles.add(p);
  }

  void addParticle(Particle p) {
    particles.add(p);
  }


  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    int c = particles.size();

    for (int i = 0; i < particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      
      p.run();  
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }
  
  boolean kollision(Particle p1, float range) {    
    float i_dist;
    int i, j, c;
    boolean returnValue = false;
    c = particles.size();
    for (i = 0; i < c; i++) {
      
      Particle p2 = (Particle) particles.get(i);
      i_dist = sqrt(pow(p1.loc.x - p2.loc.x,2) + pow(p1.loc.y - p2.loc.y,2));
      
      if (i_dist < range) {             
          p2.explode();
          returnValue = true;
          break;
        }
      }   
    return returnValue;  
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }
}

void mousePressed() {
  ps.poke();
}


