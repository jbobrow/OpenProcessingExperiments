
// see http://en.wikipedia.org/wiki/Collatz_conjecture 
// or http://www.spiegel.de/wissenschaft/mensch/0,1518,766643,00.html 
// for the explanation to iterate()

// lots of code was adapted from http://www.openprocessing.org/visuals/?visualID=22525

import org.gicentre.utils.colour.*;
import org.gicentre.utils.io.*;
import org.gicentre.utils.gui.*;
import org.gicentre.utils.move.*;
import org.gicentre.utils.multisketch.*;
import org.gicentre.utils.stat.*;
import org.gicentre.utils.*;
import org.gicentre.utils.network.*;
import org.gicentre.utils.spatial.*;
import org.gicentre.utils.geom.*;

import toxi.processing.*;
import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;


HashMap nums = new HashMap();
VerletPhysics2D physics;
int iteration = 1;
ZoomPan zoomer;

void setup() {
  size(900, 900);

  smooth();
  zoomer = new ZoomPan(this);
  zoomer.setZoomMouseButton(RIGHT);
  zoomer.setPanOffset(width/2, height/2);
  initPhysics();
  textFont(createFont("SansSerif", 10));
}

void draw() {
  zoomer.transform();
 
  // 1st update
  physics.update();
  // then drawing
  background(224);
  // draw springs
  stroke(255, 0, 255);
  strokeWeight(5);
  for (VerletSpring2D s : physics.springs) {
    line(s.a.x, s.a.y, s.b.x, s.b.y);
  }

  // then all particles
  noStroke();
  for (VerletParticle2D p : physics.particles) {
    fill(0);
    ellipse(p.x, p.y, 20, 20);
    // also draw label if needed
    if (p instanceof LabeledParticle) {
      // first need to cast particle to be a LabeledParticle
      // in order to access its label property
      LabeledParticle lp = (LabeledParticle) p;
      fill(0, 0, 128);
      text(lp.name, p.x, p.y-4);
    }
  }

  if (frameCount%10 == 0) {
    iteration++;
    iterate(iteration);
  }
}

void addN(LabeledParticle n) {
  physics.addParticle(n);
  physics.addBehavior(new AttractionBehavior(n, 400, -1));

  nums.put(n.name, n);
}

void iterate(int v) {
  LabeledParticle lastNode = new LabeledParticle(random(width), random(height), v);
  addN(lastNode);

  while (v > 1) {
    if (v%2 == 0) {
      v = v/2;
    } 
    else {
      v = 3*v+1;
    }

    if (nums.containsKey(str(v))) {
      LabeledParticle n = (LabeledParticle) nums.get(str(v));
      physics.addSpring(new VerletSpring2D(lastNode, n, 10, 0.01));
      return;
    } 
    else {
      LabeledParticle n = new LabeledParticle(random(width), random(height), v);
      addN(n);
      if (lastNode != null) {
        physics.addSpring(new VerletSpring2D(n, lastNode, 10, 0.01));
      }
      lastNode = n;
    }
  }
  LabeledParticle n = (LabeledParticle) nums.get(str(v));
  physics.addSpring(new VerletSpring2D(lastNode, n, 10, 0.01));
}

void initPhysics() {
  physics = new VerletPhysics2D();
  // we increase the drag (loss of energy) to 5% to avoid to much chaos
  // during the force directed layout process
  // disabling or choosing lower values will result in a
  // longer period until the system has settled
  physics.setDrag(0.05);
  // set screen bounds as bounds for physics sim
  physics.setWorldBounds(new Rect(-20*width, -20*height, 20*width, 20*height));
  // create a fixed root particle to connect all clusters to
  LabeledParticle n1 = new LabeledParticle(0, 0, 1);
//  n1.lock();
  addN(n1);
}

class LabeledParticle extends VerletParticle2D {
  String name;

  LabeledParticle(float x, float y, int label) {
    super(x, y);
    name = str(label);
  }
}


