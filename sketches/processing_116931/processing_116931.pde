
import java.util.Iterator;

ArrayList<ParticleSystem> systems;

Attractor a;


void setup() {
  size(800, 800);
  systems = new ArrayList<ParticleSystem>();
  a = new Attractor(400, 400, 50);
}

void draw() {
  background(36, 83, 197);

  a.display();

  // Datatype   variable name   :   array
  for (ParticleSystem ps: systems) {
    ps.run();
    ps.addParticle();
    ps.applyAttractor(a);
    // ps.applyForce(gravity);
  }
}

void mousePressed() {
    // Syntax for adding elements to an array list ( x.add () )
    systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}

class Attractor {
    PVector location;
    float mass;

    Attractor(float x, float y, float m) {
        location = new PVector(x, y);
        mass = m;
    }

    void display() {
        noStroke();
        fill(250);
        ellipse(location.x, location.y, 50, 50);
    }

    PVector attract(Particle p) {

        float c = 5;

        // Get the distance between the attractor and the object
        PVector force = PVector.sub(location, p.location);
        // Get the magnitude of the vector between them
        float distance = force.mag();
        distance = constrain(distance, 10, 50);
        // Normalize the vector
        force.normalize();
        // Calculate the magnitude of the new force
        float magnitude = (c * mass * p.mass) / (distance * distance);
        // Multiply the magnitude of the new force by the direction of the new force…
        // …to get the new force vector.
        force.mult(magnitude);
        return(force);

    }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;

  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector(); 
    velocity = new PVector(random(0, 5)-2.5, random(0, 5));
    lifespan = 255;
    mass = 10;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(250, lifespan);
    ellipse(location.x, location.y, 8, 8);  
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }

}

class ParticleSystem {

    ArrayList <Particle> particles;
    PVector origin;

    ParticleSystem(PVector location) {
        origin = location.get();
        particles = new ArrayList();
    }

    void addParticle() {
        particles.add(new Particle(origin));
    }

    void applyForce(PVector f) {
        for (Particle p: particles) {
          p.applyForce(f);
        }
      }

    void applyAttractor(Attractor a) {
        for (Particle p: particles) {
            PVector f = a.attract(p);
            p.applyForce(f);
        }
    }

    void run() {
        // Create an iterator to run through the array list
        // An iterator ensures that we access each object in the array list even while adding/removing objects
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
