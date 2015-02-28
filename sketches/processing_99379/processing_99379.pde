
Particle[] particles;
int planetX, planetY;
int num = 1000;

void setup() {
  size(1000,800);
  noStroke();
  smooth();
  planetX = width/2;
  planetY = height/2;
  particles = new Particle[num];
  for (int i = 0; i < num; i++)
    particles[i] = new Particle(new PVector(random(width), random(height)), 1, 10, 10);
}

void draw() {
  fill(0,55);
  rect(0,0,width,height);
  fill(125);
  ellipse(planetX, planetY, 50,50);
  
  for (Particle particle : particles) {
    particle.run(planetX, planetY);
  }
}

void mousePressed() {
  planetX = mouseX;
  planetY = mouseY;
}
public class Particle {
  PVector location;
  PVector velocity;
  PVector accel;
  int size;
  float gravity;
  float mass;
  int maxVelocity = 5;
  float dist;
  
  public Particle(PVector loc, int size, float gravity, float mass) {
    location = loc.get();
    velocity = new PVector(0,0);
    accel = new PVector(0,0);
    this.size = size;
    this.gravity = gravity;
    this.mass = mass;
  }
  
  public void display() {
    ellipseMode(CENTER);
    fill(dist, 255, 255);
    ellipse(location.x, location.y, size, size);
  }
  
  public void forces(float x, float y) {
    PVector target = new PVector(x,y);
    PVector dir = PVector.sub(location, target);
    dist = dir.mag();
    dir.normalize();
    
    float force = (gravity*mass)/(dist*dist);
    
    if (keyPressed) { }
    else
      dir.mult(-1);
    applyForce(dir);
  }
  
  public void applyForce(PVector force) {
    force.div(mass);
    accel.add(force);
  }
  
  public void update() {
    velocity.add(accel);
    velocity.limit(maxVelocity);
    location.add(velocity);
    accel.mult(0);
  }
  
  public void bounds() {
    if(location.y > height || location.y < 0)
      velocity.y *= -1;
    if(location.x > width || location.x < 0)
      velocity.x *= -1;
  }
  
  public void run(float x, float y) {
    forces(x,y);
    display();
    bounds();
    update();
  }
}



