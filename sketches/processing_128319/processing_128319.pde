
/**
This is the Particle example with the Particles turned into smoke.
The only real difference is that we draw hazy blobs instead of 
circles, and we reduce the vx so things go more upwards than outwards.

C. Andrews
2014-01-15
**/



Particle particles[]; // declare the array of Particles
int numParticles = 0; // this is a variable that holds the number of particles
void setup() {
  size(600, 600);
  background(0);
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
    p.vx = random(-.25, .25);
    p.vy = -1 + random(-1, 1);
    p.maxLifeTime += random(-15, 15);

    // add it to the array and update our count of the number of particles
    particles[numParticles] = p;
    numParticles += 1;
  }



  // iterate over all of the particles and update and draw them
  // if they have expired, remove them from the list
  for (int i = 0; i < numParticles; i++) {

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
   
   I apply a second trick in here that builds up layers of translucent circles to create
   a hazy circle, which is what gives the smoke effect.
   **/
  void paint() {

    noStroke();
    float alpha = (1 - (float)lifeTime / maxLifeTime)* 100;


     for (int i = 5; i <25; i++){
      fill(255,alpha/40);
    ellipse(x, y, i, i);
    }
  }
}



