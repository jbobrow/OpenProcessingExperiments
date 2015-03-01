
ArrayList<Particle> particles;
float numParticles;
float reactionDist; // distance at which particles should react with each other
float lineOdds; // 0 to 100, what are the odds we'll draw a line if two particles are close enough?
 
void setup() {
  size(700, 700);
  smooth();
  frameRate(120);
  background(0);
  particles = new ArrayList();
  numParticles = 300;
  reactionDist = 50;
  lineOdds = 20;
 
  for (int i = 0; i < numParticles; i++) {
    particles.add(new Particle(random(width/5, width-(width/5)), random(height/5, height-(height/5)), random(0.5, 2)));
  }
}
 
void draw() {
  
 
  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.draw();
  }
 
  // detect distance & draw lines
  for (int i = 0; i < particles.size(); i++) {
    Particle p1 = (Particle) particles.get(i);
    for (int j = 0; j < particles.size(); j++) {
      Particle p2 = (Particle) particles.get(j);
      if (p1 != p2) {
        if (dist(p1.x, p1.y, p2.x, p2.y) <= reactionDist) {
          if (random(0, 100) <= lineOdds) {
            stroke(255, 80);
            strokeWeight(0.1);
            line(p1.x, p1.y, p2.x, p2.y);
          }
        }
      }
    }
  }
}
 
class Particle {
 
  float cx, cy; // animated pos
  float x, y;
  float rx, ry; // radius
  float rT;
  float size;
  float alpha;
 
  Particle(float x, float y, float size) {
    this.cx = x;
    this.cy = y;
    this.size = size;
 
    rx = random(10, 80);
    ry = random(10, 80);
    rT = random(1000, 3000);
    if (random(100) < 50) {
      rx = rx * -1;
    }
  }
 
  void draw() {
    float t = millis()/rT; // speed
    x = (int)(cx + rx * cos (t));
    y = (int)(cy + ry * sin (t));
 
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}
