
/*
Adapted from http://openprocessing.org/visuals/?visualID=10857
by Dan Bernier*/

PImage img;

import ddf.minim.*;
//Variable for audioplayer
AudioPlayer player;
Minim minim;
PVector gravity = new PVector(4, -3);
// Wind vector (set in the draw function)
PVector wind;
// Magnitude of the wind in each axis (sign is irrelevant)
PVector windAmount = new PVector(0.5, 0.5);
float particleAccDamp = 0.04;
int maxParticles = 900;
int maxParticleAge = 20;
int addParticlesPerFrame = 30;
 
// Overall time parameter (incremented by dt at each draw)
float t = 0;
float dt = 0.05;
// Since we need two dimensions of noise, we put a big offset between
// what sections of Perlin noise we grab; this is that offset.
float noiseOffset = 500;
 
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
     
    float w = 250;
    float pow = 1;
    float wPow = pow(w, pow);
    // Normally 35, 160
    float base = 45;
    float tip = 15;
     
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
  size(500, 500, P2D);
  //start sound library
  minim = new Minim(this);
  player = minim.loadFile("fire.mp3", 2048);
  player.loop();
  img = loadImage("Liberty.jpg");
  noStroke();
  smooth();
  frameRate(30);
  colorMode(HSB);

  particles = new ArrayList();
}
 
void draw() {
  image(img,0,0);
  
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
  float lx0 = 210 ;
  float lx1 = 200;
  float ly0 = 150;
  float ly1 = 50;
  float vx = random(-3,3);
  float vy = random(-3, 0);
  float lx = random(lx0, lx1);
  float ly = random(ly0, ly1);
  return new Particle(lx, ly, vx, vy, 0, 0);
}
void stop(){
  //always close audio classes when done
  player.close();
  minim.stop();
  super.stop();
}

