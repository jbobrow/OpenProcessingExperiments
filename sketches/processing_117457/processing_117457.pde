
import java.util.Iterator;

Attractor a;
ArrayList <ParticleSystem> systems;

int numSystems;
int numParticles;
float attractorStrength;
float attractorMass;
float offset;

void setup() {
  background(0);
  size(800, 800);
  
  // CHANGE ME!
  
  // Number of emitters 
  numSystems = 30;
  // Number of particles per emitter
  numParticles = 10;
  // Increase the radius of the circle along which the emitters are positioned
  offset = 100;
  // Strength of the attractor's force
  attractorStrength = -2;
  // Mass of the attractor
  attractorMass = 100;

  // CREATE THE ARRAY LIST OF PARTICLE SYSTEMS
  systems = new ArrayList<ParticleSystem>();
  
  // DRAW PARTICLE SYSTEMS AROUND THE ATTRACTOR
  for (int i = 0; i < numSystems; i++) {
    systems.add(new ParticleSystem(new PVector( sin(radians( (360/numSystems)*i ))*offset+width/2, cos(radians( (360/numSystems)*i ))*offset+height/2)) );
  }

  // DETERMINE THE NUMBER OF PARTICLES TO BE EMITTED
  
  for (ParticleSystem ps: systems) {
    for (int i = 0; i < numParticles; i++) {
      ps.addParticles();
    }
  }

  // CREATE THE ATTRACTOR
  // Fields: x, y, mass, force coefficient
  a = new Attractor(width/2, height/2, attractorMass, attractorStrength);
}

void draw() {
  // background(0);
  noStroke();
  smooth();

  // For every ParticleSystem object in systemsÃ¢ï¿½Â¦(call it ps)
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.applyAttractor(a);
  }

}

void keyPressed() {
    if (key == 's') {
      save("frame.jpg");
    }
    if (key == ' ') {
      setup();
    }
}

class ParticleSystem {
    // Create an arraylist, particles, that holds particle objects
    ArrayList <Particle> particles;
    // The origin is passed to the particle so it knows where to originate from
    PVector origin;

    ParticleSystem(PVector location) {
        origin = location.get();
        particles = new ArrayList();
    }

    void addParticles() {
        particles.add(new Particle(origin));
    }

    void applyAttractor(Attractor a) {
        for (Particle p: particles) {
            PVector f = a.attract(p);
            p.applyForce(f);
        }
    }

    void applyForce(PVector f) {
        for (Particle p: particles) {
            p.applyForce(f);
        }
    }

    void run() {
        Iterator<Particle> it = particles.iterator();
        while (it.hasNext()) {
            Particle p = it.next();
            p.run();
            if (p.isDead()) {
                it.remove();
            }
        }
    }

}

class Particle {

PVector location;
PVector velocity;
PVector acceleration;

float lifespan;
float mass;
int seed;
float tf;
float rvalue;


Particle(PVector l) {
  
  location = l.get();
  acceleration = new PVector();
  velocity = new PVector(random(0, 5)-2.5, random(0, 5)-2.5);
  

  lifespan = 500;

  tf = 0;
  mass = int(random(5, 20));
  seed = int(random(0, 1000));
}

void run() {
  update();
  display();
}

void display() {

  // OPACITY OF THE PARTICLE
  noiseSeed(seed);
  float noiseValue;
  noiseValue = noise(tf);
  float fillValue = map(noiseValue, 0, 1, 10, lifespan);
  fill(255, fillValue);

  // DISPLAY THE PARTICLE
  ellipse(location.x, location.y, 1, 1);

}  

void applyForce(PVector force) {
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

void update() {
  velocity.add(acceleration);
  location.add(velocity);
  acceleration.mult(0);

  lifespan--;
  tf +=0.1;
}

Boolean isDead() {
  if (lifespan < 0) {
    return true;
  } else {
    return false;
  }
}
}

class Attractor {
    PVector location;
    float mass;
    float c;

    Attractor(float x, float y, float m, float _c) {
        location = new PVector(x, y);
        mass = m;
        c = _c;
    }

    void display() {
        fill(128, 0);
        ellipse(location.x, location.y, 300, 300);
    }

    PVector attract(Particle p) {


        // Get the distance between the attractor and the object
        PVector force = PVector.sub(location, p.location);
        // Get the magnitude of the vector between them
        float distance = force.mag();
        distance = constrain(distance, 20, 100);
        // Normalize the vector
        force.normalize();
        // Calculate the magnitude of the new force
        float magnitude = (c * mass * p.mass) / (distance * distance);
        // Multiply the magnitude of the new force by the direction of the new forceÃ¢ï¿½Â¦
        // Ã¢ï¿½Â¦to get the new force vector.
        force.mult(magnitude);
        return(force);

    }
}
