
//
// Author      : Kevin Lindley
// Title       : Atom
// Filename    : Atom.pde
// Date        : 17/10/2010
// Version     : 1.0.0.0
// Description : Simple class to simulate an Atom.
//
class Atom extends Particle {

// Default Contructor
Atom(float x, float y, float angle, float pspeed) {
  super(x,y,angle,pspeed);
  psize = 8;
  max_life = 1000;
}

// Set the Atom to Exploding State
void explode(Neutron neutron) {
  state = STATE_EXPLODING;
  pspeed = neutron.pspeed / 2.0;
  pangle = neutron.pangle;
  for (int index=0; index < NUMBER_NEUTRONS_RELEASED; index++) {
    neutrons[next_neutron] = new Neutron(xpos+random(0,2),ypos+random(0,2), neutron.pangle+random(-45,45), SPEED);
    next_neutron++;
  }
}

// Override the empty super class display function
void display() {
  if (state == STATE_EXPLODING) {
    // Modifier to fade the explosion over time.
    float Modifier = map(psize,5,INC_MAX_SIZE,0,255);
    fill(255,255,0,255-Modifier);
    //fill(255-Modifier,255-Modifier,255-psize/3,255-Modifier);
    noStroke();
    ellipse(xpos,ypos,psize,psize);
  }
  if (state == STATE_ALIVE) {
    fill(50,50,255,128);
    stroke(255,255,255,64);
    ellipse(xpos,ypos,psize*3,psize*3);
noFill();

float nsize=psize;

     ellipse(xpos-2,ypos+2,nsize,nsize);
      ellipse(xpos+2,ypos+2,nsize,nsize); 
      ellipse(xpos,ypos-2,nsize,nsize);
  }
}

}  //Atom class

