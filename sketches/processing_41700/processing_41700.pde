
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];

void setup()  {
  size(400, 400);
  colorMode(RGB);
  for (int i = 0; i < p.length; i++)  {
   
    float velX = random(-4, -2);
    float velY = random(-1, 1);
     if (random(4) > 2)  {
    p[i] = new MistParticle(width/2, height/2, velX, velY, 10, width/2, height/2);
    }
    else  {
    p[i] = new WaterParticle(width/2, height/2, velX, velY, 10, width/2, height/2);
    }
  }
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
 
class Particle {
  float x, y; 
  float vx, vy; 
  float radius; 
  float speed = 2;
  float accel = -.1;
 
  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }
 
  void update() {
    vy = vy;
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
 class MistParticle extends GenParticle { 
 
  MistParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      // sets the x & y origin
      x = width/6;
      y = height/10;
      // sets the x & y velocities, particles fall twice as much in y axis
      vx = random(-1, 5);
      vy = random(-1, 10);
    }
  }
  void display() {
    fill(42,77,198);
    rect(x, y, random(10), random(10));
  }
}
class WaterParticle extends GenParticle { 
 
  WaterParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
  void regenerate() {
    if ((x > width) || (x < -width) ||
      (y > height) || (y < -height)) {
      x = width;
      y = height;
      vx = random(-1, 10);
      vy = random(-1, 1);
    }
  }
  void display() {
    fill(12, 33, 108,random(80,100));
    rect(random(width/4), random(height), random(50,60), random(50,60));
  }
}

      

