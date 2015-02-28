

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
// create an empty array ready to put particles in
 
Particle[] pickles = new Particle[0]; 
PImage particleImage;
 
// set the maximum number of particles allowed at once
int maxParticles = 100;
float positionx; 
float positiony; 
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
   minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 440, 0.5, Waves.SINE );
  // patch the Oscil to the output
  wave.patch( out );



}
 
void draw() {
  // clear the background
  background(0);
   
  // add 2 new particles into the array :
  for(int i=0; i<2; i++) {
    // adding a new particle into the array
    pickles = (Particle[]) append(pickles, new Particle());
  }
   
  // update and draw all the particles
  if(mousePressed){
    for (int i=0; i<pickles.length; i++) {
    pickles[i].update();
    }
  }
  // while we have more than the max number of particles...
  while (pickles.length>maxParticles) {
    // take the oldest of the front of the array
    pickles = (Particle[]) subset(pickles, 1);
  }
positionx = mouseX/width*500;
positiony = mouseY/height*1;
wave =  Oscil(positionx, positiony, Waves.SINE );

}
 
class Particle {
 
  // position properties for our particle
  float x;
  float y;
 
  // velocity is the change in position every frame.
  float velX;
  float velY;
   
  float drag;
   
  // the colour of the particle
  color c;
   
  float particleSize;
  float shrink;
   
  float gravity;
  int opacity;
  int fade;
 
  // constructor : this is a special function that is
  // called whenever a Particle is instantiated.
  Particle() {
 
    // set the x and y position to be in the middle of the
    // screen.
    x = mouseX;
    y = mouseY;
 
    // set the velocity to be a random number between
    // -10 and 10 in both x and y directions.
    velX = random(-2, 2);
    velY = random(-2, 2);
     
    drag = 0.96;
    
    c = color(random(210,255), 0, random(210,255));
     
    particleSize = random(2,10);
    shrink = 1.04;
     
    gravity = -0.2;
    opacity = 255;
    fade = 5; 
  }
 
  void update() {
 
    // apply drag to our velocity
    velX*=drag;
    velY*=drag;
     
    // add gravity;
    velY+=gravity;
     
    // add the velocity to the position
    x+=velX;
    y+=velY; 
     
    particleSize *= shrink;
    opacity-=fade;
     
    // only draw the particle if it's not completely transparent
    if(opacity>0) {
      fill(c, opacity);
      // set the fill colour and draw the particle
      rect(x, y, particleSize, particleSize);
    }
  }
}









