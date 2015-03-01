
float gravity = 1;
float deltaT = 0.7;
float damping = 0.7;
int MAX_PARTICLES = 1000;
Particle[] ptcR, ptcL;
void setup()
{
  size(1200, 600);
  // initialise particles
  ptcR = new Particle[MAX_PARTICLES]; 
  ptcL = new Particle[MAX_PARTICLES]; 
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    ptcR[cnt] = new Particle(  (width/2 ), random(0, height), random(30, 60));
    ptcL[cnt] = new Particle( (width/2), random(0, height), random(30, 60));
  }
}
void draw()
{ 
  background(0);
  int cnt = MAX_PARTICLES; 
  while (--cnt >=0) {
    float forceR =  0;
    float forceL =  0;
if (mousePressed) {
      float distR = mouseY-ptcR[cnt].y;
      float distL = mouseY-ptcL[cnt].y;
      if (abs(distR)<100) forceR = map(abs(distR), 0, 100, -100, 0);
      if (abs(distL)<100) forceL = map(abs(distL), 0, 100, 100, 0 );
    }
    ptcR[cnt].update1(forceR, gravity);
    ptcL[cnt].update2(forceL, -gravity);
    ptcR[cnt].draw();
    ptcL[cnt].draw();
  }
}

class Particle {
  float x, y; // position
  float vx, vy; // velocity 

    float m; // mass
  int r, g, b; // color
  Particle (float xpos, float ypos, float mass) { 
    x = xpos;
    y = ypos;
    m = mass;
  }
  void update1(float fx, float gravity) { // velocty update
    vx += deltaT * (gravity + fx/m); 
    // position update 
    x += deltaT * vx; 

    if (x>width/2) {
      x = width/2;
      vx = -damping*vx;
    }
  }
  void update2(float fx, float gravity) { // velocty update
    vx += deltaT * (gravity + fx/m); 
    // position update 
    x += deltaT * vx; 

    if (x<width/2) {
      x = width/2;
      vx = -damping*vx;
    }
  }

  void draw() {
   
    colorMode(HSB, 360, 100, 100);
      
    float h= map(y, 0, height, 0, 360);
    stroke(h, 100, 100); 
    strokeWeight(5); 
    point(x, y);
  }
}

