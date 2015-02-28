
ArrayList particles;

void setup() {
  size(800,800);
  particles = new ArrayList();
  smooth();
}

void draw() {
  particles.add(new Particle()); 

  background(0);
  for (int i = 0; i < particles.size(); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
  }

  if (particles.size() > 900) {
    particles.remove(0); 
  }
}






class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle() {
    x = random(300,400);
    y = 100;
    xspeed = random(-5,5);
    yspeed = random(-2,1);
  }
  
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += 0.1;
  }
  
  void display() {
    stroke(15,68,240);
    fill(15,68,240);
    ellipse(x,y,5,5);
  }
}
