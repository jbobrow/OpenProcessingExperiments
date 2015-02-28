
//  Title: Perlin Kalediscope (Active)
//  Description: A visualizer based off of the perlin kaleidoscope.  Utilizes a blur-like effect to create vivid swirling patterns.
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
int stepSize = 5;
boolean blur = true;
boolean zMotion = true;

//-----------------Setup
void setup(){
  size(800,600);
  background(0);
  rectMode(CORNERS);
  noFill();
  smooth();
  particleSystem = new ParticleSystem(5);
}

//-----------------Main Loop
void draw(){
  fill(0,32);
  rect(0,0,width,height);
  particleSystem.update();
   
  for(int i = 0; i < symmetry; i++) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(i*TWO_PI/symmetry);
    particleSystem.render();
    popMatrix();
  }

   if (blur) {
    convolutionMask4(0xffffffff);
   }
}

//-----------------Interactions

void mousePressed(){
  for(int i = 0; i < 2; i++) {
    particleSystem.particles.add(new Particle());
  }
}

void keyPressed() {
  if (key == ' ') {
    saveFrame("perlinKaleidoscopeActive-####.png");
  }
  if (key == 'b') {
    blur = !blur;
  }
  if (key == 'z') {
    zMotion = !zMotion;
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

void convolutionMask4(int maskVal){
  loadPixels();
  int[] pixelArray = pixels;
  for(int i = 1; i < height-1; i++){
    int yStart=i*width+1;
    int yFinish=i*width+(width-1);
    for(int j = yStart; j < yFinish; j++) {
      pixelArray[j]=((pixelArray[j-width] & maskVal) + (pixelArray[j+width] & maskVal) + (pixelArray[j-1] & maskVal) + (pixelArray[j+1] & maskVal)) >> 2;
    }
  }
  updatePixels();
}



//-----------------Defined Classes
class ParticleSystem {
  ArrayList particles;
  float z = random(17);

  ParticleSystem(int initialNumber) {
    particles = new ArrayList(initialNumber);
    for (int i = 0; i < initialNumber; i++) {
      particles.add(new Particle());
    }
    for (int i = 0; i < particles.size()-1; i++) {
      Particle particle = (Particle)particles.get(i);
      particle.position.z = z;
    }
  }

  void update() {
    for (int i = 0; i < particles.size()-1; i++) {
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
    position = new PVector(random(width)/4,random(height)/4);
    velocity = new PVector();
  }
   
  void update() {
    velocity.x = stepSize*cos(TWO_PI*noise(0.01*position.x,0.01*position.y,0.01*position.z));
    velocity.y = stepSize*sin(TWO_PI*noise(0.01*position.x,0.01*position.y,0.01*position.z));
    if (zMotion) {
      position.z += stepSize;
    }

    position.add(velocity);
    lifetime--;

    //deal with edge cases     
    if (position.x<0) {
       position.x+=width/2;
    }

    if (position.x>width/2) {
       position.x-=width/2;
    }

    if (position.y<0) {
       position.y+=height/2;
    }

    if (position.y>height/2) {
       position.y-=height/2;
    } 
  }
 
  void render() {
    stroke(particleColor,255);
    line(position.x,position.y,position.x+velocity.x,position.y+velocity.y);
  }
}

