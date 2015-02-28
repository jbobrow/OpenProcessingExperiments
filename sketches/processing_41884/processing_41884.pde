
int numParticles = 100;
GenParticle[] p = new GenParticle[numParticles];
burst[] b= new burst[numParticles/10];
boom[] m=new boom[numParticles*2];



//there are 3 subclasses yet I only use two

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
// Inputs: x, y, x-velocity, y-velocity,
// radius, origin x, origin y
    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
  }
  
  for (int j = 0; j < b.length; j++) {
    float velX = random(-1, 1);
    float velY = -j;
    b[j] = new burst(width/2, height/2, velX, velY, 5.0, width/2, height/2);
  }
  
  for (int k = 0; k < m.length; k++) {
    float velX = random(-1, 1);
    float velY = -k;
    m[k] = new boom(width/2, height/2, velX, velY, 5.0, width/2, height/2,.01);
  }

  
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  fill(191, 35,12);
  ellipse(width/2,height/2,50,50);
 
  
  for (int j = 0; j < b.length; j++) {
    b[j].update();
    b[j].regenerate();
    b[j].display();
  }
  
  for (int k = 0; k < m.length; k++) {
    m[k].update();
    m[k].regenerate();
    m[k].display();
  }
}












class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.01;

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
    rect(x, y, radius*2, radius*2);
  }
}








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
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}







class burst extends GenParticle {//this is the white moving across the screen
 
  burst(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  
   void display() {
     fill(255,255,255);
    ellipse(random(0,500), random(0,500), radius, radius);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
        (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-10.0, 10.0);
      vy = random(-10.0, -10.0);
    }
  }
}








class boom extends GenParticle {//this is the red particles
  float friction;
 
 boom(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy, float fy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    friction=fy;
  }
  
   void display() {
     fill(155,24,65);
   rect(x-4.5, y, radius/2, radius/2);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
        (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = (random(-10.0, 10.0));
      vy = (random(10.0, -10.0))*friction;
    }
  }
}



