
// "Collision Lines" 2014 / Jaime Rodriguez  

ArrayList particles;

void setup() {
  size(700, 400);
  background(15, 69, 120);
  smooth();
  particles = new ArrayList();
}

void draw() {

  if ( frameCount % 24 == 0) {
    particles.add(new Particle());
    if (particles.size() > 20000) {
      particles.remove(particles.size() - 1);
      println(particles.size());
    }
  }

  for (int i = particles.size () - 1; i >= 0; i--) {
    Particle p = (Particle) particles.get(i);
    p.mover(); 
    p.dibujar();
  }

  for (int i = 0; i < particles.size (); i++) {
    for (int j = 0; j < particles.size (); j++) {
      if (i != j) {
        Particle p1 = (Particle) particles.get(i);
        Particle p2 = (Particle) particles.get(j);

        float distance = dist(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
        if (distance <= (p1.r + p2.r)) {
          if (p1.bounce == false && p2.bounce == false) {
            p1.vel *= 0.996;
            p2.vel *= 0.996;
            p1.dir.x = random(-1, 1);
            p1.dir.y = random(-1, 1);
            p2.dir.x = random(-1, 1);
            p2.dir.y = random(-1, 1);
            fill(10, 50, 100);
            rectMode(CENTER);
            rect(p2.pos.x, p2.pos.y, 2, 2);

            p1.bounce = true;
            p2.bounce = true;
          }
        }
      }
    }
  }
}

class Particle {

  float x;
  float y;
  PVector pos;
  PVector dir;
  float dis;
  float vel = 20;
  float r = 1;
  color c = color(30, 140, 255, 70);
  boolean bounce = false;

  Particle () {
    pos = new PVector();
    pos.x = random(width);
    pos.y = 0;

    dir = new PVector();
    dir.x = 0;
    dir.y = 1;
  }

  void mover () {
    if (vel > 0) {
      vel *= 0.997;
    } else {
      vel = 0;
    }

    pos.x += (dir.x * vel);
    pos.y += (dir.y * vel);

    limite();
  }

  void limite() {  
    if (pos.x < 0) {
      pos.x = width;
    }
    if (x > width) {
      pos.x = 0;
    }    

    if (pos.y - r <= 0) {
      dir.y = 1;
    }
    if (pos.y + r >= height) {
      dir.y = -1;
    }
  }

  void dibujar () {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, r, r);
  }
}




