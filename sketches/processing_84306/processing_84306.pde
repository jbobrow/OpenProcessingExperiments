
/*
This code is aimed to show a simple method how to create
a continous and smooth pathway with almost direct usage of
the random() function and without Perlin noise.

The algorithm has to be improved.

Read the Particle class and the .update() method
to get the idea.

I release the code as Public Domain.
Pawel Tokarz, aka outslider

*/

float posStep = 0.3;
int   nParticles = 300;
Particle[] particles;

void setup() {
  size(700,700);
  frameRate(60);
  background(0);
  particles = new Particle[nParticles];
  
  for(int i=0; i<nParticles; i++) {
    particles[i] = new Particle();
  } 
}

void draw() {
  fill(0,0,0,5);
  rect(0,0,width,height);
  translate(width/4, height/2);

  for(int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
}

void keyPressed() {
}


class Particle {
  
  PVector pos;
  float angle;
  float dRange;
  float dAngle;
  color c;
//  PVector pos;
  
  Particle() {
    pos = new PVector(0,0);
    angle  = 0;
    dRange = 0.001;
    dAngle = 0;    
    c = color(random(255),random(255),random(255));
  }
  
  void update() {
    float cor = 0.5*dRange*atan(angle)/PI;
    float randNum = (random(2)-1)*dRange-cor;  //Random number from (-dRange, dRange)
    dAngle+=randNum;                       //We don't change the angle directly
                                           //but its differential - source of the smoothness! 
    
    angle+=dAngle;                         //new angle is angle+dAngle
  
    pos.x+=posStep*cos(angle);            //just move on step
    pos.y+=posStep*sin(angle);
  }
  
  void show() {
    fill(c);
    noStroke();
    ellipse(pos.x,pos.y,3,3);
  }
}
