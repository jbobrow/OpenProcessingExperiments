
int numParticles = 300;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;

    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
  }
}

void draw() {
  fill(0, 236);
 
  rect(0, 0, width, height);
  
  fill(0,250,248, 30);
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
    triangle(x,y,radius/2,radius,radius,radius*2);
    fill(134,229,163, 30);
    ellipse(x,y, radius *2,radius );
   fill(222,211,55,40);
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
    if ((x > width*2 ) || (x < -width) ||
        (y > height*2) || (y < -height)) {
      x = originX;
      y = originY+200;
      vx = random(-3.0, 3.0);
      vy = random(-8.0, -2.0);
    }
  }

}




