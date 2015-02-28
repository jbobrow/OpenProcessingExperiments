
// refering to the GenParticleDemo code (maybe too much..?)
//try to express the firework effect

PImage img;

int numParticles = 50;                         //  the number of particles 
FW [] p = new FW [numParticles];               //  FW representing FireWork

void setup() {
  size (300, 800);

  img = loadImage ("gh.jpg");

  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-0.5, 0.5);
    float velY = -i;
    p[i] = new FW(width/2, height, velX, velY, width/2, height);
  }
}

void draw() {
  fill(30, random (50));
  rect(0, 0, width, height);
  stroke (255, 222, 210, random (100));       
  for (int i = 0; i < p.length; i++) {

    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

      
class Particle {                             // superclass
  float x, y;                                // The x, y coordinates
  float vx, vy;                              // The x and y velocities
  float gravity = 0.01;                       

  Particle(float xpos, float ypos, float velx, float vely) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
  }

  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  float t = random (50); // 

  void display() {
    color c = img .get(img.width, img.height); 
    line (x, y, x, y + random (50) );
    if ( y > height/3) {
      fill (random (c), t);
      ellipse (x, y, 3, 15);
    }
  }
}

class FW extends Particle {                   // subslass
  float originX, originY;

  FW(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + width/5) || (x < -width) ||
      (y > height + height/10) || (y < -height)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -4.0);
    }
  }
}


