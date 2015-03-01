
Mover[] mover = new Mover[50];
  
void setup() {
  size(640,360);
  for(int cnt = 0; cnt < mover.length; cnt++){
      mover[cnt] = new Mover(random(0.1,5),random(width),cnt*2);
  }
  smooth();
  background(255);  
}
  
void draw() {
  fill(255,10);   
  rect(0,0,width,height);   
  PVector wind = new PVector(0.01,0);
   
  for(int cnt = 0; cnt < mover.length; cnt++){
    float m = mover[cnt].mass;
    PVector gravity = new PVector(0,0.1*m);
    mover[cnt].applyForce(wind);
    mover[cnt].applyForce(gravity);
    mover[cnt].update();
    mover[cnt].checkEdges();
    mover[cnt].display();
  }
}
 
class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  void display() {
    stroke(255);
    fill(80,50);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}
