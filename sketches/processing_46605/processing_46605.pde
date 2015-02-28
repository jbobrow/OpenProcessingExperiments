
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;

int N = 50;
float ang = 0;

VerletPhysics physics;
AttractionBehavior attractor;

void setup() {
  colorMode(HSB);
  size(600, 600, P3D);
  background(0);
  physics = new VerletPhysics();
  physics.setDrag( 0.1f);
}


void addParticle() {
  VerletParticle p = new VerletParticle(Vec3D.randomVector());
  physics.addParticle(p);
}


void draw() {

  camera( 50*cos(radians(ang)), 10*sin(radians(ang)), height/2+50*sin(radians(ang*2)), 
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0);

  background(0);
  noFill();

    Vec3D vec = new Vec3D(0, 0, 0);

    if (physics.particles.size() < N) {
      addParticle(  );
    }

    attractor = new AttractionBehavior(vec, 50, 10f);
    physics.addBehavior(attractor);
    physics.update();
    for (VerletParticle p : physics.particles) {

      pushMatrix();
      stroke(100+45*sin(radians(ang)), 200, 200, 100*sin(radians(ang*3)));
      translate(p.x, p.y, p.z);
      rotateX(radians(ang*4));
      sphere(20);
      popMatrix();

      pushMatrix();
      stroke(200+45*sin(radians(ang)), 200, 200, 100*cos(radians(ang*6)));
      translate(-p.x, -p.y, -p.z);
      sphere(5);
      rotateZ(radians(ang*6));
      rotateY(radians(ang*4));
      line(p.x, p.y, p.z, vec.x, vec.y, vec.z);
      popMatrix();
    }
    physics.removeBehavior(attractor);


  ang += 1;
}


