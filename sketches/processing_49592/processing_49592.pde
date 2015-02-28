
final int numberOfParticles = 100;

final int simWidth = 900;
final int simHeight = 450;
final float initRange = 2.0;
final float massMin = 1.0;
final float massMax = 10.0;

final float mouseForce = 0.01;

final float masterDampening = 0.96;
final float noiseMulti = 0.1;

class c_Particle {

  PVector position;
  PVector velocity;
  PVector clr;
  float mass;
  boolean bIsClickedOn;

  c_Particle() {
    position = new PVector((simWidth / 2.0) + random(-initRange, initRange), (simHeight / 2.0) + random(-initRange, initRange));
    velocity = new PVector(0.0, 0.0);
    clr = new PVector(33.0, 64.0, 255.0);

    mass = random(massMin, massMax);
    bIsClickedOn = false;
  }

  void drw() {

    pushMatrix();
    translate(position.x, position.y);
    fill(clr.x, clr.y, clr.z, velocity.mag()*128);
    //sphere(mass);
    ellipse(0, 0, mass, mass); 
    popMatrix();
  }
}

/*
 
 Spastic Bubbles
 
 2D simulation of particles with very strange properties.
 
 
 
 */

ArrayList particles;
boolean bDoMouseForce;

void setup() {

  background(0);
  size(900, 450);
  frameRate(30);

  particles = new ArrayList();

  for (int i = 0; i < numberOfParticles; i++) {   
    particles.add((new c_Particle()));
  }
}



void draw() {

  particleSolver();

  //background(0,0,0,1);
  fill(0, 0, 0, 64);
  rect(0, 0, simWidth, simHeight);

  for (int i = 0; i < particles.size(); i++)
  {
    c_Particle thisParticle = (c_Particle) particles.get(i);
    thisParticle.drw();
  }
}

void particleSolver() {

  for (int i = 0; i < particles.size(); i++) {   
    c_Particle thisParticle = (c_Particle) particles.get(i);  
    for (int j = 0; j < particles.size(); j++) {              
      if (i!=j)
      {
        c_Particle thatParticle = (c_Particle) particles.get(j);

        float collisionD = thisParticle.mass + thatParticle.mass;
        float springConst = 0.05;

        float d = thatParticle.position.dist(thisParticle.position);      
        if (d < (collisionD)) {
          if (d < collisionD * 0.5) {
            thisParticle.velocity.x += ( -1 * springConst * (thatParticle.position.x - thisParticle.position.x));
            thisParticle.velocity.y += ( -1 * springConst * (thatParticle.position.y - thisParticle.position.y));
            thisParticle.velocity.mult(0.99);
          }
          else
          {
            thisParticle.velocity.x += ( springConst * (thatParticle.position.x - thisParticle.position.x));
            thisParticle.velocity.y += ( springConst * (thatParticle.position.y - thisParticle.position.y));
          }

          // inherit a little of their neighbors velocity
          thisParticle.velocity.x += thatParticle.velocity.x * 0.001;
          thisParticle.velocity.y += thatParticle.velocity.y * 0.001;
        }  // end of collision check
      }  // if (i != j)
    } // j
  }  // i




  for (int i = 0; i < particles.size(); i++)
  {
    c_Particle thisParticle = (c_Particle) particles.get(i);

    if (thisParticle.position.x > 900) {
      thisParticle.position.x = 900.0 - (thisParticle.position.x - 900.0);
      thisParticle.velocity.x *= -1;
    }
    if (thisParticle.position.y > 450) {
      thisParticle.position.y = 450.0 - (thisParticle.position.y - 450.0);
      thisParticle.velocity.y *= -1;
    }
    if (thisParticle.position.x < 0) {
      thisParticle.position.x = -1 * thisParticle.position.x;
      thisParticle.velocity.x *= -1;
    }
    if (thisParticle.position.y < 0) {
      thisParticle.position.y = -1 * thisParticle.position.y;
      thisParticle.velocity.y *= -1;
    }

    // add noise
    thisParticle.velocity.x += noiseMulti * (noise(thisParticle.position.x, thisParticle.position.y, frameCount) - 0.5);
    thisParticle.velocity.y += noiseMulti * (noise(thisParticle.position.y, thisParticle.position.x, frameCount) - 0.5) ;

    // attract to the mouse pointer
    if (bDoMouseForce) {
      thisParticle.velocity.x += mouseForce * (mouseX - thisParticle.position.x);
      thisParticle.velocity.y += mouseForce * (mouseY - thisParticle.position.y);
    }
    else
    {
      thisParticle.velocity.x += mouseForce * (mouseX - thisParticle.position.x) * 0.01;
      thisParticle.velocity.y += mouseForce * (mouseY - thisParticle.position.y) * 0.01;      
    }

    thisParticle.velocity.mult(masterDampening);

    thisParticle.position.add(thisParticle.velocity);

    if (thisParticle.bIsClickedOn) {
      thisParticle.position.set(mouseX+0.0, mouseY+0.0, 0.0);
    }
  }
}

void mouseDragged() {

  bDoMouseForce = true;
}

void mousePressed() {
  bDoMouseForce = true;
  
} 

void mouseReleased() {

  
  bDoMouseForce = false;
}

void mouseMoved() {
}
                
