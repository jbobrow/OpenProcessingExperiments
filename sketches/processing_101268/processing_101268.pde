
/* @pjs preload='background2.png,right.png' */ 
ArrayList<ParticleSystem> systems; 
PImage bg;
PImage right;
int counter = 0;


float [] a = new float [25];
float [] b = new float [25];

void setup() {
  size(370,985);
  
  bg = loadImage("background2.png");
  right = loadImage("right.png");
 
  systems = new ArrayList<ParticleSystem>();
  
  smooth();
  noStroke();
  
  for (int i = 0; i<25; i++) {
    a[i] = 0;
    b[i] = 0;
  }

}

void draw() {
  background(bg);
  
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
  }
    
  for (int i=0; i<24; i++) {
    a[i] = a [i+1];
    b[i] = b [i+1];
     
    fill (255); 
    ellipse (a[i], b[i], i/10, i/10);
     
                            }
   
  a[24] = mouseX;
  b[24] = mouseY; 
  
  
}

void mousePressed() {
  
  if (mouseX >=105 & mouseX <=135 ){
   
     for (int x1 = 0; x1 < 1; x1++) {//controlls the ammount of windows broken off with one click
       systems.add(new ParticleSystem(1, new PVector(random(105,130), random(850,865))));//second building from the left
     }
  }
  if (mouseX <=224 & mouseX >=174 & mouseY > 840 & mouseY<930){
    for (int x2 = 0; x2 < 7; x2++) {//controlls the ammount of windows broken off with one click
  systems.add(new ParticleSystem(1, new PVector(random(174,224), random(840,890))));//central building
    }
  }
   if (mouseX >=51 & mouseX <=78 ){
     for (int x3 = 0; x3 < 2; x3++) {//controlls the ammount of windows broken off with one click
  systems.add(new ParticleSystem(1, new PVector(random(55,78), random(892,910))));//very left building
     }
  }
  if (mouseX >=148 & mouseX <=199 & mouseY >941 ){
     for (int x3 = 0; x3 < 3; x3++) {//controlls the ammount of windows broken off with one click
  systems.add(new ParticleSystem(1, new PVector(random(148,199), random(941,990))));//middle front building
     }
  }
  if (mouseX >=268 & mouseX <=305 & mouseY >885 & mouseY <930 ){
     for (int x4 = 0; x4 < 2 ; x4++) {//controlls the ammount of windows broken off with one click
  systems.add(new ParticleSystem(1, new PVector(random(268,305), random(885,910))));//second building from the right
     }
  }
  if (mouseX >=339 & mouseX <=358 & mouseY >927 & mouseY <985 ){
      for (int x5 = 0; x5 < 1; x5++) {//controlls the ammount of windows broken off with one click
  systems.add(new ParticleSystem(1, new PVector(random(339,358), random(927,935))));//last building on the right
     }
  }
  
}

void mouseMoved(){
    if (mouseX >=105 & mouseX <=135 & mouseY >850 & mouseY <904|mouseX <=224 & mouseX >=174 & mouseY >840 & mouseY<930|mouseX >=51 & mouseX <=78 & mouseY >892 & mouseY <990|mouseX >=148 & mouseX <=199 & mouseY >941 & mouseY<990|mouseX >=268 & mouseX <=305 & mouseY >885 & mouseY <930|mouseX >=339 & mouseX <=358 & mouseY >927 & mouseY <983 ){//second build from right
      cursor(HAND);
       }else { cursor(ARROW);
       }
  
}

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,-0.01);
    velocity = new PVector(random(0,0),random(-1,0));
    location = l.get();
    lifespan = 560.0; // change this value to increase/decrease stream
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    //stroke(255,lifespan);
    //fill(255,lifespan);
    tint(255, lifespan);
    image(right,location.x,location.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }

}


// An ArrayList is used to manage the list of Particles

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.get();       // Store the origin point
     
     for (int i = 0; i < num; i++) {
     particles.add(new Particle(origin));
     }
       
   
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    Particle p;
    // Add  a Particle to the system
    if (counter == 10){
    p = new Particle(origin);
   
    particles.add(p);
    counter = 0;
      } 
      else {
       counter++;
       }  
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}



