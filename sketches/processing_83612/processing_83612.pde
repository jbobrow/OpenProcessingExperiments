
Particle[] particles = new Particle[0];
int maxParticles =300;


void setup() {

  size(600, 400);
}

void draw() {

  background(0);
  
  Particle p = new Particle(300, 100);
  p.yVel = 0;
  p.xVel =  random(-1,1);
  p.opacity = random(50,100);
  p.gravity = -0.1;
  p.fadeSpeed = 0.96;
  p.shrink = 1.03;

  particles = (Particle[]) append(particles, p );

  if (particles.length>maxParticles) {
    particles = (Particle[]) subset(particles, 1);
  }

  for (int i=0; i<particles.length; i++) {
    particles[i].update();
    
  }
}

class Particle { 

  //particles properties
  float x;
  float y;
  float xVel;
  float yVel;
  float particleSize;
  float opacity;
  float gravity;
  float fadeSpeed;
  float shrink;


  Particle(float xpos, float ypos) {

    x = xpos = random(0, 600);
    y = ypos;
    xVel = random(-2, 2);
    yVel = random(0, 5);
    particleSize = random(1, 10);
    
    opacity = 255;
    gravity=0;
    fadeSpeed = 1;
    shrink=1;
  }
  
  //make a function call update
  //known as a method
  void update() {
    
    x += xVel;
    y += yVel;
    opacity *=fadeSpeed;
    yVel += gravity;
    particleSize *= shrink;
    
    noStroke();
    fill(255,opacity);
    ellipse(x,y,particleSize,particleSize);
  }
  
  
}



