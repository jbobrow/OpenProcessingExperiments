
/*The particle animation that I am using is from Jared "BlueThen" C. www.bluethen.com
I only commented on the parts that I have tweaked and all the other stuff are mathematical based
formulas beyond my comprehension so I left it out but the original code posted on open processing
is really well documented. (Galaxy)*/

/*I don't know how to loop the audio so I modified the sound effect to last about a minute*/

PImage windy;

import ddf.minim.*;
Minim minim;
AudioPlayer wind;

int particleCount = 2000;
Particle[] particles = new Particle[particleCount+1];


void setup(){
  size(500,500);
  colorMode(RGB,2);
  frameRate(30);
  
  windy = loadImage("windy.jpg");
  minim = new Minim(this);
  wind = minim.loadFile("wind.mp3", 512);
  wind.play();
  
  for (int x = particleCount; x >= 0; x--) {
    particles[x] = new Particle();
  }
}

void draw(){
  tint(#fde1d0, 150);
  image(windy,0,0);
  translate(width/2,height/2);
  float turn = 0;
  
  if (mousePressed)
  turn = (mouseX - pmouseX) * 0.00001;

  for (int i = particleCount; i >= 0; i--) {
    Particle particle = (Particle) particles[i];
    particle.update(turn);
  }  
}

class Particle {
  float angle;
  float radius;
  PVector previous = new PVector();
  float dec;
  float tilt;
  float turnVelocity;
  
  Particle(){
    /*this seems to be controling how the particles are spread appart*/
    angle = random (0,628)*.01;
    /*this looks like it changes the width of the cylinder*/
    radius = random(30,250);
    /*this determines height of the cylinder of ratatoin*/
    tilt = random(-120,300);
    /*this is the speed of the constant rotation*/
    dec = (200 - radius)*.001;
  }
  void update (float turn) {
    PVector current = new PVector(radius * cos(angle), tilt + 20 * cos(angle + 3.5), radius * sin(angle));
    
    /*this is the the speed of the particle when the mouse is dragged*/ 
    if (turn != 0)
    turnVelocity = turn * (201-radius);
    
    /*this is the mathematical equation that determines the speed of the particle based on house fast the mouse was dragged*/
    angle -= dec + turnVelocity;
    
    /*this simulates friction
    it makes the particle slow down when truned fast
    anything above one completely takes away the friction as a result the particle won't stop spinning*/ 
    turnVelocity *= .99;
    
     if (previous.x == 0) {
      previous.set(current);
    }
    
    isoLine(current,previous,angle);
    previous.set(current);
  }
}

void isoLine(PVector begin, PVector end, float angle) {
  PVector newBegin = new PVector(int(begin.x - begin.z), int((begin.x + begin.z)/2 - begin.y));
  PVector newEnd = new PVector(int(end.x - end.z), int((end.x + end.z)/2 - end.y));
  stroke(1 + cos(angle));
  line (newBegin.x, newBegin.y, newEnd.x, newEnd.y);
}

