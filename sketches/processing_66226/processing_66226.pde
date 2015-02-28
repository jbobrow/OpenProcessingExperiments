
//  Title: Equidistant Sphere
//  Description: Visualize perlin noise as a vector field with particles.  Particle follow the contours of the perlin noise throughout the window.
//  Date Started: Jul 2012
//  Last Modified: Jul 2012
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
ParticleSystem particleSystem;
float scaleFactor = 300;

//-----------------Setup
void setup(){
  size(800,800,P3D);
  background(0);
  stroke(255);
  noFill();
  smooth();
  //create a particle system with 3 particles
  particleSystem = new ParticleSystem(1);
}

//-----------------Main Loop
void draw(){
  background(0);
  //use the mouse to change the viewing angle
  translate(width/2,height/2,0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  //update and render the system of particles
  particleSystem.update();
  particleSystem.render();
}

//-----------------Interactions
void mousePressed(){
  particleSystem.particles.add(new Particle3D());
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("eqSphere-####.pdf");
  }
  if (key == 'r') {
    particleSystem.particles.remove(int(random(particleSystem.particles.size())));
  }
}

//-----------------Defined Functions
  
//-----------------Defined Classes
class ParticleSystem {
  ArrayList particles;
   
  ParticleSystem(int initialNumber) {
    particles = new ArrayList(initialNumber);
    for(int i = 0; i < initialNumber; i++) {
      particles.add(new Particle3D());
    }
  }
   
  void update() {
    //for each particle in the list
    for(int i = 0; i < particles.size(); i++) {
      Particle3D particleI = (Particle3D)particles.get(i);
      //compare it to every other particle in the list
      for(int j = 0; j < particles.size(); j++) {
        Particle3D particleJ = (Particle3D)particles.get(j);
        //except itself!
        if (i != j) {
          //and compute the distance between the particles
          float d = particleI.position.dist(particleJ.position);
          //calculate the force based off of a 1/d^2 law
          if (d > 0) {
            float f = 100000.0/sq(d);
            float dx = particleI.position.x - particleJ.position.x;
            float dy = particleI.position.y - particleJ.position.y;
            float dz = particleI.position.z - particleJ.position.z; 
            //add half of the force to particle 1
            particleI.velocity.add(f/2 * (dx/d),f/2 * (dy/d),f/2 * (dz/d));
            //and subtract the other half from particle 2, so that they 'repel' each other.
            particleJ.velocity.add(-f/2 * (dx/d),-f/2 * (dy/d),-f/2 * (dz/d));
          }
        }
      }
      //then go ahead and update the particle AFTER we have summed up the forces from all of the particles.
      particleI.update();
    }
  }
  
  void render() {
    //go through all particles, run their individual render() method.
    for(int i = 0; i < particles.size(); i++) {
      Particle3D particle = (Particle3D)particles.get(i);
      particle.render();
    }
  }
      
}


class Particle3D {
  PVector position, velocity;
  color particleColor = 255;
  
  Particle3D() {
    //randomly place the particle within a 2 x 2 x 2 cube around the origin
    position = new PVector(random(1) - 0.5,random(1)-0.5,random(1)-0.5);
    //and normalize the vector to place it on the unit sphere
    position.normalize();
    velocity = new PVector();
    
  }
   
  void update() {
    //add a velocity to the position
    position.add(velocity);
    //normalize the position vector so that we've put it back on the unit sphere
    position.normalize();
  }
 
  void render() {
    //draw the particle
    pushMatrix();
    //make the sphere bigger by scaling everything by scale factor
    translate(scaleFactor*position.x,scaleFactor*position.y,scaleFactor*position.z);
    sphere(1);
    popMatrix();
    //draw a line to the origin to make the sphere easier to see
    line(scaleFactor*position.x,scaleFactor*position.y,scaleFactor*position.z,0,0,0);
  }
}

