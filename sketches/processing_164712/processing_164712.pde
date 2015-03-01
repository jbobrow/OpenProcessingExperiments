
Particle[] p = new Particle[25];

void setup() {
  size(600,400);
  
  for (int i = 0; i < p.length; i ++ ) {
  p[i]= new Particle(random(1,600),random(1,400));
  
  }
  
  
}

void draw() {
  background(0);
  
   for (int i = 0; i < p.length; i ++ ) {
  p[i].display();
  p[i].move();
   }
}
class Particle {
  PVector pos;

  ArrayList<PVector> history;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    history = new ArrayList<PVector>();
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
    noFill();
    stroke(255);
    beginShape();
    for (PVector p : history) {
      vertex(p.x,p.y); 
      p.x += noise(-10,10);
      p.y += noise(-10,10);
    }
    endShape();
  }

  void move() {
    history.add(new PVector(pos.x, pos.y));
    pos.x += random(-1, 1);
    pos.y += random(-1, 1);
    
    if (history.size() > 50) {
      history.remove(0); 
    }
  }
}


