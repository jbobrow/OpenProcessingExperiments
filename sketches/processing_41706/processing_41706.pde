
int numParticles = 50;

GenParticle[] p = new GenParticle[numParticles];

//Set up basic parameters (origins, velocities, etc.)

void setup() {
  size (150, 600);
  noStroke ();
  smooth ();

  for (int i = 0; i < p.length; i++) {
    float velX = i;
    float velY = i;

    if (random(50) >= 25) {
      p[i] = new rParticle((width/2) + 20, height, velX, velY, 5.0, (width/2) + 20, height);
    }
    else {
      p[i] = new cParticle((width/2) - 20, height, velX, velY, 5.0, (width/2) - 20, height);
    }
  }
}

int r = 20;

//Slow down drawing with frameRate(), set parameters for background

void draw() {
  frameRate(r);
  fill(30, 25);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();    
  }
r += .05;
}

//Set up subclass of GenParticle, cParticle. Adopts the same parameters and adds onto them.

class cParticle extends GenParticle {
  float age;

  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0; 
  }

  void display() {
    color c = lerpColor(color(60, 130, 225, 30), color(255, 255, 255, 5), age * 0.001);
    fill(c);
    ellipse(x, y, radius, radius);
    radius++;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-5.0, 7.0);
      radius = 5.0;
      age = 0;
    }
  }
}

//Set up subclass of GenParticle, rParticle. Adopts the same parameters and adds onto them.

class rParticle extends GenParticle {
  float age;

  rParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    color c = lerpColor(color(60, 130, 225, 30), color(255, 255, 255, 5), age * 0.001);
    fill(c);
    ellipse(x, y, radius, radius);
    radius += 5;
    age+=50;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-5.0, 7.0);
      radius = 5.0;
      age = 0;
    }
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
      vx = 100;
      vy = random(-0.4, 0.5);
    }
  }
}


class Particle {
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 4.75;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {
    vy += vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}


