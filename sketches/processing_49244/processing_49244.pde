

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

  // current rotation in degrees for the particle
  float rotation; 
  // change in rotation every frame
  float spin; 

  float gravity; 
  int opacity; 
  int fade; 

  // constructor : this is a special function that is 
  // called whenever a Particle is instantiated. 
  Particle( ) {

    // set the x and y position to be in the middle of the
    // screen. 
    x = mouseX; 
    y = mouseY;

    // set the velocity to be a random number between 
    // in both x and y directions. 
    velX = random(-10, 10); 
    velY = random(-10, 10);

    drag = 0.92; 

    particleSize = random(50, 100); 
    shrink = 0.9; 

    gravity = 0; 
    opacity = 255;
    fade = 0;  

    rotation = random(0, 360);
    spin = random(-5, 5);
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

    // add the spin to the rotation
    rotation+=spin; 

    // make the particle shrink
    particleSize *= shrink; 
    
    // and fade out
    opacity-=fade; 

    // if we're not faded out completely then draw the particle
    
    if (opacity>0) { 
      
      // images will now be centred 
      imageMode(CENTER); 


      // tint ensures that the image will be transparent when 
      // we draw it
      tint(255, opacity); 

      // save the current draw state
      pushMatrix(); 
      // move the origin to the middle of where the particle should be
      translate(x, y); 
      // rotate the co-ordinate system to match the particle's current
      // rotation.
      rotate(radians(rotation)); 
      // and draw the particle at the origin
      image(particleImage, 0, 0, particleSize, particleSize);
      // finally, restore the co-ordinate system back to how 
      // it was before we started screwing around with it 
      popMatrix();
    }
  }
}


