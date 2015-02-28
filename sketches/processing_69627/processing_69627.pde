
//  Title: Hex Perlin Kalediscope
//  Description: Visualize dperlin noise as a discrete (6-fold) vector field with particles.  Particle follow the contours of the perlin noise throughout the window.
//  Date Started: Sept 2012
//  Last Modified: Sept 2012
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
int symmetry = 6;

//-----------------Setup
void setup(){
  size(800,600);
  background(0);
  noFill();
  smooth();
  particleSystem = new ParticleSystem(100);
}

//-----------------Main Loop
void draw(){
  particleSystem.update();
  
  for(int i = 0; i < symmetry; i++) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(i*TWO_PI/symmetry);
    particleSystem.render();
    popMatrix();
  }
}

//-----------------Interactions

void mousePressed(){
  for(int i = 0; i < 20; i++) {
    particleSystem.particles.add(new Particle());
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("hexperlinKaleidoscope-####.png");
  }
  if (key == CODED) {
    if (keyCode == UP) {
      background(0);
      symmetry++;
    }
    if (keyCode == DOWN) {
      background(0);
      symmetry--;
    }
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
  int lifetime = floor(random(15000)+20000);

  Particle()
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector();
  }
   
  void update() {
    float angle = radians(60*floor(6*noise(0.005*position.x,0.005*position.y)));
    velocity.x = 0.5*cos(angle);
    velocity.y = 0.5*sin(angle);
    position.add(velocity);
    lifetime--;

    //deal with edge cases     
    if (position.x<0) {
       position.x+=width;
    }

    if (position.x>width/2) {
       position.x-=width;
    }

    if (position.y<0) {
       position.y+=height;
    }

    if (position.y>height/2) {
       position.y-=height;
    } 
  }
 
  void render() {
    stroke(particleColor,2);
    line(position.x,position.y,position.x+velocity.x,position.y+velocity.y);
  }
}

