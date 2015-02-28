
//this code is taken and modified from the lab demo GenParticleDemo. 
//i do not quite understand classes yet.

PImage pic;
int numParticles = 100;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
   size(500, 440);
  pic = loadImage("mies.jpg");
  background(pic);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float vx = random(-1, 1);
    float vy = -i;
// Inputs: x, y, x-velocity, y-velocity,
// radius, origin x, origin y
    p[i] = new GenParticle(355, 215, vx-1, vy-1, 2.0, 355, 215);
  }}

void draw() {

  background(pic);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }}


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = -.0001;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {
    fill(155,30);
    ellipse(x, y, radius*3, radius*3);
    ellipse(x,y,10,10);
  }}


class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
        (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-.2, .2);
      vy = random(-1, .01);
    }}}

class SmokeParticle extends Particle {
  float originX, originY;

  SmokeParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
        (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-2, -1);
      vy = random(-1, .01);
    }}}

