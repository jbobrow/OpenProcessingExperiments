
//Bryan Williams
//September 9, 2011
//Computational Methods
//Homework 7.2

//I wanted to create a composition which looked like blocks were sliding across a drawn horizontal grid.

int numParticles = 300; //number of rectangles in composition
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(600, 140);
  smooth();

  for (int i = 0; i < p.length; i++) {

    float velx = random(0, 6);//Velocity x
    float vely = random(0, 5);//Velocity y
    p[i] = new GenParticle(width, height, velx, vely, 6.0, width/2, height);
    p[i] = new ParticleBryan(width, height, velx, vely, 7.0, width, height);
    p[i] = new ParticleWilliams(width/2, height, velx, vely, 2.0, width, height);
  }
}

void draw() {
  fill(#B6E3FA); //background color clocks rectangle trail
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {

    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class Particle {
  float x, y;//xy points
  float vx, vy; // velocity xy
  float friction = 0.24;
  //controls the speed of the particles

  Particle(float xp, float yp, float velx, float vely, float Ray) {

    x = xp;
    y = yp;
    vx = velx;
    vy = vely;
  }

  void update() {
    x += vx;
    y += vy;
    vy = vy*friction;
  }
  void display() {
    noFill();//sets up orange rectangles which glide across the grid of horizontal lines
    stroke(#FC7029);
    strokeWeight(.4);
    rect(x/2, 0, 10, 20);
    rect(x/4, 20, 10, 20);
    rect(x/6, 40, 10, 20);
    rect(x/8, 60, 10, 20);
    rect(x/10, 80, 10, 20);
    rect(x/12, 100, 10, 20);
    rect(x/14, 120, 10, 20);
    fill(#2F29FC);//sets up blue horizontal lines
    noStroke();
    rect(50, 20, y, 2);
    rect(45, 40, y, 2);
    rect(40, 60, y, 2);
    rect(35, 80, y, 2);
    rect(30, 100, y, 2);
    rect(25, 120, y, 2);
  }
}

class GenParticle extends Particle {
  float originPointx, originPointy;

  GenParticle(float x, float y, float vx, float vy, float Ray, float ox, float oy) {
    super(x, y, vx, vy, Ray);

    originPointx = ox;
    originPointy = oy;
  }
  void regenerate() {

    if ((x > width)||(x < width)||
      (y > height)||(y < height)) {
      vy +=x;
      vx +=y;
      x = originPointx;
      y = originPointy;
    }
  }
}

class ParticleBryan extends GenParticle {

  float friction = 10;

  ParticleBryan(float xor, float yor, float vxor, float vyor, float r, float ox, float oy) {
    super(xor, yor, vxor, vyor, r, ox, oy);
    vy = vy/friction;
  }

  void regenerate() {

    if ((x > width)||(x < 2/width)||
      (y > height)||(y < 2/height)) {
        
      vx = random(-1.0, 25);
      vy = random(-1.0, 12);
      
      x = originPointx;
      y = originPointy;
    }
  }
}

class ParticleWilliams extends GenParticle {

  float friction = 0.6;

  ParticleWilliams(float xor, float yor, float vxor, float vyor, float r, float ox, float oy) {
    super(xor, yor, vxor, vyor, r, ox, oy);

    vy = vy/friction;
  }
  void regenerate() {
    if ((x > width*4)||(x < -width)||
      (y > height*4)||(y < -height)) {
        
      vx = random(-0.14, 1.0);
      vy = random(0, 2.0);
    }
  }
}


