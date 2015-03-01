

// A simple Particle class, renders the particle as an image

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  PImage img;

  Particle(PVector l,PImage img_) {
    acc = new PVector(0,0);
    float vx = random(1,2);
    float vy = random(-2,-5);
    vel = new PVector(vx,vy);
    loc = l.get();
    lifespan = 100.0;
    img = img_;  //imagen como particula
  }

  void run() {
    update();
    render();
  }
  
  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void applyForce(PVector f) {
    acc.add(f);
  }  

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 1.0;
    acc.set(0,0); // clear Acceleration
  }

  // Method to display
  void render() {
    imageMode(CENTER);
    //tntamos la imagen con el alfa y el tiempo de vida de la particula
    tint(180,lifespan);
    image(img,loc.x,loc.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed
  PImage img;
  
  ParticleSystem(int num, PVector v, PImage img_) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v.get();                                   // Store the origin point
    img = img_;
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin, img));         // Add "num" amount of particles to the arraylist
    }
  }

  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    // Enhanced loop!!!
    for (Particle p: particles) 
      p.applyForce(dir);   
  }  
  void addParticle() {
    particles.add(new Particle(origin,img));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  



}



/*************************

Alumno: Ignacio Dolz Monzó
Ejercicio: Simula el efecto humo de un sistema de particulas, que se consigue con el alpha y el blur.
con interaccion del viento.
Asignatura: simulación. 
Centro: Universidad de valencia Ingeniería multimedia

************************/
//main
ParticleSystem ps;
float dt=0.2;
int part=100;
PVector wind;

void setup() {
  size(460,500);
  PImage img = loadImage("texture.png");
  ps = new ParticleSystem(part,new PVector(width/2,height-60),img);
}


void draw() {
  background(0);
 float dx = map(mouseX,0,width,-0.2,0.2);
  wind = new PVector(dx*0.2, 0);
  drawVector(wind, new PVector(width/2,70,0),15);
  
ps.run();
 ps.addParticle();
   ps.applyForce(wind);
  }
  
// Renders a vector object 'v' as an arrow and a location 'loc'
void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}





