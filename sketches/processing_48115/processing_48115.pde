
//Author: Dulce Andino
//Purpose: Assignment; Fall, Falling, Fallen
//Concept: Fallen Oranges
//Reference: "Processing" by Casey Reas & Ben Fry (p.483)


class Particle {
  float x, y;
  float vx, vy;
  float radius;
  float gravity = 0.3;

  // The x- and y-coordinates
  // The x- and y-velocities
  // Particle radius
  Particle(int xpos, int ypos, float velx, float vely, float r) {
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
    float s= random(25, 60);
    fill(255, 175, 0);
    stroke(255, 132, 0, 60);
    strokeWeight(20);
    ellipse(x, y, s, s);
    fill (0);
    noStroke();
  }
}

class LimitedParticle extends Particle {
  float friction = 0.99;
  LimitedParticle(int ix, int iy, float ivx, float ivy, float ir) {
    super(ix, iy, ivx, ivy, ir);
  }
  void update() {
    vy *= friction;
    vx *= friction;
    super.update();
    limit();
  }
  void limit() {
    if (y > height+6*radius) {
      vy = -vy;
      y = constrain(y, height*height, height+6*radius);
    }
    if ((x < radius) || (x > width+radius)) {
      vx = -vx;
      x = constrain(x, radius, width+radius);
    }
  }
}

//---------------------------------------------------------------------------------
//---------------------------------------------------------------------------------


int num = 80;
LimitedParticle[] p = new LimitedParticle[num];
float radius = 2;
void setup() { 
  size(500, 500); 
  noStroke(); 
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-5, 5);
    float velY = -2*i;
    // Inputs: x, y, x-velocity, y-velocity, radius
    p[i] = new LimitedParticle(width/2, height/24, 
    velX, velY, 7);
  }
}
void draw() {

  fill(255, 255, 255, 30);
  stroke(255);
  strokeWeight(1);
  rect(0, 0, width+radius, height+radius); 
  fill(0);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].display();
  }
}

void keyPressed() {
  saveFrame("fallen-####.jpg");
}


