
int numParticles = 50;
GenParticle[] p = new GenParticle[numParticles];

float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.1;
  float stiffness = 0.1;
  float damping = 0.9;
  float velocity = 0.0;
  float targetY;
  
void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
// Inputs: x, y, x-velocity, y-velocity,
// radius, origin x, origin y
    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
  }
}

void draw() {
  rect(0, 0, width, height);//shapes and colors
  fill(67,209,205, 60);
   fill(185,67,209);
  rect(0, 0, width, height);
  fill(67,209,205,60);
  float force = stiffness * (x - y); 
  velocity = damping * (velocity + force);
  y += velocity;
  rect(x, y, width - 20, 12);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}


class Particle {
  

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

    stroke(255);
    noFill();
    
   triangle(x, y, radius*10, radius*10,3,3);//for the side lines
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

