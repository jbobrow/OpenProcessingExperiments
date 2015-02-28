
/**
 This is an example that creates a basic particle system with an
 attractor that follows the mouse.
 
 The general idea is that on every iteration of the draw() function
 we launch a new particle into the air. The particle eventually wear
 and we replace them as needed.
 
 C. Andrews
 2014-01-15
 */


Particle particles[]; // declare the array of Particles

Attractor attractor; // declare the Attractor variable
int numParticles = 0; // this is a variable that holds the number of particles
void setup() {
  size(600, 600);
  // instantiate the Attractor
  attractor = new Attractor();
  // create the array to hold 300 Particles (it is still just room -- no particles yet)
  particles = new Particle[300];
}

/**
 This handles the creation of new particles and updates their positions.
 **/
void draw() {
  background(0);

  // If there is an empty spot in the array, we add a new particle to the system  
  if (numParticles < particles.length) {
    // create the Particle
    Particle p  = new Particle();

    // Give it an initial position 
    p.x = width/2;
    p.y = height; 

    // randomize its velocity and life time
    p.vx = random(-1, 1);
    p.vy = -2 + random(-1, 1);
    p.maxLifeTime += random(-15, 15);

    // add it to the array and update our count of the number of particles
    particles[numParticles] = p;
    numParticles += 1;
  }

  // Set the location of the attractor to the current mouse position
  attractor.x = mouseX;
  attractor.y = mouseY;


  // iterate over all of the particles and update and draw them
  // if they have expired, remove them from the list
  for (int i = 0; i < numParticles; i++) {
    // apply the attraction force to the current particle
    attractor.attract(particles[i]);
    // update the particle's position
    particles[i].update();

    // check if it is still alive
    if (particles[i].lifeTime < particles[i].maxLifeTime) {
      // if it is, paint it
      particles[i].paint();
    }
    else {
      // if it isn't, replace this particle with the last one in the list
      // and reduce the number of particles in the system
      numParticles -= 1;
      particles[i] = particles[numParticles];
    }
  }
}



/**
 This is the Particle class.
 
 The basic functionality is pretty straight forward. Particles have a position, velocity, 
 and in this instance, a lifetime. We have an update fucntion that changes the postion 
 based on the velocity, and a paint function to draw it.
 **/
class Particle {
  float x, y; // position of the particle
  float vx, vy; // velocity of the particle
  int lifeTime; // the age of the particle
  int maxLifeTime; // the age when the particle should be retired


  /**
   This is the constructor. We are just setting the lifetime here.
   **/
  Particle() {
    lifeTime = 0;
    maxLifeTime = 250;
  }

  /**
   Move the particle based on the velocity and increment the age of the particle.
   **/
  void update() {
    x += vx;
    y += vy; 

    lifeTime += 1;
  }

  /**
   Paint the particle. Note that the lifetime is used to determine the alpha 
   for the fill so that this gradually fades away rather than just popping out of
   existence.
   **/
  void paint() {

    noStroke();
    float alpha = (1 - (float)lifeTime / maxLifeTime)* 200;


    fill(255, alpha);
    ellipse(x, y, 5, 5);
  }
}

/**
 This is the Attractor class. It is designed to simulate an attractive force that 
 draws particles in towards it.
 **/
class Attractor {
  float x, y; // the position of the attractor
  float radius; // the radius of influence of the attractor

  /**
   The constructor of the attractor. This is just setting the radius.
   **/
  Attractor() {
    radius = 200;
  }

  /**
   This fucntion does all of the hard work. We pass it a particle and this determines the
   force on it based on the distance from the center of this attractor. 
   
   The formula comes from "Generative Design" by Bohnacker, Gros and Laub. It is designed
   to be a non-linear attractor that increases in strength as the particle gets closer to
   center.
   **/
  void attract(Particle p) {
    float dx = x - p.x;
    float dy = y - p.y;

    float distance = mag(dx, dy);

    if (distance > 0 && distance < radius) {
      float s = distance / radius;
      float f = 1/pow(s, 0.5) - 1;

      f = f/radius;

      // here is where the force is actually applied
      // if you reverse the signs on these, you get a repulser
      p.vx += dx * f;
      p.vy += dy *f;
    }
  }
}





