
int numParticles = 800;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 8);
    float velY = random(-1, 4);

    if (random(10)> 2) {
      //Blue Particles...Along the bottom origin on right...horzontal
      p[i] = new CeliParticle( width, height, velX, velY, 8.0, width/4, height);
    }
    else {
      //Purple Particles.. From top to bottom origin at the end in the center...vertical
      p[i] = new BolloParticle(width, height, velX, velY, 4.0, width, height/2);
    }
  }
}
void draw() {
  fill(0, 255);
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class CeliParticle extends GenParticle {
  float age;

  CeliParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }
  //Blue ellipse...really bright
  void display() {
    color c = lerpColor(color(0, 0, 255), color(100, 10, 10, 0), age * 0.008);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+= 0.4;
    age++;
  }
  //Its an explosion of blue ellipses
  void regenerate() {
    if ((x > width + radius) || ( x < radius) ||
      (y > height + radius) || (y < radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 8);
      vy = random(-5, 4);
      radius = 4.0;
      age = 0;
    }
  }
}

class BolloParticle extends GenParticle {
  float age;

  BolloParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super (xIn, yIn, vxIn, vyIn, r, ox, oy);
    age= random(40, 80);
  }

  //Purple Ellipses...lighter
  void display() {
    color c = lerpColor(color(150, 0, 255), color(0, 80, 10, 100), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }
  //Keeps going but its less than the blue ellipses
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-2, 4);
      vy = random(-8, -4);
      radius = 2.0;
      age = 0;
    }
  }
}

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;

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
      ellipse(x, y, radius*2, radius*2);
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
        vy = random(-8.0, -2.0);
      }
    }
  }


