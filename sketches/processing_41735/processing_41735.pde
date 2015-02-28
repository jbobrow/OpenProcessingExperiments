
//Stephanie Callaghan
//Lab Assignment 7.2
//Modification of Nick Senske's GenParticle Demo
//Changes the behavior of the particles so that they change color, fall, bounce, grow/shrink before disappearing from screen

int numParticles = 200;
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  for (int i = 0; i < p.length; i++) {
    float velX = random(-1, 1);
    float velY = -i;

    p[i] = new myParticle1 (width/3, height, velX, velY, 5.0, width/3, height/3);

  }
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  fill(255, 60);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}

//my sub-class of GenParticle

class myParticle1 extends GenParticle {
  float age;
 
  myParticle1 (float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(50);
  }
    
    void update() {
    if (y >= height - radius) {
      y = height - radius;
      vy = -0.75 * vy;
    }
    vy = vy + gravity;
    y += vy;
    x += vx;
    age++;
  }
  void display() {
    color c = color(100, random(100), random(100));
    fill(c);
    ellipse(x, y, radius, radius);
    radius= radius + random(-1,1); //changes radius size with age
  }
 
  void regenerate() {
    if (age > 300) {  
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);  
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
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
  float x, y; 
  float vx, vy; 
  float radius;
  float gravity = 0.1;
  
  float speed = .5;
  float friction = .5;

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
    
    speed = speed + gravity;
    speed = speed + friction;
    if (y > height){
      y = height - radius;
      speed = -speed;
    }
  }
  
  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}

