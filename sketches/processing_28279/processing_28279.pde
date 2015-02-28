
final float PARTICLE_SPEED = 0.07;
final float RADIUS_DECREASE_SPEED = 0.01;
final float SPAWN_TIME = 40; // ms

final ArrayList particles = new ArrayList();

float lastDrawTime = millis();
float spawnCounter = 0;

void setup() {
  size(400, 400);  
  ellipseMode(RADIUS);
  strokeWeight(3);
}

void draw() {
  float now = millis();
  float delta = now - lastDrawTime;
  lastDrawTime = now;
  
  // update all the particles
  for(int i = particles.size() - 1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);    
    p.tick(delta);    
  }
    
  spawnCounter += delta;
  if(spawnCounter > SPAWN_TIME) {  
    // spawn a new particle at a random position
    // near center
    Particle p = new Particle();      
    p.pos.x = width / 2 + random(40) - 20;
    p.pos.y = height / 2 + random(40) - 20;    
    p.radius = 15 + random(10);    
    p.setTarget(random(width), random(height));
    
    spawnCounter -= SPAWN_TIME;
  }
  
  if(mousePressed) {
    // redirect particles to current mouse location
    for(int i = particles.size() - 1; i >= 0; i--) {
      Particle p = (Particle)particles.get(i);    
      p.setTarget(mouseX, mouseY);
    }
  }
    
  background(240);
  
  // draw all lines
  stroke(0);
  noFill();
  for(int i = particles.size() - 1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    ellipse(p.pos.x, p.pos.y, p.radius, p.radius);    
  }
  
  // fill to hide 'internal' lines
  noStroke();
  fill(180, 180, 255);  
  for(int i = particles.size() - 1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);
    ellipse(p.pos.x, p.pos.y, p.radius, p.radius);    
  }
}

class Particle {
  final PVector pos = new PVector();
  final PVector dir = new PVector();
  float radius;
  
  Particle() {    
    particles.add(this);
  }
  
  void setTarget(int x, int y) {
    dir.x = x - pos.x;
    dir.y = y - pos.y;
    dir.normalize();
  }
  
  void tick(float delta) {
     radius -= delta * RADIUS_DECREASE_SPEED;
     
    if(radius > 0) {
      // update position
      pos.x += dir.x * delta * PARTICLE_SPEED;
      pos.y += dir.y * delta * PARTICLE_SPEED;
    }
    else {
      particles.remove(this);
    }
  }
}

                
                                                                
