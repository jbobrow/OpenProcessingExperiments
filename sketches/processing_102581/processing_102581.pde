
int PARTICLES_NUMBER = 1;
int OBSTACLES_NUMBER = 30;
float TOPSPEED = 2;
boolean BOUNCE_OF_WALLS = true;
boolean GRAVITY = true;

ArrayList<Particle> particles;
ArrayList<Particle> obstacles;

void setup() {
  size(640, 480);
  background(255);
  particles = new ArrayList<Particle>();
  obstacles = new ArrayList<Particle>();
  for (int i = 0; i < OBSTACLES_NUMBER; i++) {
    obstacles.add(new Particle(random(width), random(height), 0.0, 0.0, 0.0, 0.0, 100, 100));
  }
  for (int i = 0; i < PARTICLES_NUMBER; i++) {
    Particle p = new Particle();
    if (checkParticle(p))
      particles.add(p);
    else i--;
  }
}

boolean checkParticle(Particle p) {
  for (Particle o: obstacles) {
    if (distance(p, o) < (p.d + o.d)/2) {
      return false;
    }
  }
  return true;
}

void draw() {
  background(255);
  for (Particle p: particles) {
    p.display();
    p.update();
  }
  for (Particle p: obstacles) {
    p.display();
  }
  showLegend();
  if (mousePressed) {
    Particle p = new Particle(); 
    p.x = mouseX; 
    p.y = mouseY; 
    if (checkParticle(p))
      particles.add(p);
  }
}

class Particle {
  double x, y;
  double vx, vy;
  double ax, ay;
  double mass;
  int d;
  int r, g, b;

  boolean bounced = false;

  Particle() {
    x = random(10, width-10);
    y = random(10, height-10);
    vx = random(-TOPSPEED, TOPSPEED);
    vy = random(-TOPSPEED, TOPSPEED);
    ax = 0.0;
    ay = 0.0;
    if (GRAVITY) ay = 0.09;
    d = 10;
    mass = 0.01;
    r = (int) random(255);
    g = (int) random(255);
    b = (int) random(255);
  }

  Particle(double x, double y, 
  double vx, double vy, 
  double ax, double ay, 
  double mass, int d) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.mass = mass;
    this.d = d;
  }

  void display() {
    fill(r, g, b);
    ellipse((int)x, (int)y, d, d);
  }

  void update() {
    for (Particle o: obstacles) {
      double dx = o.x - x;
      double dy = o.y - y;
      double dist = distance(this, o);
      if ((dist <= (o.d + d)/2) && !bounced) {
        bounced = true;
        o.r = r; 
        o.g = g; 
        o.b = b;
        double dvx = o.vx - vx;
        double dvy = o.vy - vy;
        double dvdr = dx*dvx + dy*dvy;
        double F = 2 * o.mass * mass * dvdr / ((o.mass + mass) * dist);
        double fx = F * dx / dist;
        double fy = F * dy / dist;

        vx += fx / mass;
        vy += fy / mass;
      }
      if (dist > (o.d + d)/2) bounced = false;
    }
    vx += ax;
    vy += ay;
    constrain((float) vx, -TOPSPEED, TOPSPEED);
    constrain((float) vy, -TOPSPEED, TOPSPEED);
    x += vx;
    y += vy;

    if (BOUNCE_OF_WALLS) {
      if (x >= width || x <= 0) {
        if (x >= width) x = width;
        if (x <= 0)     x = 0;
        vx *= -0.95;
      }
      if (y >= height || y <= 0) {
        if (y >= height) y = height;
        if (y <= 0)      y = 0;
        vy *= -0.95; 
      }
    }
  }
}

double distance(Particle p1, Particle p2) {
  double dx = p1.x - p2.x;
  double dy = p1.y - p2.y;
  double dist = Math.sqrt(dx*dx + dy*dy);
  return dist;
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
}

void showLegend() {
  fill(255);
  rect(1, 1, 100, 35);
  fill(0);
  textFont(createFont("Arial", 12, true));
  text("Obstacles: ", 5, 15);
  text(obstacles.size(), 75, 15);
  text("Particles: ", 5, 30);
  text(particles.size(), 75, 30);
}



