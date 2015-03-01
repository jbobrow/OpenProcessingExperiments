
//particle
float deltaT = 0.7;
float gravity = -1;
float damping = 0.7;
int MAX_PARTICLES = 100;
Particle[] ptc;
void setup()
{
  size(600, 600, P2D);
  // initialise particles
  ptc = new Particle[MAX_PARTICLES];
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    ptc[cnt] = new Particle( random(0, width), random(0, height), 
    255, 255, 255, random(30, 60));
  }
}
void draw()
{
  //translate(width/2, height/2);
  background(0);
  int cnt = MAX_PARTICLES;
  while (--cnt >=0) {
    float force = 0, forceHorizontal = 0;
    if (mousePressed) {
      float dist = mouseX- ptc[cnt].x;
      if (abs(dist)<30) force = map(abs(dist), 0, 30, -gravity*100, 0);
      dist = mouseY- ptc[cnt].y;
      if (abs(dist)<30) forceHorizontal = map(abs(dist), 0, 30, -100, 100);
    }
    ptc[cnt].update(forceHorizontal, force);
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
    if (y< 0) {
      y = 0;
      vy = -damping*vy;
    }
    if (y> height) {
      y = height;
      vy = -damping*vy;
    }
    if (x> width) {
      x = width;
      vx = -damping*vx;
    } else if (x< 0) {
      x = 0;
      vx = -damping*vx;
    }
  }
  void draw() {
    stroke(r, g, b);
    strokeWeight(5);
    point(x, y);
  }
}
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
