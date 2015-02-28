
ArrayList<Particle> particles;

void setup() {
  size(500,500);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(0,0,64);
  //[offset-down] A new Particle object is added to the ArrayList every cycle through draw().
  
  float x= sin(map(millis()%1000, 0, 1000, 0, 2*PI));
  float y= cos(map(millis()%1000, 0, 1000, 0, 2*PI));
  x= map (x, -1.2, 1.2, 0, width );
  y= map (y, -1.2, 1.2, 0, height );
  
  particles.add(new Particle(new PVector(x,y)));

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
 
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-1,1));
    location = l.get();
    lifespan = 255.0;
  }

  // Sometimes it’s convenient to have a “run”
  // function that calls all the other functions we need.
  void run() {
    update();
    display();
  }

  void update() {
    //velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  void display() {
    //stroke(255,lifespan);
    noStroke();
    fill(0,255,255,lifespan);
    ellipse(location.x,location.y,lifespan/11,lifespan/11);
  }

  // Is the Particle alive or dead?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

