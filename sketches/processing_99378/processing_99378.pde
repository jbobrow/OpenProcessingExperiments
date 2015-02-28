
Particle[] particles;
ArrayList<Planet> planets;
int num = 1000;

void setup() {
  size(1000,800);
  noStroke();
  smooth();
  particles = new Particle[num];
  for (int i = 0; i < num; i++)
    particles[i] = new Particle(new PVector(random(width), random(height)), 1, 10, 10);
  planets = new ArrayList<Planet>();
//  planets.add(new Planet((int)random(width), (int)random(height), 50, true));
}

void draw() {
  fill(0,55);
  rect(0,0,width,height);
  fill(255);
  
  for (Planet planet : planets) { //for each planet
    planet.display();
    for (int i = 0; i < num; i++) { //tell each particle to react to it (it being the planet)
      particles[i].forces(planet.getX(), planet.getY(), planet.doesAttract()); //add all the forces
    }
  }
  for (int i = 0; i < num; i++)
    particles[i].run(); //update each particle and display them
}

void mousePressed() {
  boolean found = false;
  for (Planet planet : planets) {
    if (planet.contains(mouseX,mouseY)) {
      planet.reverseAttraction();
      found = true;
    }
  }
  if (!found)
    planets.add(new Planet(mouseX, mouseY, 50, true));
}

void keyPressed() {
  reset();
}

void reset() {
  planets = new ArrayList<Planet>();
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
  
  public void forces(float x, float y, boolean attract) {
    PVector target = new PVector(x,y);
    PVector dir = PVector.sub(location, target);
    dist = dir.mag();
    dir.normalize();
    
    float force = (gravity*mass)/(dist*dist);
    
    if (!attract) { }
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
  
  public void run(float x, float y, boolean attract) {
    forces(x,y, attract);
    display();
    bounds();
    update();
  }
  
  public void run() {
    display();
    bounds();
    update();
  }
}

public class Planet {
  private int x, y, size;
  private boolean attract;
  
  public Planet(int x, int y, int size, boolean attract) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.attract = attract;
  }
  
  public void display() {
    if (this.doesAttract())
      fill(255,0,0);
    else
      fill(0,0,255);
    ellipse(x,y,size,size);
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getSize() {
    return size;
  }
  
  public boolean doesAttract() {
    return attract;
  }
  
  public boolean contains(int x, int y) {
    return dist(x,y,this.x,this.y) <= size;
  }
  
  public void reverseAttraction() {
    this.attract = !this.attract;
  }
}

