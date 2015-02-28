
/**
 * Particle System
 */

/**
 * Number of particles
 */ 
float count = 100;
 
ArrayList particles;

/**
 * Setup
 */ 
void setup() {
  size(500, 400);
  colorMode(HSB, 2 * PI, 1, 1, 1);
  smooth();

  particles = new ArrayList();
  
  for (int i = 0; i < count; i++) {
    particles.add(new Particle());
  }
}

/**
 * Draw
 */
void draw() {
  clear();

  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    
    p.draw();
  }
}

/**
 * Clear - clear display
 */
void clear() {
  noStroke();
  fill(0, 0, 0, 0.2);
  rect(0, 0, width, height);
}


