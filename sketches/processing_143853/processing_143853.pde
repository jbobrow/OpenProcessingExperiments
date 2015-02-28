
//Kevin Gutowski
//http://www.ocf.berkeley.edu/~keving/
//April 9th 2014

ArrayList<Particle> particles;
float x= 0;
float y = 0;

void setup() {
  size(800,400);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(0);
  if (mousePressed == false) {
  x = lerp(x, mouseX, 0.2);
  y = lerp(y, mouseY, 0.2);
  particles.add(new Particle(new PVector(x,y)));
  }
  // Looping through backwards to delete
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  float aVelocity;
  float lifespan;
  float radius = 12;
  float xl = radius*cos(PI/6);
  float yl = radius*sin(PI/6);
  int a;
  int b;
  int c;

  Particle(PVector l) {
    acceleration = new PVector(random(-0.03,0.5),random(-0.1,0.1));
    velocity = new PVector(random(-1, 1), random(-2, 0));
    aVelocity = random(-1,1)*noise(random(0.05,0.03))/3;
    location = l.get();
    lifespan = 255.0;
    a = int(random(0,200));
    b = int(random(200,255));
    c = int(random(0,255));
    //C = color(a,b,c);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
    
    angle += aVelocity;
  }

  // Method to display
  void display() {
    noStroke();
    fill(a,b,c, lifespan);
    //fill(c, lifespan);
    
    rectMode(CENTER);
    pushMatrix();
      translate(location.x,location.y);
      rotate(angle);
      triangle(-xl, +yl, +xl, +yl, 0, -radius);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

