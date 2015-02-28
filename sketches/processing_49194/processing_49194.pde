

// Particle is the type, pickles is the name of the array
// that contains them. Surreal naming thanks to Marie/Kirsty :) 
Particle[] pickles = new Particle[100];  

void setup() { 
  size(400, 400); 
  smooth(); 
  noStroke(); 
  
  // create a particle object at every index in the array
  for(int i=0; i<pickles.length; i++) { 
     pickles[i] = new Particle(); 
  }
}

void draw() { 
  // clear the background
  background(0); 
  
  // update and draw all the particles
  for (int i=0; i<pickles.length; i++) { 
    pickles[i].update();
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
  
  // constructor : this is a special function that is 
  // called whenever a Particle is instantiated. 
  Particle() {

    // set the x and y position to be in the middle of the
    // screen. 
    x = width/2; 
    y = height/2;

    // set the velocity to be a random number 
    // in both x and y directions. 
    velX = random(-10, 10); 
    velY = random(-10, 10);
    
    drag = 0.96; 
    
  }

  void update() { 

    // apply drag to our velocity
    velX*=drag; 
    velY*=drag; 
    
    // add the velocity to the position
    x+=velX;
    y+=velY;  
    
    // set the fill colour and draw the particle
    fill(255); 
    ellipse(x, y, 10, 10);
   
  }
}
                
