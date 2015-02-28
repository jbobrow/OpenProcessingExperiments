
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

float posStep = 0.4;
int   nParticles = 500;
Particle[] particles;

void setup() {
  size(700,700,P2D);
  frameRate(60);
  background(0);
  particles = new Particle[nParticles];
  
  for(int i=0; i<nParticles; i++) {
    particles[i] = new Particle();
  } 
}

void draw() {
  fill(0,0,0,10);
  rect(0,0,width,height);
//  background(0);
  translate(width/2, height/2);

  for(int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
}

/* Useless
void keyPressed() {
  PVector q = new PVector(random(width)-width/2,random(height)-height/2);
  for(int i=0; i<nParticles; i++) {
    particles[i].pos = new PVector(q.x, q.y);
    particles[i].angle  = random(TWO_PI);
    particles[i].dAngle = 0;
  }
}
*/

void mousePressed() {
  for(int i=0; i<nParticles; i++) {
    particles[i].pos = new PVector(mouseX-width/2, mouseY-height/2);
    particles[i].angle  = random(TWO_PI);
    particles[i].dAngle = 0;
  }
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
    angle  = random(TWO_PI);
    dRange = 0.01;
    dAngle = 0;    
    c = color(random(255),random(255),random(255));
  }
  
  void update() {
    float cor = dRange*atan(15*dAngle)/PI;
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
    ellipse(pos.x,pos.y,2,2);
//    ellipse(frameCount/10-100,10*angle,2,2);
  }
}

