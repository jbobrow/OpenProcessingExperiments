
class Particle {

  // Declared variables

  // PVector allows you to log x, y, and z positions in a single variable

  PVector particlePos;    
  PVector particleVel;    
  PVector particleAcc;    

  // Particle constructor

  Particle (float tempx, float tempy, float tempz) {

    particlePos = new PVector(tempx, tempy, tempz);   // particle position

    particleVel = new PVector();
    particleAcc = new PVector();
  } 


  void update() {

    // "f" is friction, useful.
       
    particleVel.add( particleAcc );               
    particlePos.add( particleVel );               
    particleVel.mult( 0.98f );                             
    particleAcc.set( 0, 0, 0 );                   // reset acceleration 
    mouseAttract();      
    bounce();
  }  

  void display() {

    fill(255, 255, 255);       
    ellipse( particlePos.x, particlePos.y, 3, 3 );
  }  


  // World Bounding

void bounce() {

    if (particlePos.x < 0) {
      particleVel.x *= -1.0f;
    }

    if (particlePos.x > width ) {
      particleVel.x *= -1.0f;
    }

    if (particlePos.y < 0) {
      particleVel.y *= -1.0f;
    }
    
    if (particlePos.y > height ) {
      particleVel.y *= -1.0f;
    }    
    
}  

  void mouseAttract() {

    PVector mousePosition = new PVector( mouseX, mouseY );         // logs mouse position as a value

    mousePosition.sub(particlePos);                               // subtracts mouse position from particle position

    // subtract the mouse position from the particle position. Gives you the difference vector between the 2

    float magnitude = mousePosition.mag();  // "mag" calculates the length of the PVector "mousePosition" and returns the value
    particleAcc.set( mousePosition );               // sets the acceleration to the value of MousePosition

      // sets acceleration based on the particle distance from the mouse

    particleAcc.mult( 1 / (magnitude * magnitude) );
    
    // Particle Acceleration * [1 / (distance between mouse and particle)squared]
    // This gives you increased acceleration the closer the two are together
    
  }
}  


