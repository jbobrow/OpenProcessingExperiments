
Particle[] particles = new Particle[0];
int maxParticles = 900; 

void setup() { 
  size(600,400);   
  
  
}

void draw() { 
  
  background(0); 
  
 
  while(particles.length>maxParticles) { 
    particles = (Particle[]) subset(particles, 1);  
    
  }

  for(int i=0; i<particles.length; i++) {   
    particles[i].update();

  }
  
}

void mousePressed() { 
  
  
  for(int i = 0; i<300; i++) { 
    Particle p = new Particle(mouseX,mouseY);
    p.yVel = random(-5,5); 
    p.xVel = random(-5,5); 
    //p.opacity = random(50,100);
    p.gravity = 0.1; 
    //p.fadeSpeed = 0.96;
    p.shrink = 0.97; 
    
    particles = (Particle[]) append(particles, p );
  }
}


class Particle {
  
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
    x = xpos; 
    y = ypos; 
    xVel = random(-5,5); 
    yVel = random(-5,5); 
    particleSize = random(5,20);
    
    opacity = 255; 
    gravity = 0;
    fadeSpeed = 1; 
    shrink =1; 
     
  }
  
  void update() { 
    x+=xVel;
    y+=yVel; 
    opacity*=fadeSpeed;
    yVel += gravity; 
    particleSize*=shrink; 
    
    noStroke();
    fill(255,opacity);
    ellipse(x, y, particleSize, particleSize);
  }
  
}
