
//  Title: Particle Emitter Example 2
//  Description: A continuous particle emitter that decides whether to emit a 
//  particle or not in each frame using a perlin noise comparator.  The pattern
//  is very reminiscent of flowing liquid.
//  Date Started: 2012 Mar 19
//  Last Modified: 2012 Mar 20
//  [Your website, portfolio, or other links]
//  [Feel free to change the license too!]
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
/* These are variables that you want to exist throughout the entire sketch.*/
int numParticles = 1;
Particle[] particleArray = {};
int frameNumber = 0;
float generateSeed;

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
the sketch size, background color, framerate, etc. etc.*/
void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(30);
  noStroke();
  fill(150,50);
  generateSeed = random(17);
}

//-----------------Main Loop
/*This is the main loop of your sketched.  This loop gets called over and over again until you quit the sketch.*/
void draw(){
  fill(0,64);
  rect(0,0,width,height);
  if (noise(generateSeed) > 0.5){
     drawParticles();
  }
  for(int i = 0;i < particleArray.length;i++){
    Particle particleInstance = particleArray[i];
    particleInstance.update();
    particleInstance.display();
  }
  frameNumber++;
  generateSeed += 0.1;
}

void drawParticles(){
  for(int i = 0; i < numParticles; i++){
   Particle particleInstance = new Particle();
   particleInstance.display();
   particleArray = (Particle[])append(particleArray,particleInstance);
  }
}

//-----------------Defined Classes
/*Place any defined classes here.  We'll go over this later*/
class Particle {
  //particle properties go here
  //each particle should have a position and velocity, as well as color (at minimum; feel free to add more!)
  float x,y,radius,theta,noiseSeed,dR;
  color fillColor;
  
  //this is the constructor
  Particle() {
    x = width/2;
    y = height/2;
    noiseSeed = random(17);
    radius = 5;
    dR = 2;
    theta = 0;
    fillColor = color(0,random(255),0);
  }
  
  //and these are the methods
  void display() {
    fill(fillColor);
    ellipse(x,y,10,10);
  }  
  
  void update() {
    radius += dR*noise(0.2*x,0.2*y,0.1*frameNumber) - dR/4;
    theta += 2;
    x = width/2 + radius*cos(radians(theta));
    y = height/2 + radius*sin(radians(theta));

  }
}

