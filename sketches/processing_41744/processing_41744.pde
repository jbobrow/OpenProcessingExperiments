
int numParticles = 400;


GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = random(-5, -3);

    //This shows what particles will draw on the screen
    if (random(10) > 5) {
      p[i] = new WillParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else {
      p[i] = new HarrisonParticle(width/2, height, velX, velY, 5.0, width/2, height);
    }
  }
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class HarrisonParticle extends GenParticle {
  float age;

  HarrisonParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age ++; // age is used for color
  }

  void display() {
    color c = lerpColor(color(255, 130, 225, 30), color(255, 255, 255, 5), age * 0.005);
    fill(c);
    triangle(x, y, random(150, 60), random(140, 80), random(150, 60), random(150, 80));
    radius+=0.25; // radius gradually gets bigger
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
      radius = 5.0;
      age = 0;
    }
  }
}


class WillParticle extends GenParticle {
  float age;

  WillParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = 0; // age is used for color; water starts off blue and gradually turns to white and very transparent (vapor)
  }

  //ellipse start at the middle and shoot up then down
  void display() {
    color c = lerpColor(color(60, 130, 225, 30), color(255, 255, 255, 5), age * 0.005);
    fill(c);
    ellipse(x, y, radius, radius);
    radius+=0.25; 
    age++;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.5, 0.5);
      vy = random(-7.0, -5.0);
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


