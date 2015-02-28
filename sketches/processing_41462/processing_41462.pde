
//happy halloween
//code modified from lab 7 code by Prof Nick Senske

int numParticles = 300; //number of fire
GenParticle[] p = new GenParticle[numParticles];


float x;
float y;
float speed;
float gravity; 
float friction;
//float for pumpkins

void setup() {
  size(300, 300);

  x=30;
  y = 0;
  speed = 5;
  gravity = 0.1;
  friction = 0.98;


  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = i;
    float velY = i;
    p[i] = new GenParticle(250, 220, velX, velY, 5.0, 250, 220);
  }
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);
  fill(255, 255, 0, 30);
  for (int i = 0; i < p.length; i++) {
    p[i].update();//draw fire
    p[i].regenerate();
    p[i].display();
  }

  speed = speed + gravity;//draw pumpkins
  speed = speed * friction;
  y = y + speed;
  if (y > (height-30)) {
    y=height-30;
    speed = -speed;
  }
  noStroke();
  fill(245, 70, 0);
  ellipse (x, y, 50, 50);
  ellipse (x+20, y, 50, 50);

  ellipse (height-x-20, width-y-5, 50, 50);
  ellipse (height-x, width-y-5, 50, 50);

  noFill();
  stroke(0);
  arc(x+10, y+5, 40, 20, 0, PI);

  arc(height-x-10, width-y, 40, 20, 0, PI);

  fill(0);
  ellipse(x, y-10, 5, 5);
  ellipse(x+20, y-10, 5, 5);

  ellipse(height-x-20, width-y-10, 5, 5);
  ellipse(height-x, width-y-10, 5, 5);
}


void mousePressed() {
  y = 0;
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
    vy = vy - gravity;
    y += vy;
    x += vx;
  }

  void display() {
    noStroke();
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
      vx = random(-4.0, 4.0);
      vy = random(-4.0, 4.0);
    }
  }
}


