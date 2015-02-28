
Particle[] particles;
int NUM_PARTICLES = 100;
int baseAngle;
color backgroundCol, strokeCol, fillCol;

void setup() {
 colorMode(HSB, 360, 50, 100);
 background(0);
 size(800, 400);
 //stroke(0);
 strokeWeight(3);
 //fill(150);
 smooth();
}

void draw() {
  background(0);
  if (particles != null) {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      particles[i].exist();
    }
  }
}

void mousePressed() {
  baseAngle = (int)random(0,360); //Grundfarbe setzen
  backgroundCol = color(baseAngle, 30, 50+random(50));
  strokeCol = color((baseAngle+120) % 360, 30, 50+random(50));
  fillCol = color((baseAngle+240) % 360, 30, 50+random(50));
  
  //background(backgroundCol);
  //background(0);
  stroke(strokeCol, 50);
  fill(fillCol, 75);
  
  particles = new Particle[NUM_PARTICLES];
  for (int i = 0; i < NUM_PARTICLES; i++) {
    particles[i] = new Particle();
  }
}

public class Particle {
  float x, y;
  float vx, vy;
  float ax, ay;

  public Particle() {
      x = mouseX;
      y = mouseY;
      vx = vy = 0f;
      ax = random(-0.2, 0.2);
      ay = random(-0.08, 0.05);
  }

  public void exist() {
     vx += ax;
     vy += ay;
     x += vx;
     y += vy;
     ellipse(x, y, 10, 10);
  }
}
