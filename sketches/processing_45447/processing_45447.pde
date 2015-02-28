
//Credits: Ben Gry & Daniel Shiffman

ArrayList psystems;

PImage achtergrond;

int y = 480; //starting point of the Y value
float s = y/20; //size of the ellipse
int ranX = int(random(10,500)); //random X value


boolean lancering = true;

int ran_rood = int(random(0,3));
int ran_groen = int(random(0,3));
int ran_blauw = int(random(0,3));
float rood[] = {255,150,10};
float groen[] = {255,150,10};
float blauw[] = {255,150,10};



void setup() {
  size(800, 500);
  colorMode(RGB, 255, 255, 255, 100);
  psystems = new ArrayList();
  smooth();
  achtergrond = loadImage("city.png");

}

void draw() {
  background(200);
  image(achtergrond, 0,0);
  fill(200);
  y -=3;  
  s -=0.2;
 
  
Vuurwerk();

 //   float x =random(10,600);

  // Cycle through all particle systems, run them and delete old ones
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem psys = (ParticleSystem) psystems.get(i);
    psys.run();
    if (psys.dead()) { //wanneer de boolean dead in de particle system true is, herstart lancering
      psystems.remove(i);
      lancering = true;
      y = 480;
      s = y/20;
    }
  }

}

void Vuurwerk() { 

  float q = random(20,175);    //random waarde om de particles te laten ontploffen
  if (lancering == true){
    fill(0);
    ellipse(ranX,y,s,s);     //ellipse als vuurwerk

    if (y < q){              //wanneer y kleiner is dan q, zal de explosion optreden
      s = 0;
      psystems.add(new ParticleSystem(int(random(75,150)),new PVector(ranX,y)));    //explosion
      lancering = false;
      ranX = int(random(10,600));
      ran_rood = int(random(0,3));
      ran_groen = int(random(0,3));
      ran_blauw = int(random(0,3));
      }      
    } 
}

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  // One constructor
  Particle(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 100.0;
  }
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-2,2),random(-4,0),0);
    loc = l.get();
    r = random(10,20);
    timer = 100.0;
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;

  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(255,timer);
    fill(rood[ran_rood],groen[ran_groen],blauw[ran_blauw],timer);
    ellipse(loc.x,loc.y,r,r);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
       particles.add(new Particle(origin));       
    }
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(Particle p) {
    particles.add(p);
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

