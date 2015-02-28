

Particle[] pickles = new Particle[0];  
PImage particleImage; 

int maxParticles = 200; 


void setup() { 
  size(500, 500); 
  smooth(); 
  noStroke(); 
  
  // images will now be centred 
  imageMode(CENTER); 
  
  // load the image particle
  particleImage = loadImage("ParticleWhite.png"); 
 
}

void draw() { 
  // clear the background
  background(0); 
  
  
  pickles = (Particle[]) append(pickles, new Particle()); 
  
  // update and draw all the particles
  for (int i=0; i<pickles.length; i++) { 
    pickles[i].update();
  }
  // while we have more than the max number of particles... 
  while (pickles.length>maxParticles) {
    // take the oldest of the front of the array
    pickles = (Particle[]) subset(pickles, 1);
  }
}

class Particle {

  // position properties for our particle
  float x; 
  float y; 

  // velocity is the change in position every frame.
  float velX;
  float velY; 
  
  float drag; 
   
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
    // in both x and y directions. 
    velX = random(-4, 4); 
    velY = random(-4, 4);
    
    drag = 0.96; 
    
    particleSize = random(50,100); 
    shrink = 0.96; 
    
    gravity = 0; 
    opacity = 255;
    fade = 2;  
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
    
    if(opacity>0) { 
      // tint ensures that the image will be transparent when 
      // we draw it
      tint(255, opacity); 
      image(particleImage, x, y, particleSize, particleSize); 
    }
  }
}


