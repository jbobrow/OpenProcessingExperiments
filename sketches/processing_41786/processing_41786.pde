
// its a cracker bursting effect 
int numParticles = 100;
Particle2[] p = new Particle2[numParticles];

void setup() {
  size(300, 600);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-5, 5);
    float velY = -i;
    // Inputs: x, y, x-velocity, y-velocity,
    // origin x, origin y

    p[i] = new Particle2(width/2, height, velX, velY, random(300), random(600));
  }
}

void draw() {
  fill(0, 36);
  rect(0, 0, width, height);

  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].display();
    p[i].regenerate();
    p[i].plus();
  }
}


//Particle- creation of class

class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float gravity = -0.2;

  Particle(float xpos, float ypos, float velx, float vely) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
  }

  void update() {
    vy = vy + gravity;  //defing the velocity(motion)=velocity+gravity
    y += vy*.3;  // y position of the particle is .3 times the velocity 
    x += vx*.2; // x position of the particle is .2 times the velocity
  }

  void display() {
    rect (x, y, random(5), random(5));
  }
}


//GenParticle - creation of subclass of particle

class GenParticle extends Particle {
  float originX, originY; //new variable for GenParticle

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width+20) || (x < -40) ||  
      (y > height + 10) || (y < -20)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}


//Particle1- subclass of GenParticle

class Particle1 extends GenParticle { //create the "bursting cracker" effect

  Particle1(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, ox, oy);
  }

  void display() {    
    fill(random(255), 160, random(200), 80);
    ellipse (x, y, 8, 8);
  }


  void pulse() { // make the particle bounce back up after reaching bottom of sketch
    if (x >= height-10 ) {
      vx = -7;
    }
  }
}


//Particle2 -subclass of GenParticle
class Particle2 extends GenParticle {

  Particle2(float xIn, float yIn, float vxIn, float vyIn, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, ox, oy);
  }

  void display() {
    stroke(0, 0, 0, 60);
    strokeWeight(3);
    rect(x, y, 10, 10);
  }
  void plus() { 
    if (x >= height-100 ) {
      vx = 2*vx;
    }
  }
}
float m;
float n;
void mousePressed() {
  for (m=0; m<width; m++);
  for (n=0; n<width; n++);
  pushMatrix();
  translate(width/2, height/2);
  fill(255, 240, 10);
  ellipse (150, 300, 10, 10);
  rotate(radians (random(360)));
  popMatrix();
}


