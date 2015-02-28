
/*
Credit is due! This derives from:
http://openprocessing.org/visuals/?visualID=10857 by Dan Bernier

I felt like this looked its best when the flame immediately started, but
lost much of its interest following that because the flame was too calm.
So I perturbed the flame a bit.
*/

PVector gravity = new PVector(0, -1);
// Wind vector (set in the draw function)
PVector wind;
// Magnitude of the wind in each axis (sign is irrelevant)
PVector windAmount = new PVector(1.5, 0.5);
float particleAccDamp = 0.04;
int maxParticles = 1000;
int maxParticleAge = 20;
int addParticlesPerFrame = 30;

// Overall time parameter (incremented by dt at each draw)
float t = 0;
float dt = 0.05;
// Since we need two dimensions of noise, we put a big offset between
// what sections of Perlin noise we grab; this is that offset.
float noiseOffset = 1000;

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
    vel.add(wind);
    
    loc.add(vel);
    age++;
  }
  
  // n = distance from center
  // h = from 0 to 1, 0 = near the base, 1 = near the tip 
  private color getColor(float n, float h) {
    
    float w = 30;
    float pow = 2;
    float wPow = pow(w, pow);
    // Normally 35, 160
    float base = 0;
    float tip = 60;
    
    return color(
      lerp(
        lerp(base, tip, n/w),
        tip,
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
  frameRate(30);
  colorMode(HSB);
  background(0);
  particles = new ArrayList();
}

void draw() {
  background(0);
  
  // Set the level of the wind (Perlin noise, for continuity reasons)
  // Noise by default is side-to-side only.
  float wind_x = noise(t, 0, 0) - 0.5;
  float wind_y = noise(t, 0, noiseOffset) - 0.5;
  wind = new PVector(wind_x, wind_y);
  wind.mult(windAmount);
  
  
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
  t += 0.1;
}

Particle freshParticle() {
  // Next 4 parameters: X and Y ranges for particle spawning
  float lx0 = width/2 - 10;
  float lx1 = width/2 + 10;
  float ly0 = height - 20;
  float ly1 = height - 10;
  float vx = random(-3, 3);
  float vy = random(-3, 0);
  float lx = random(lx0, lx1);
  float ly = random(ly0, ly1);
  return new Particle(lx, ly, vx, vy, 0, 0);
}

