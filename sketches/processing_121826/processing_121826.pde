
ParticleSystem ps;
int numParticle = 120;

void setup() {
  size(800,800);
  ps = new ParticleSystem();
  colorMode(HSB,255,100,100);
}

void draw() {
  background(0);
  ps.draw();
}

void mouseClicked() {
  ps.reset();
}

class ParticleSystem {
  Particle[] particle;
  int hueBase;

  ParticleSystem() {
    particle = new Particle[numParticle];
    reset();
  }

  void reset() {
    for (int i = 0; i < numParticle; i++) {
      particle[i] = new Particle();
    }
    hueBase = (int)random(255);
  }

  void draw() {
    PVector target = new PVector(mouseX, mouseY);
    for (Particle p : particle) {
      p.update(target);
    }
    for (Particle p : particle) {
      float m = 10000;
      Particle pp = null;
      for (Particle p2 : particle) {
        if (p != p2.neighbor && p.magnitude < p2.magnitude && m > p2.magnitude) {
          m = p2.magnitude;
          pp = p2;
        }
      }
      p.neighbor = pp;
    }
    for (Particle p : particle) {
      p.draw(hueBase);
    }
  }
}

class Particle {
  PVector pos;
  Particle neighbor;
  float magnitude, magVelocity, radVelocity;

  Particle() {
    pos = new PVector(random(width),random(height));
    magVelocity = random(0.3,0.8);
    radVelocity = random(0.005,0.015);
  }

  void update(PVector target) {
    pos.sub(target);
    magnitude = pos.mag();
    if (magnitude < 10) {
      pos.set(random(width),random(height),0);
      pos.sub(target);
      magnitude = pos.mag();
    }
    float rad = pos.heading2D();
    //float rad = atan2(pos.y, pos.x);
    magnitude -= magVelocity;
    rad += radVelocity;
    if (rad < 0) rad += TWO_PI;
    if (rad > TWO_PI) rad -= TWO_PI;
    pos.x = target.x + cos(rad) * magnitude;
    pos.y = target.y + sin(rad) * magnitude;
    neighbor = null;
  }

  void draw(int hueBase) {
    float h = (frameCount / 10) % 255;
    h = hueBase + map(magnitude,0,800,h,h+50);
    if (h > 255) h -= 255;
    
    float b = map(magnitude,0,800,10,100);
    noFill();
    stroke(h,80,b,150);
    strokeWeight(1);
    if (neighbor != null) line(pos.x,pos.y,neighbor.pos.x,neighbor.pos.y);

    b = map(magnitude,0,500,5,100);
    stroke(h,80,b);
    float w = map(magnitude,0,500,3,10);
    strokeWeight(w);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, w*2, w*2);
  }
}

