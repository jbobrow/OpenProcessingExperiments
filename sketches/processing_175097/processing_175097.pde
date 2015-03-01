
float deltaT = 0.7;
float gravity = 1;
float damping = 0.7;
int MAX_PARTICLES = 10000;
Particle[] ptc;
void setup()
{
  size(600, 600, P2D);
  // initialise particles
  ptc = new Particle[MAX_PARTICLES];
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    ptc[cnt] = new Particle( random(0, width), random(0, height), 
    (int)random(0, 255), (int)random(0, 255), (int)random(0, 255), random(30, 60));
  }
}
void draw()
{
  background(0);
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    float force = 0;
    if (keyPressed) {
      if (keyCode == RIGHT) {
        float dist = width - ptc[cnt].x;
        if (abs(dist)<30) force = map(abs(dist), 0, 30, -100, 0);
      } else if ( keyCode == DOWN) {
        float dist = width/2 - ptc[cnt].x;
        if (abs(dist)<30) force = map(abs(dist), 0, 30, -100, 0);
      }
    } else if (keyCode ==LEFT) {
      float dist = ptc[cnt].x;
      if (abs(dist)<30) force = map(abs(dist), 0, 30, -100, 0);
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
  void update(float fx, float fy) {
    // velocty update
    vx += deltaT * (ax + fx/m);
    vy += deltaT * (ay + fy/m);
    // position update
    x += deltaT * vx;
    y += deltaT * vy;
    if (y> height) {
      y = height;
      vy = -damping * vy;
    }
  }
  void draw() {
    stroke(r, g, b);
    strokeWeight(5);
    point(x, y);
  }
}

