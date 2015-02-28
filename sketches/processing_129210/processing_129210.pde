
// click = reset particles
// any key = clear canvas

Particle[] p;

void setup() {
  size(400,400);
  background(245);
  p = new Particle[(int)width*height/1600];
  resetParticles();
}

void draw() {
  for (int i = 0; i < p.length; i++) {
    p[i].draw();
  }
}

void keyPressed() {
  background(245);
  resetParticles();
}

void mouseClicked() {
  resetParticles();
}

void resetParticles() {
  for (int i = 0; i < p.length; i++) {
    p[i] = new Particle(random(width),random(height));
  }
  
}

// in processing this class should extends PVector, 
// just for keep it easy to expand
//class Particle extends PVector {
class Particle {
  PVector selfCoords; // if you extend PVector this is not necessary
  PVector dir;
  float vel;
  float sw;
  
  Particle (float x, float y) {
    //super(xx,yy); // recal PVector constructor
    selfCoords = new PVector(x,y);
    dir = new PVector(random(2)-1.0,random(2)-1.0);
    vel = random(1)*0.6+0.2;
    sw = random(230);
  }
  
  void update() {
    //this.add(PVector.mult(dir, vel)); if it was PVector, again :)
    selfCoords.add(PVector.mult(dir, vel));
  }
  
  void draw() {
    update();
    stroke(sw);
    //point(this.x,this.y); extends PVector case
    point(selfCoords.x,selfCoords.y);
  }
}
