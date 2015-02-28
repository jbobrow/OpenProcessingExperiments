
int numParticles = 300;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;
    if (random(3) > 2) { 
      p[i] = new WaterParticle(width/4, height, velX, velY, 5.0, width/4, height);
    } 
    else {
      p[i] = new FireParticle(25, height, velX, velY, 5.0, 25, height);
    }
  }
}

void draw() {
  fill(0, 36); //background color
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

class WaterParticle extends GenParticle {
  float col;
  //using variables from GenParticle
  WaterParticle (float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) { 
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    col = 0;
  }

  void display() {
    color c = lerpColor(color(0, 0, 255, 25), color (0, 0, 255, 75), col*0.01);
    fill (c);
    rect(x, y, radius, radius/4);
    radius +=.25;
  }

  void regenerate () { 
    //switching the x and y origins and v placement makes the water particles come from the opposite location 
    //(now the top right instead of bottom left)
    if ((x> width) || (x< -width) || (y>height) || (y < -height)) {
      y=originX;
      x=originY;
      vy=random(-.5, .5);
      vx = random(-5, -3);
      radius = 6;
      col = 0;
    }
  }
}

class FireParticle extends GenParticle {
  float col;
  //using GenParticle variables
  FireParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    col = random(200);
  }

  void update() {
    if (y>=height-radius) { //makes particles bounce at the bottom of the screen
      y = height -radius;
      vy = -.5 *vy;
    }
    if (x>=width/4) {
      x=originX;
      vx = -5*vx;
    }
    vy = vy+gravity;
    y += vy;
    x += vx;
    col++;
  }
  void display () {
    color c = lerpColor(color(255, 0, 0, 75), color(255, 255, 0, 25), col*.1);
    fill(c);
    ellipse(x, y, radius/2, radius);
  }

  void regenerate () {
    if (col>300) {
      x = originX;
      y = originY;
      vx = random (-1.5, 1.5);
      vy = random (1, 25);
      col = 0;
      radius = 6;
    }
  }
} 

//original class
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


