
//code based on simple particle systems in examples
int aposX, aposY, bposX, bposY;
ParticleSystem ps;
PGraphics buffer;
PImage img;
PVector bleedpoints[] = new PVector[0];

void setup() {
  size(800, 600);
  // Create an off-screen buffer.
  buffer = createGraphics(1920, 1080, JAVA2D);
  img = buffer.get(0, 0, buffer.width, buffer.height);
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  smooth();
  

}

void draw() {
    //background(0, 255, 0);
    //background(0);
    // combine old frame with new buffer

    buffer.beginDraw();
    buffer.tint(0, 255, 0, 50);
    buffer.image(img,0,0);
    buffer.noTint();
    buffer.endDraw();
    ps.run();
    
    
    for (int i = 0; i < bleedpoints.length; i++) {
      ps.addParticle(bleedpoints[i].x, bleedpoints[i].y); 
    }

    // draw stuff to buffer
    
    img = buffer.get(0, 0, buffer.width, buffer.height);
    image(img,0,0);
    //saveFrame();
}

void mousePressed() {
  bleedpoints  =  (PVector[]) append(bleedpoints, new PVector(mouseX, mouseY) ); 
   
}

class ParticleSystem {
  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born
  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
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
  
  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}




// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  color pcolor;
  float r;
  float timer;
  
  // Another constructor (the one we are using here)
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    float angle =  degrees(PVector.angleBetween(new PVector(-1,0),vel))*3;
    
    println("colour " + angle);
    float most = 100.0;
    colorMode(HSB, 360, 100, 100);
    pcolor = color(angle,most, most);   
    loc = l.get();
    r = 10.0;
    timer = 200.0;
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
   
      buffer.beginDraw();
      buffer.colorMode(HSB, 360, 100, 100);
      int opac = (int) (255); 
      buffer.ellipseMode(CENTER);
      buffer.stroke(0,255,255,100);  
      buffer.fill(pcolor,20);
      buffer.ellipse(loc.x,loc.y,opac/30,opac/30);
 
 // draw stuff to buffer
    buffer.endDraw();
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


