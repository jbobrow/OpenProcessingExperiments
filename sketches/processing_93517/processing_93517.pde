
ParticleSystem ps;
int col;

void setup() {
  size(500,500);
  smooth();
  ps = new ParticleSystem(new PVector(width/5,height/7));
}

void draw() {
  background(0);
  if(mousePressed) {
    col = random(0,255);
  } else {
    ps.addParticle();
    ps.run();
  }
}

class Particle {
  PVector position;
  PVector temp;
  PVector speed;
  float lifespan;

  Particle(PVector l) {
    distance = new PVector(0,0.5);
    temp = new PVector(random(-2,4),random(-2,0));
    position = l.get();
    lifespan = 255.0; //color transparency
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    temp.add(distance);
    position.add(temp);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255,col,255,lifespan);
    fill(255,col,col,lifespan);
    ellipse(position.x+(random(-30,30)), position.y+(random(-30,30)),8,8);
     // wird relativ zur eigenen Position platziert, dadurch wirkt es weniger zufaellig
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}


class ParticleSystem {
  ArrayList<Particle> particles;
  PVector place;

  ParticleSystem(PVector location) {
    place = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(new PVector(mouseX, mouseY)));
    // jedes neue Partikel kriegt beim Erzeugen die aktuelle Mausposition mitgeliefert
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

