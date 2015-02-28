
//  Spring Play, adapted from:
//    Toxiclibs Code Example: The Infinite Rope
//    by Amnon Owed (05/05/2011)
//    minor refactorings by Karsten Schmidt (06/05/2011)
// By Justin Pinkney 02/07/2011
 
import processing.opengl.*;
 
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;
import toxi.geom.*;
import toxi.color.*;
 
VerletPhysics2D physics;
VerletParticle2D prev;
 
int continuous,current; // variables to create a new continuous line on each mouse drag
int fresh = 0; // variable for recording newness of set of particles
int frame = 0;
 
void setup() {
  size(640,400,P2D);
  smooth();
//  size(1000,600,OPENGL);
  physics = new VerletPhysics2D();
  // set the stroke weight of the line
  strokeWeight(2);
  background(255);
}
 
void draw() {
  // update all the physics stuff (particles, springs, gravity)
  physics.update();
 
  // draw a line segment for each spring and change the color of it based on the direction
  for(VerletSpring2D s : physics.springs) {
    // map the direction of each spring to a hue
    float currHue=map(s.b.sub(s.a).heading(),-PI,PI,0,1);
    // define a color in HSV and convert into ARGB format (32bit packed integer)
    stroke(TColor.newHSV(currHue,1,1).toARGB(),50);
    line(s.a.x,s.a.y,s.b.x,s.b.y);
  }
  for (int i=physics.particles.size()-1; i>=0; i--) {
    VerletParticle2D p = physics.particles.get(i);
    point(p.x,p.y);
  }
 
  // remove stuff that is off the screen to keep things running smoothly ;-)
  removeOffscreen();
}
 
void removeOffscreen() {
  // remove off-screen springs
  for (Iterator<VerletSpring2D> i=physics.springs.iterator(); i.hasNext();) {
    VerletSpring2D s=i.next();
    if (s.a.y > height+100 || s.a.y < -100  || s.a.x > width+100 || s.a.x < -100) {
      i.remove();
    }
  }
 
  // remove off-screen particles
  for (int i=physics.particles.size()-1; i>=0; i--) {
    VerletParticle2D p = physics.particles.get(i);
    if (p.y > height+200 || p.y < -200  || p.x > width+200 || p.x < -200 ) {
      physics.removeParticle(p);
    }
  }
}
 
void mouseDragged() {
  // create a locked (unmovable) particle at the mouse position
  VerletParticle2D p = new VerletParticle2D(mouseX,mouseY);
  p.lock();
  // if there is at least one particle and this is the current continuous line
  if (physics.particles.size() > 2 && continuous == current) {
    // get the previous particle (aka the last in the list)
    VerletParticle2D prev = physics.particles.get(physics.particles.size()-1);
    // create a spring between the previous and the current particle of length 10 and strength 1
    VerletSpring2D s = new VerletSpring2D(p,prev,10,1);
    // add the spring to the physics system
    physics.addSpring(s);
    
    // create second and third springs, but only if the new chain has enough particles
    if (fresh > 0){
      VerletParticle2D prev2 = physics.particles.get(physics.particles.size()-2);
      VerletSpring2D s2 = new VerletSpring2D(p,prev2,10,0.1);
      physics.addSpring(s2);
    }
    if (fresh > 1){
      VerletParticle2D prev3 = physics.particles.get(physics.particles.size()-3);
      VerletSpring2D s3 = new VerletSpring2D(p,prev3,10,0.1);
      physics.addSpring(s3);
    }
    fresh++;
  } else {
    current = continuous;
    fresh = 0;
  }
  // unlock previous particle
  if (prev!=null) {
    prev.unlock();
  }
  // add the particle to the physics system
  physics.addParticle(p);
  // make current particle the previous one...
  prev=p;
}
 
void mouseReleased() {
  if (prev!=null) {
    prev.unlock();
  }
  continuous++;
}

// KEYBOARD CONTROLS
void keyPressed() {
  switch(key) {
    case 's':
      String name = str(frame);
      save(name); // save on keypress s
      frame++;
      break;
    case 'r':
      setup(); // reset
      break;
    case 'x':
      removeAll();
    break;
    case 'y':
      changeSprings();
    break;
    }
}

void removeAll() {
  // remove all springs
  for (Iterator<VerletSpring2D> i=physics.springs.iterator(); i.hasNext();) {
    VerletSpring2D s=i.next();
    i.remove();
  }
}

void changeSprings() {
  // reduce spring strength
  for (Iterator<VerletSpring2D> i=physics.springs.iterator(); i.hasNext();) {
    VerletSpring2D s=i.next();
    s.setStrength(0.001);
  }
}

