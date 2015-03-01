
float deltaT = 0.7;
float gravity = 1;
float damping = 1;
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
    if (mousePressed) {
      float dist = mouseX- ptc[cnt].x;
      if (abs(dist)<50) force = map(abs(dist), 0, 30, -100, 0);
    }
    ptc[cnt].update(0, force);
    ptc[cnt].draw();
  
rect(10,10,20,60);
rect(20,15,20,5);
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
   pushMatrix();
   translate(0,0);
   //float t = map(mouseX, 0, width, 0, 360);
   rotate(random(0,90));
   stroke(255);
strokeWeight(1);
point(x, y);
popMatrix();


  }
}

