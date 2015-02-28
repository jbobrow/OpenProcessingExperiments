
//  Title: Hexagonal Perlin Field
//  Description: 
//  Date Started: 2012 Jul
//  Last Modified: 2012 Jul
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

//-----------------Setup
void setup(){
  size(800,600);
  background(0);
  noFill();
  smooth();
  frameRate(30);
  particleSystem = new ParticleSystem(300);
}

//-----------------Main Loop
void draw(){
  if (particleSystem.particles.size() < 200 ) {
    for (int i = 0; i < random(50,150); i++) {
      particleSystem.particles.add(new Particle());
    }
  }
  particleSystem.update();
  particleSystem.render();
}

//-----------------Interactions
void mousePressed(){
  for(int i = 0; i < 100; i++) {
    particleSystem.particles.add(new Particle());
  }
}

void keyPressed() {
  if (key == ' ') {
   saveFrame("hexperlin-####.png");
  }
}
//-----------------Defined Functions

//-----------------Defined Classes
class ParticleSystem {
  ArrayList particles;
  float z = random(17);
   
  ParticleSystem(int initialNumber) {
    particles = new ArrayList(initialNumber);
    for(int i = 0; i < initialNumber; i++) {
      particles.add(new Particle());
    }
    for(int i = 0; i < particles.size()-1; i++) {
      Particle particle = (Particle)particles.get(i);
      particle.position.z = z;
    }
  }
   
  void update() {
    for(int i = 0; i < particles.size()-1; i++) {
      Particle particle = (Particle)particles.get(i);
      if (particle.lifetime > 0) {
        particle.update();
      }
      else {
        //remove particle
        particles.remove(i);
      }
    }
    println(particles.size());
  }
   
  void render() {
    for(int i = 0; i < particles.size() - 1; i++) {
      Particle particle = (Particle)particles.get(i);
      particle.render();
    }
  }
}


class Particle {
  PVector position, velocity;
  color particleColor = 255;
  int lifetime = floor(random(3000));

  Particle()
  {
    position = new PVector(random(width),random(height),0);
    velocity = new PVector();
  }
   
  void update() {
    float angle = radians(60*floor(6*noise(0.005*position.x,0.005*position.y,0.01*position.z)));
    velocity.x = 0.5*cos(angle);
    velocity.y = 0.5*sin(angle);
    position.add(velocity);
    lifetime--;

    //deal with edge cases     
    if (position.x<0) {
       position.x+=width;
    }

    if (position.x>width) {
       position.x-=width;
    }

    if (position.y<0) {
       position.y+=height;
    }

    if (position.y>height) {
       position.y-=height;
    } 
  }
 
  void render() {
    stroke(0,particleColor,0,16);
    line(position.x,position.y,position.x-velocity.x,position.y-velocity.y);
  }
}

