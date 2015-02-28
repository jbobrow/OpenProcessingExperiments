
ArrayList particles;  // list of all the particles

int counter = 0;

void setup() {
  size(300, 300);
  particles = new ArrayList();
}

void draw() {
  background(0);
  
  // add a sputter every five frames
  counter++;
  if (counter > 5) {
      createSputter(width/2, height/2);
      counter = 0;
  }
  
  // go through the list of particles (backwards to ensure proper removal)
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = (Particle)particles.get(i);      // get a particle
    p.drawParticle();                             // update/draw the particle
    if (p.y > height + 50) {                      // check if the particle is offscreen
      particles.remove(i);                        // if so, remove it from the list
    }
  }
  
  // write out the number of particles in the program
  textSize(20);
  fill(255);
  text("Particle count: " + particles.size(), 10, 40);
}

// add a random number of particles at the given coordinates
void createSputter(int x, int y) {
    int nParticles = (int)random(10, 20);  // how many particles to create
  for(int i = 0; i < nParticles; i++) {
    Particle p = new Particle();         // create a particle
    p.x = x;                             // set it's location to the intended coordinates
    p.y = y;
    particles.add(p);                    // add the particle to the list
  }
}

void mousePressed() {
  createSputter(mouseX, mouseY);
}


class Particle {
 float x;          // the x coordinate of the particle
 float y;          // the y coordinate of the particle
 float speedX;     // the horizontal speed of the particle
 float speedY;     // the vertical speed of the particle
 float size = 10;  // the size of the particle (initially 10)
 
 Particle() {
   // set a random speed and size for new particles
   randomize();
 }
 
 // set a random speed and size for the particle
 void randomize() {
  speedY = random(-10, -8); // particles start by going up
  speedX = random(-3, 3);  
  size = random(5, 15);
 }
 
 // update and draw the particle
 void drawParticle() {
   speedY += 0.5; // increase the vertical speed (gravity acceleration)
   y += speedY;   // same as writing  y = y + speedY;
   x += speedX;   // same as writing  x = x + speedX;
   
   // draw the particle as a green circle, with the particle's size
   noStroke();
   fill(#62AA05);
   ellipse(x, y, size, size);
 }
}
