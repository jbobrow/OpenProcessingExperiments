
int pMax = 290;
ArrayList<Particle> particles = new ArrayList<Particle>();
 
void setup() {
  size(640, 360);
  smooth ();
  frameRate(20);
}
 
void draw() {
  background(255);
  particles.add(new Particle());
 
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.redraw();
    if (particles.size() > pMax) {
      particles.remove(0);
    }
  }
}
 
class Particle {
  float x;
  float y;
  float moveX;
  float moveY;
  float rChan = random(255);
  float gChan = random(255);
  float bChan = random(255);
  int alpha = 180;
 
  Particle() {
    x = mouseX;
    y = mouseY;
    moveX = random(-20, 10); //Bewegungsrichtung für diese Instanz festlegen
    moveY = random(-20, 10);
  }
 
  void redraw() {
    x = x + moveX;
    y = y + moveY;
    drawParticle();
  }
   
  void drawParticle(){
    alpha--;
    fill (alpha--, gChan, bChan, alpha+255);
    strokeWeight(3);
    stroke(rChan, gChan, bChan, alpha+150);
    ellipse (x, y, 5, 5);
  }
}
