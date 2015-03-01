
float deltaT = 0.7;
float gravity = 1;
float damping = 1.1;
int MAX_PARTICLES = 500;
Particle[] ptc;
void setup()
{
  size(600, 600, P3D);
  // initialise particles
  ptc = new Particle[MAX_PARTICLES]; 
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    ptc[cnt] = new Particle( random(0, width), random(0, height), 
    (int)random(0, 100), (int)random(200, 255), (int)random(0, 100), random(20, 50));
  }
}
void draw()
{ 
  background(0);
  int cnt = MAX_PARTICLES; 
  while (--cnt >=0) {
    float force = 0;
    if (mousePressed) {
      float dist = mouseX- ptc[cnt].x;
      if (abs(dist)<20) force = map(abs(dist), 0, 20, -100, 0);
    }
    ptc[cnt].update(0, force);
    ptc[cnt].draw();
  }
}
class Particle {
  float x, y; // position
  float vx, vy; // velocity 
  float ax, ay; // acceleration 
  float m; // mass
  int r, g, b; // color
  Particle (float xpos, float ypos, int red, int gre, int blu, float mass) { 
    x = xpos;
    y = ypos;
    r = red;
    g = gre;
    b = blu;
    m = mass; 
    ax = 0;
    ay = gravity;
  }
  void update(float fx, float fy) { // velocty update
    vx += deltaT * (ax + fx/m); 
    vy += deltaT * (ay + fy/m);
    // position update 
    x += deltaT * vx; 
    y += deltaT * vy;
    if (y> height) {
      y = height;
      vy = -damping*vy;
    }
  }
  void draw() { 
    stroke(r, g, b); 
    strokeWeight(10); 
    point(x, y);
  }
}

