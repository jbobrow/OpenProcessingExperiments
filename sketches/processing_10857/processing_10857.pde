
PVector gravity = new PVector(0, -1);
float particleAccDamp = 0.04;
int maxParticles = 1000;
int maxParticleAge = 15;
int addParticlesPerFrame = 30;

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  int age;
  
  Particle(float lx, float ly, float vx, float vy, float ax, float ay) {
    loc = new PVector(lx, ly);
    vel = new PVector(vx, vy);
    acc = new PVector(ax, ay);
    age = 0;
  }
  
  void draw() {
    fill(
      getColor(abs(loc.x-100), 1-(float)loc.y/height)  // 100 = width/2
    );
    ellipse(loc.x, loc.y, 5, 20);

    acc.set(100-loc.x, 0, 0);
    acc.mult(particleAccDamp);
    vel.add(acc);
    vel.add(gravity);
    loc.add(vel);
    age++;
  }
  
  // n = distance from center
  // h = from 0 to 1, 0 = near the base, 1 = near the tip 
  private color getColor(float n, float h) {
    
    float w = 30;
    float pow = 2;
    float wPow = pow(w, pow);
    float yellow = 35;
    float blue = 160;
    
    return color(
      lerp(
        lerp(yellow, blue, n/w),
        blue,
        h),
      map(pow(w-n, pow), 0, wPow, 0, 255),
      255,
      75
    );
  }
}

ArrayList particles;
void setup() {
  size(200, 200);
  noStroke();
  smooth();
  colorMode(HSB);
  background(0);
  particles = new ArrayList();
}

void draw() {
  background(0);
  if (particles.size() < maxParticles) {
    for (int i = 0; i < addParticlesPerFrame; i++) {
      particles.add(freshParticle());
    }
  }
  
  Particle p;
  for (int i = 0; i < particles.size(); i++) {
    p = (Particle)particles.get(i);
    p.draw();
    if (p.age > maxParticleAge) {
      particles.set(i, freshParticle());
    }
  }
}

Particle freshParticle() {
  return new Particle(100, 180, 
                      random(-3, 3), random(-3, 0), 
                      0, 0);
}

