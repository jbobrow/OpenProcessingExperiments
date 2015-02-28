
/*
**  Elaborado por Thomas Sanchez Lengeling
**  Utilizando liberias de mesh para triangulacion de voronoi y delaunay y toxilibs
*/

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

class Particles {

  Particles(int numPoints) {
    addParticles(numPoints);
  }

  void addParticles(int numPoints) {
    int i =0;
    while ( i < numPoints) {
      float posX = random(pSize - width/2, width/2 - pSize);
      float posY = random(pSize - height/2, height/2 - pSize);
      VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().addSelf(posX, posY));
      p.addForce(new Vec2D(random(-1.0, 1.0), random(-2.0, 1.0)));
      p.setWeight(random(1, 3));
      physics.addParticle(p);
      i++;
    }
  }

  VerletParticle2D getParticle() {
    VerletParticle2D p = ((VerletParticle2D)physics.particles.get((int)random(numPoints)));
    return p;
  }

  void draw() {
    for (int i = 0; i < numPoints; i++) {
      VerletParticle2D p = ((VerletParticle2D)physics.particles.get(i));
      p.addForce(new Vec2D(random(-0.7, 0.7), random(-0.7, 0.7)));
      if (p.y >= height/2 -60 && p.x <= -width/2 -  50)
        p.addForce( new Vec2D(random(-0.4, -0.9), random(-0.1, -0.7)));
      ellipse(p.x - pSize/2, p.y - pSize/2, pSize, pSize);  //por amp
    }
  }
}


