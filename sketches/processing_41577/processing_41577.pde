
//Red & Blue Fireworks Finale
//Miles Thomas


int numParticles = 400; //Enough particles for a "finale"
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  for (int i=0; i<p.length; i++) {
    float velX = random(-5, 5);
    float velY = random(-10, -5);

    if (random(10) > 5) {
//blue fire starts on the right
      p[i] = new bFireParticle(300, 400, velX, velY, 10.0, 300, 400);
    }
    else {
//red fire starts on the right
      p[i] = new rFireParticle(100, 400, velX, velY, 5.0, 100, 400);
    }
  }
}
//Black background and update
void draw() {
  fill(20);
  rect(0, 0, width, height);
  for (int i=0; i<p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class bFireParticle extends GenParticle {
  float age;

  bFireParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
    
   //makes ellipses fade or "burn out"
    color c = lerpColor(color(0, 0, 255), color(0, 0, 2,20), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }


//resets origin to continue redrawing
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1.0;
      age = 0;
    }
  }
}

class rFireParticle extends GenParticle {
  float age;

  rFireParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0;
  }

  void display() {
//makes ellipses fade or "burn out"
    color c = lerpColor(color(255, 0, 0), color(2, 0, 0,20), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.20;
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-5, 5);
      vy = random(-10, -5);
      radius = 1.0;
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
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
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


