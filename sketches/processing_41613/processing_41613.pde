
// Original GenParticle sketch from Processing textbook p. 483
//modified from Lab 7 GenParticle code provided by Nick Senske

//extend GenParticleDemo to generate two new, different particle types
//use the old particle to make new particles that use some aspects of the old,
//but use the idea of inheritance to extend the original superclass to two, new subclasses
//so I have this hole that spews particles, and those particles fall out of the frame



int numParticles = 200; //this defines the number of particles within the sketch
GenParticle[] p = new GenParticle[numParticles]; //this declares the particle array and makes space in the array (the space made is directly related to the total number of particles in the sketch)


 
// void setup section-------------------------------------------------------------------------------------------------

void setup() { //this sets static information for the sketch, i.e., size of the sketch
  size(600, 600);
  noStroke(); //this sets static information or information that applies to everything in the sketch
  smooth();
  for (int i = 0; i < p.length; i++) { //seed the array; this creates a loop for the particles; basically keep spewing particles 
    float velX = random(-1, 1); //this says make the particles randomly spew to the left and right between -1 and 1
    float velY = -i;//this says make the particles drop vertically

    p[i] = new GenParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
    
    if(width == height){
      p[i] = new AParticle(width/2, height, velX, velY, 5.0, width/2, height);
    }
    if(width == width/2){
      p[i] = new BParticle(width/2, height, velX, velY, 0, width/2, height); 
    }
  }
}
 
 
 
// void draw section-------------------------------------------------------------------------------------------------

void draw() { //this draws the sketch
  fill(0, 36); //this states when redrawing the background make it 36% tranparent
  rect(0, 0, width, height); //this says make the background keep redrawing so that the particles don't just becme a stream; instead they will read as individual moving objects on screen
  fill(255, 60);  //this states fill the particle with white and make it 60% transparent
  for (int i = 0; i < p.length; i++) { //this loop draws the seeded array
    p[i].update(); //this ties the looping to continual updating
    p[i].regenerate(); //this ties the looping to contiual regeneration of the sketch
    p[i].display(); //this ties the looping to continual displaying of the sketch
  }
}



 //AParticle = SUB PARTICLE -------------------------------------------------------------------------------------------------
 
class AParticle extends GenParticle {
  float age;
 
  AParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
    age = random(100);
  }
 
  void update() {
if(y == height) { // water flow
      y = height/2;
      vy = -0.5 * vy;
      radius = radius * 0.75;
    }
    vy = vy + gravity;
    y = vy;
    x += vx;
    age++;
  }
 
  void display() {
    color c = lerpColor(color(60,130,225,30), color(255,255,255,5), age * 0.005);
    ellipse(x, height/2, radius, radius);
  }
 
  void regenerate() {
    if (age > 300) {
      x = originX;
      y = originY;
      vx = random(-1.5, 1.5);
      vy = random(-1, -0.5);
      age = 0;
      radius = 5.0;
    }
  }
}



 //BParticle = SUB PARTICLE -------------------------------------------------------------------------------------------------
 
class BParticle extends GenParticle {
  float direction;
 
  BParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }
 
  void display() {
    ellipse(width/2, y-height, radius*6, radius*6);
    //radius-=0.25;
  }
 
  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-0.1, 0.1);
      vy = random(-1.0, -1.0);
      radius = 5.0;
    }
  }
}
 
 
 
//GenParticle = SUB PARTICLE -------------------------------------------------------------------------------------------------

class GenParticle extends Particle { //this is extending (copying) the Particle class and adding new variable to it; this is the particle as it shifts direction from spew upward out of the hole and move in its downward decent
  float originX, originY; //this says there will be an originX and an OriginY specified later in the code; it declares these labels so they can be used in further intructions

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) { //this says each sub particle's character and movement will be made up of these things and these things (variables) will be specifed later in the code
    super(xIn, yIn, vxIn, vyIn, r); //this says copy the defined character and movement of the original (super) particle class
    originX = ox; //this says originX is also ox
    originY = oy; //this says originY is also oy
  }

  void regenerate() { //this says after doing the Particle class code, do the following...
    if ((x > width + radius) || (x < -radius) || //if x is greater than width + radius and x is less than -radius...
        (y > height + radius) || (y < -radius)) { //and y is greater than height + radius and y is less than -radius...
      x = originX; //this says if the statement is true, x becomes originX ****?little confused what this is actually doing
      y = originY; //this says if the statement is true, y becomes originY ****?little confused what this is actually doing
      vx = random(-1.0, 1.0); //if all is true in the "if" statement, do this; make the GenParticle move randomly at a horizontal velocity between -1.0 and 1.0; this visually appears as the moment in the sketch when the particle arcs from the upward motion to the falling motion and some of them speed up just slightly through this change in direction and some of them slow down just slightly during this change in direction
      vy = random(-4.0, -2.0); //if all is true in the "if" statement, do this; make the GenParticle move randomly at a vertical velocity between -4.0 and -2.0
    }
  }
}
 
 

// Particle = SUPER-------------------------------------------------------------------------------------------------

class Particle { //this is making a class for the particles; this is the particle as it spew from the hole
  float x, y; //this says there will be an x and y specified to later in the code; the x- and y-coordinates; it declares these labels so they can be used in further intructions
  float vx, vy; //this says there will be a vx and vy or a velocity for the x and y specified to later in the code; the x- and y-velocities; it declares these labels so they can be used in further intructions
  float radius; //this says there will particle radius specified to later in the code; it declares these labels so they can be used in further intructions
  float gravity = 0.1; //this says there will be gravity specified later in the code; the gravity with which the particles will fall; it declares these labels so they can be used in further intructions


  Particle(float xpos, float ypos, float velx, float vely, float r) { //this says each particle's character and movement will be defined by its x position, y position, velocity it moves along the x axis, velocity it moves along the y axis and its radius
    x = xpos; //this says x is also xpos, the x position of the particle
    y = ypos; //this says y is also ypos, the y position of the particle
    vx = velx;  //this says vx is also velx, the velocity the particle moves along the x axis
    vy = vely;  //this says vy is also vely, the velocity the particle moves along the y axis
    radius = r; //this says radius is also r
  }

  void update() { //this says keep updating(redrawing) the sketch and do the following things...
    vy = vy + gravity; //this says each time the sketch is updated, speed up the vertical gravity, i.e., make the particles fall faster as they continue to fall
    y += y; //this says make the particles fall downward
    x += vx; //this says make the particles fall outward; this added to the downward motion makes the particle look as though it is spraying outward like from the end of a hose
  }

  void display() { //this says the particle looks like this...
    ellipse(x, y, radius*2, radius*2); //the particle is in the form of an ellipse; not sure where the size of the radius is coming from
  }
}

