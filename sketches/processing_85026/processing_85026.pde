
SplosionManager michaelBay;
int counter = 0;

void setup() {
  size (400, 400);
  michaelBay = new SplosionManager();
}

void draw() {
  counter ++;
  if (counter > 5) {
    michaelBay.addSplosion(random(width), random(height));
    counter = 0;
  }

  background(0);
  michaelBay.update();
  michaelBay.draw();
}

void mousePressed() {
  michaelBay.addSplosion(mouseX, mouseY);
}


class SplosionManager {
  ArrayList particles;

  int minParticles = 20;
  int maxParticles = 40;

  float minSpeed = 0.1;
  float maxSpeed = 0.4;

  float particleDuration = 1000;

  SplosionManager() {
    particles = new ArrayList();
  }

  void addSplosion(float x, float y) {
    int nParticles = (int)random(minParticles, maxParticles+1);
    for (int i = 0; i < nParticles; i++) {
      SplosionParticle particle = createParticle(x, y);
      particles.add(particle);
    }
  }

  void update() {
    float timeDiff = 1000.0/frameRate;
    this.update(timeDiff);
  }

  void update(float timeDiff) {
    for (int i = particles.size()-1; i >= 0 ; i--) {
      SplosionParticle p = (SplosionParticle)particles.get(i);
      p.update(timeDiff);
      if (p.timeToLive > particleDuration) {
        particles.remove(i);
      }
    }
  }

  void draw() {
    noStroke();
    for (int i = 0; i < particles.size(); i++) {
      SplosionParticle p = (SplosionParticle)particles.get(i);
      fill(255, map(p.timeToLive, 0, particleDuration, 255, 0));
      ellipse(p.x, p.y, 10, 10);
    }
  }

  SplosionParticle createParticle(float x, float y) {
    float speed = random(minSpeed, maxSpeed);
    float angle = random(TWO_PI);
    SplosionParticle particle = new SplosionParticle();
    particle.x = x;
    particle.y = y;
    particle.speedX = speed * cos(angle);
    particle.speedY = speed * sin(angle);
    return particle;
  }

  class SplosionParticle {
    float timeToLive;
    float x;
    float y;
    float speedX;
    float speedY;

    SplosionParticle() {
    }

    void update(float timeDiff) {
      timeToLive += timeDiff;
      x += speedX * timeDiff;
      y += speedY * timeDiff;
    }
  }
}
