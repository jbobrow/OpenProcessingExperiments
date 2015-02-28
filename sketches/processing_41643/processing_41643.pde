
int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];


void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y

    if (random(10) > 5) { 
      p[i] = new MyParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    }
    else { 
      p[i] = new MyParticle2(width/2, height, velX, velY, 5.0, width/2, height/2); 
    }
  }
}


void draw() {
  fill(0, 36);
  rect(0, 0, width, height);

  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}





// set classes below -------------------------------------------------------------------
// Class: Particle, Subclass: GenParticle, Subclasses: MyParticle and MyParticle2 ------

// MyParticle2 is a subclass of GenParticle --------------------------------------------
// ORANGE RECTANGLE GROWTH ----------------------------------------------------------------
class MyParticle2 extends GenParticle { 

  MyParticle2 (float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy); // maintain GenParticle's variables
  }

  void display() {
    fill(191, 127, 44, 10);
    stroke(255, 30); 
    rect(y, y, radius, radius); 
    fill(255, 90); 
    ellipse(y, y, 10, 10); 
    radius += 1.50; // sets the size of the rectangle
  }

  void regenerate() { 
    if ((x > width + radius) || (x < -radius) || 
      (y > height + radius) || (y < -radius)) { 
      x = originX; 
      y = originY; 
      vx = random(-0.5, 0.5); 
      vy = random(-7.0, -5.0); 
      radius = 5.0; 
    }
  }
}



// MyParticle is a subclass of GenParticle ---------------------------------------------
// BLUE BAR ----------------------------------------------------------------------------
class MyParticle extends GenParticle { 

  MyParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy); // maintain GenParticle's variables
}

  void display() { 
    fill(26, 27, 162, 100); 
    noStroke(); 
    rect(width/2+140, y-90, 30, 20);
  }
}



// original classes little modification --------------------------------------------------
// class GenpParticle is a subclass of class Particle ----------------------------------

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
      vx = random(-1.0, 1.0); ///////////// modify -4.0, 4.0 ?
      vy = random(-4.0, -2.0);
    }
  }
}



// set class Particle and GenParticle below -----------------------------------
// little modification

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
    vy = vy + gravity; // velocity + gravity 
    ////////// EDIT change to - ?
    x += vx; // xpos is equal to the velocity
    y += vy; // ypos is equal to the velocity
  }

  void display() { /////////////// EDIT add no stroke ?
    ellipse(x, y, radius*2, radius*2);
  }
}

