

Particle [] pickles = new Particle[0]; 

void setup () {

  size (500, 500);
  smooth();
  noStroke();
  
//  for (int i = 0; i < pickles.length; i++){
//  pickles[i] = new Particle();
//  }
  
}

void draw() {
  
  background(60, 0, 60);
  
  pickles = (Particle[])append (pickles, new Particle());
  for (int i = 0; i < pickles.length; i++){  
  pickles[i].update();
  }
  // check to see if we have more than 10 particles and if so...
  if (pickles.length > 50){
   // take the oldest off the front of the array
   pickles = (Particle[])subset(pickles, 1);
    
  }
  
}

class Particle {

  // position properties for the Particle
  float x;
  float y;

  // velX and velY is the same as speedX and speedY
  float velX;
  float velY;
  
  float drag;

  // Constructor:  this is a special function that is called whenever a Particle
  // is instantiated. 
  Particle () {

    // x and y positions are set to the center of the screen
    x = mouseX;
    y = mouseY;

    // setting speed to be random
    velX = random (-10, 10);
    velY = random (-10, 10);
    
    drag = 0.96;
  }

  void update() {
    
    // add a velocity for the particles
    velX *= drag;
    velY *= drag;
    
    // add gravity
    velY += 0.5;
    
    x += velX;
    y += velY;
    
    fill (255);
    ellipse (x, y, 10, 10);
    
  }
  
  
}

