
ArrayList<Particle> particles;
void setup() {
size(1000,600);
background(255);
noStroke();
particles = new ArrayList<Particle>();
}
void draw() {

particles.add(new Particle(new PVector(mouseX,mouseY)));
for (int i = 0; i < particles.size(); i++) {
Particle p = particles.get(i);
p.run();
}
}
void mouseClicked(){
 
background(255); 
}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  float life;

  Particle(PVector l) {
    force = new PVector(random(0,-.5),-0.0006);
 
    acceleration = new PVector(0,0.05);
    velocity = new PVector(1,random(-.5,.5));
    location = l.get();
    life = 255.0;
  }
  void run() {
    update();
    display();
  }
  void update() {
    acceleration.add(force);
    velocity.add(acceleration);
    location.add(velocity);
    life -= 2.0;
  }
  void display() {
   // stroke(0, life); 
    fill(#e70e4b, random(100,255));
    //image(img,location.x, location.y);
    ellipse(location.x, location.y, 8, 10);
  }
  boolean isDead() {
    if (life < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
