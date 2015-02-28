
import processing.opengl.*;

import toxi.processing.*;

import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;

VerletPhysics physics;

int DIM=40;
int REST_LENGTH=10;
float STRENGTH = 0.02;

int normalLength;
boolean doUpdate=true;

ToxiclibsSupport gfx;
WETriangleMesh mesh;

void setup() {
  size(800,600,P3D);
  gfx=new ToxiclibsSupport(this);
  physics=new VerletPhysics();
  physics.addBehavior(new GravityBehavior(new Vec3D(0,0,0.1)));
  physics.setWorldBounds(new AABB(new Vec3D(0,0,0),500));
  for(int y=0,idx=0; y<DIM; y++) {
    for(int x=0; x<DIM; x++) {
      VerletParticle p=new VerletParticle(x*REST_LENGTH,y*REST_LENGTH,0);
      physics.addParticle(p);
      if (x>0) {
        VerletSpring s=new VerletSpring(p,physics.particles.get(idx-1),REST_LENGTH,STRENGTH);
        physics.addSpring(s);
      }
      if (y>0) {
        VerletSpring s=new VerletSpring(p,physics.particles.get(idx-DIM),REST_LENGTH,STRENGTH);
        physics.addSpring(s);
      }
      idx++;
    }
  }
  // pin corners in space
  physics.particles.get(0).lock();
  physics.particles.get(DIM-1).lock();
  physics.particles.get(DIM*DIM-1).lock();
  physics.particles.get(DIM*DIM-DIM).lock();
  physics.particles.get(DIM*DIM/2-DIM/2).lock();
}

void draw() {
  if (doUpdate) {
    physics.update();
  }
  background(255);
  noStroke();
  translate(width/2,height/2,0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  lights();
  fill(255,100,0);
  //for(VerletParticle p : physics.particles) {
  //gfx.box(new AABB(p,2));
  //}
  buildMesh();
  gfx.mesh(mesh,true,normalLength);
}

void buildMesh() {
  mesh=new WETriangleMesh();
  for(int y=0,idx=0; y<DIM; y++) {
    for(int x=0; x<DIM; x++) {
      if (x>0 && y>0) {
        VerletParticle a=physics.particles.get(idx-DIM-1);
        VerletParticle b=physics.particles.get(idx-1);
        VerletParticle c=physics.particles.get(idx);
        VerletParticle d=physics.particles.get(idx-DIM);
        mesh.addFace(a,b,c);
        mesh.addFace(a,c,d);
      }
      idx++;
    }
  }
  List<Face> faces=new ArrayList<Face>(mesh.getFaces());
  for(Face f : faces) {
    mesh.perforateFace(f,0.75);
  }
  mesh.center(new Vec3D(0,0,0));
  //new LaplacianSmooth().filter(mesh,2);
}

void keyPressed() {
  if (key==' ') {
    mesh.saveAsSTL(sketchPath("catanary.stl"));
  }
  if (key=='n') {
    if (normalLength==0) {
      normalLength=10;
    } else {
      normalLength=0;
    }
  }
  if (key=='u') {
    doUpdate=!doUpdate;
  }
}

