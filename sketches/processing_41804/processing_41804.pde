
/*Joseph Kotay.  Practice Computational Methods.  Professor Nick SenseKe.  Extending Classes.
 * This is an adaptation from the GenParticles sketch that is extended into two new classes.
 For this sketch, only my final class appears in the sketch.  I don't know why the first too don't show up.*/


int numParticles = int(random(100,300)); //set the number of particles
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-2, 2);
    float velY = random(-i, i);
    // Inputs: x, y, x-velocity, y-velocity,
    // radius, origin x, origin y
    p[i] = new xParticle(width/2, height/2, velX, velY, 8.0, width/2, height/4);
    p[i] = new yParticle(width/2, height, velX, velY, random(4,8), width/4, 0);
  }
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  fill(140,100,10, random(40,70));
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

// Initial class provided
class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.2;

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
    fill(random(80,110),75,20);
    rect(x, y, radius, radius*3);
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
      vx = random(-4, 4);
      vy = random(-2, 2);
    }
  }
}

//the first new class besides what was already coded.
class xParticle extends GenParticle {

  xParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x =width/2;
      y = height;
      vx = random(-4, 4);
      vy = random(-2, 2);
    }
  }



  void display() {
    pushMatrix();
    translate(originX, originY);
    rotate(frameRate *  radians(90));
    fill(random(20,50),120, 20,75);
    rect(x,y, radius*3, random(radius*2, radius*6));
    popMatrix();
  }
}


class yParticle extends GenParticle {

  yParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX/2;
      y = height/5;
      vx = random(-5, 10);  
      vy = random(-10, 10);
    }
  } 


  void display() {
    pushMatrix();
    translate(originX, originY/3);
    rotate(frameRate *  radians(180));
    fill(random(90,120),75,20,75);
    ellipse(x,y,radius*2, radius* 4);
    popMatrix();
  }
}











