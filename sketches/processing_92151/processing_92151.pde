
Particle[] particles;
int NUM_PARTICLES = 100;
int resetCounter = 0;
 
void setup() {
 background(0);
 size(800,800);
 stroke(0);
 strokeWeight(0);
 fill(13,255,225);
 smooth();
}
 
void draw() {

if (particles != null) {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      particles[i].exist();
    }
  }
}
 
void mousePressed() {
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
     ellipse(x, y,15,15);
  }
}
void keyPressed() { //Start of void keyPressed
  //Reset background
  if(key == 'r' || key == 'R') { //Start of IF statement
  background(0);
  loop();
 }
}
