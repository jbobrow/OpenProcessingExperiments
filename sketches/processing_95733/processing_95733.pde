
ArrayList particles;

void setup() {
  size(500, 500);
  particles = new ArrayList();
  smooth();
}

void draw() {

  background(255);

  for (int i= particles.size()-1; i >=0;i--) {
    Particle p = (Particle)particles.get(i);
    p.run();
    p.gravity();
    p.display();

    if (p.y < 0) {
      p.gone = true;
    }
    if (p.gone == true) { 
      particles.remove(i);
    }
  }

  if (particles.size() > 100) {
    particles.remove(0);
  }
}

void mouseMoved() {
  particles.add(new Particle());
}



class Particle { 
  float x; 
  float y; 
  float xspeed; 
  float yspeed; 

  boolean gone;

  Particle() {
    x = mouseX;
    y = mouseY;
    xspeed = random(-1, 1);
    yspeed = random(-2, 2);
    gone = false;
  }
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
  void gravity() {
    yspeed -= 0.1;
    if (mousePressed) {
    yspeed += 0.3;}
  }
  void display() {
    noStroke();    
    fill(random(99, 255), random(99, 255), random(99, 255), random(255));
    ellipse(x, y, 5, 5);
  }
}
