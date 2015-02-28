
import java.util.Iterator;

ParticleSystem ps;


void setup() {
  size(800, 800);
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  background(36, 83, 197);

  PVector mpos = new PVector(mouseX, mouseY);
  ps.emitterLocation(mpos);


  ps.addParticle();
  ps.run();
}

class ParticleSystem {
    ArrayList particles;
    PVector origin;

    ParticleSystem(PVector location) {
        origin = location.get();
        particles = new ArrayList();
    }

    void emitterLocation(PVector mpos) {
        origin = mpos.get();
    }

    void addParticle() {
        particles.add(new Particle(origin));
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

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector(); 
    velocity = new PVector(random(0, 5)-2.5, random(0, 5));
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  void display() {
    noStroke();
    fill(250, lifespan);
    ellipse(location.x, location.y, 8, 8);  
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }

}
