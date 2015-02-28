
// refers to class / [] = Array / particles is name of the array
Particle[] particles = new Particle[0];


int maxParticles =100;

void setup () {
  size (400, 400);
}


void draw() {

  background(0);
  // this line of code makes a new particle and appends it onto the end of the particles Array
  // name of array (particles) / (particle[]) = force code, append adds to a particle
  particles = (Particle[]) append(particles, new Particle(300, 0));
  // The code below kills off the particles so that they do not overload
  // if statement to test the length of the maxParticles
  // subset to delete the particles

  if (particles.length>maxParticles) {
    particles = (Particle[]) subset(particles, 1);
  }
  // for loop for updating particles in the array
  for (int i=0; i<particles.length; i++) {
    // variable dave.x plus xVel, this adds them together from the particle class
    // repeat with Y 
    // This code makes it move by adding them together

      particles[i].x += particles[i].xVel;
      particles[i].y += particles[i].yVel;
     // particles[i].partsize *=0.95;      // times the number of to make it shrink
     // particles[i].yVel +=0.5;   // gravity
    // dave.x dave.y refers to the x & y position of particle dave class

    ellipse(particles[i].x, particles[i].y, particles[i].partsize, particles[i].partsize);
  }
}
// THIS IS THE CLASS
// defines a custom class, allows it to be used above void setup
//class name always has to start with a capital - seb said
class Particle {

  float x;          // adds x position property
  float y;          // adds y position property
  float xVel;       // adds xvel property
  float yVel;       // adds yvel property
  float partsize;   // adds a size property


  //Constructor = function// float says where it is xpos/ypos
  Particle(float xpos, float ypos) {
    // assigning the values
    x = xpos = random (0,600);
    y = ypos;
    xVel = random (-2, 2);   // random,(the length of the random)
    yVel = random (0, 5);    // controls the speed that the snow falls
    partsize = random (5, 10);
  }
}
