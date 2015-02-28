
//Yuriy Flyud. Feb.19.2011. Explosion Applet

import saito.objloader.*;
import toxi.color.*;
import toxi.*;
import toxi.geom.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.noise.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
WETriangleMesh[] meshes;
WETriangleMesh expMesh;
VerletPhysics physics;
AABB houseBounds;
Smoke sm;

int[] meshColors;
ToneMap toneMap;
PFont font;

boolean isCol = false;
boolean isExplosive = true;
boolean exploded = false;
float rot = PI / 3;
float jumpcam = 0;

float NS = 0.5f;
float AMP = 0.3f;

public void setup() {
  size(450, 300, P3D);
  gfx = new ToxiclibsSupport(this);
  initMeshes();
  initPhysics();
  frameRate(21);

  ColorGradient gradient = new ColorGradient();
  gradient.addColorAt(0, NamedColor.RED);
  gradient.addColorAt(100, NamedColor.YELLOW);
  gradient.addColorAt(192, NamedColor.GREEN);
  gradient.addColorAt(255, NamedColor.BLUE);
  toneMap = new ToneMap(0, 2 * AMP, gradient);

  font = loadFont("ArialMT-30.vlw");
  textFont(font, 13);
}
public void draw() {
  physics.update();
  rot += PI / 360;

  int curMeshStartId = 0;
  for (int i = 0; i < meshes.length; i++) {
    for (Vertex v : meshes[i].vertices.values()) {
      v.set(physics.particles.get(v.id + curMeshStartId));
    }
    curMeshStartId += meshes[i].getNumVertices();
  }

  background(50);
  info();

  lights();
  pointLight(51, 102, 126, 35, 40, -170);

  camera(170 * sin(rot), -30, 190 * cos(rot), 0,
  +random(jumpcam), 0, 0, 0.5f, 0);

  if (jumpcam <= 0)
    jumpcam = 0;
  else
    jumpcam -= 0.5f;

  //draw bounding box
  noFill();
  stroke(150, 150);
  smooth();
  gfx.box(houseBounds);
  noSmooth();

  //draw ground
  drawGround();

  //draw house
  for (int i = 0; i < meshes.length; i++) {
    noStroke();

    if (isCol) {
      beginShape(TRIANGLES);
      drawColouredMeshes(meshes[i]);
      endShape();
    } 
    else {
      fill(meshColors[i]);
      gfx.mesh(meshes[i]);
    }
  }

  //draw Smoke
  if (exploded) {
    updateSmoke();
    fill(10, 80);
    gfx.mesh(expMesh);
    sm.run(this);
  }
}

void info() {
  camera();
  fill(200, 150);
  noStroke();

  text("(m)Ruination mode:" + (isExplosive ? "Explode" : "Collapse"), 5,
  15);
  text("(c)Color mode:" + (isCol ? "Noise color" : "True color"), 5, 30);
  text("(mouseClick)Ruin", 5, 45);
  text("(r)restart", 5, 60);
}

void initMeshes() {
  //Load .obj model
  OBJModel house = new OBJModel(this, "house2.obj", "absolute", TRIANGLES);
  house.translateToCenter();
  house.scale(1.5f);
  BoundingBox bounds = new BoundingBox(this, house);
  PVector center = bounds.getCenter();
  PVector whd = bounds.getWHD();

  houseBounds = new AABB(new Vec3D(center.x, center.y, center.z),
  new Vec3D(whd.x, whd.y, whd.z));

  // Place the house on the ground
  house.translate(new PVector(0, -whd.y
    + abs(bounds.getMin().y - bounds.getCenter().y), 0));

  meshes = new WETriangleMesh[house.getSegmentCount()];
  meshColors = new int[meshes.length];
  expMesh = new WETriangleMesh();

  for (int curSegNum = 0; curSegNum < house.getSegmentCount(); curSegNum++) {

    // If only OBJModel had public method getMaterials()...I would do
    // like this.
    // How should I get the color of each segment in the other way?
    /*
			 * Material mat = house.getMaterials().get(
     			 * house.getSegment(curSegNum).materialName); meshColors[curSegNum]
     			 * = color(255.0f * mat.Kd[0], 255.0f * mat.Kd[1], 255.0f *
     			 * mat.Kd[2], 255.0f * mat.d);\
     			 */
    meshes[curSegNum] = getBrokenMesh(house.getSegment(curSegNum));
    expMesh.addMesh(meshes[curSegNum]);
  }
  expMesh.subdivide(new MidpointDisplacementSubdivision(expMesh
    .computeCentroid(), -0.2f), 10);
  expMesh.scale(0.5f);
  expMesh.translate(new Vec3D(0, houseBounds.getExtent().y
    - expMesh.computeCentroid().y, 0));
    
  initColors();
}

void initPhysics() {
  physics = new VerletPhysics();

  physics.setWorldBounds(houseBounds);

  int curMeshStartId = 0;
  for (int i = 0; i < meshes.length; i++) {
    // turn mesh vertices into physics particles
    for (Vertex v : meshes[i].vertices.values()) {
      physics.addParticle(new VerletParticle(v, random(0, 1)));
    }
    // turn mesh edges into springs
    for (WingedEdge e : meshes[i].edges.values()) {
      VerletParticle a = physics.particles.get(((Vertex) e.a).id
        + curMeshStartId);
      VerletParticle b = physics.particles.get(((Vertex) e.b).id
        + curMeshStartId);
      physics.addSpring(new VerletSpring(a, b, a.distanceTo(b), 1f));
    }
    curMeshStartId += meshes[i].getNumVertices();
  }
}

void explode(WETriangleMesh mesh, Vec3D center, float strength,
int curMeshStartId) {
  for (toxi.geom.mesh.Face f : mesh.getFaces()) {
    Vec3D fc = f.getCentroid();
    Vec3D dir = fc.sub(center).normalize();
  
    physics.particles.get(((Vertex) f.a).id + curMeshStartId).addSelf(
    dir.scale(strength));
    physics.particles.get(((Vertex) f.b).id + curMeshStartId).addSelf(
    dir.scale(strength));
    physics.particles.get(((Vertex) f.c).id + curMeshStartId).addSelf(
    dir.scale(strength));
  }
}

WETriangleMesh getBrokenMesh(Segment seg) {
  WETriangleMesh mesh = new WETriangleMesh();
  for (int f = 0; f < seg.getFaceCount(); f++) {
    saito.objloader.Face face = seg.getFace(f);
    Vec3D a = new Vec3D(face.vertices.get(0).x, face.vertices.get(0).y,
    face.vertices.get(0).z);
    Vec3D b = new Vec3D(face.vertices.get(1).x, face.vertices.get(1).y,
    face.vertices.get(1).z);
    Vec3D c = new Vec3D(face.vertices.get(2).x, face.vertices.get(2).y,
    face.vertices.get(2).z);
    mesh.addFace(a, b, c);
  }
  return mesh;
}

public void updateSmoke() {
  PVector wind = new PVector(random(-0.1f, 0.1f), random(-0.1f, 0.1f),
  random(-0.1f, 0.1f));

  int density = 3;
  sm.add_force(wind);
  for (int i = 0; i < density; i++)
    sm.addParticle();
}

public void drawGround() {
  Vec3D p = houseBounds.add(-houseBounds.getExtent().x, houseBounds
    .getExtent().y, houseBounds.getExtent().z);
  fill(0, 255, 0, 30);
  stroke(150, 150);
  beginShape(QUAD);
  vertex(p.x, p.y + 1, p.z);
  vertex(p.x + houseBounds.getExtent().x * 2, p.y + 1, p.z);
  vertex(p.x + houseBounds.getExtent().x * 2, p.y + 1, p.z
    - houseBounds.getExtent().z * 2);
  vertex(p.x, p.y + 1, p.z - houseBounds.getExtent().z * 2);
  endShape();
}



public void drawColouredMeshes(WETriangleMesh m) {
  float phase = frameCount * NS / 8;
  for (toxi.geom.mesh.Face f : m.faces) {
    fill(toneMap.getARGBToneFor((float) (SimplexNoise.noise(f.a.x * NS,
    f.a.y * NS, phase)
      * AMP + AMP)));
    vertex(f.a.x, f.a.y, f.a.z);
    fill(toneMap.getARGBToneFor((float) (SimplexNoise.noise(f.b.x * NS,
    f.b.y * NS, phase)
      * AMP + AMP)));
    vertex(f.b.x, f.b.y, f.b.z);
    fill(toneMap.getARGBToneFor((float) (SimplexNoise.noise(f.c.x * NS,
    f.c.y * NS, phase)
      * AMP + AMP)));
    vertex(f.c.x, f.c.y, f.c.z);
  }
}

public void initColors() {
  meshColors[0] = color(220, 255, 190);// front upper wall( Should be merged with wall)
  meshColors[1] = color(100);// Windows
  meshColors[2] = color(220, 255, 190);// deprecated. Should be deleted in
  // future(doors)

  // All Of next 4 Colors should be Merged
  meshColors[3] = color(220, 255, 190);// Front Wall
  meshColors[4] = color(220, 255, 190);// Left Wall
  meshColors[5] = color(220, 255, 190);// Back Wall
  meshColors[6] = color(220, 255, 190);// Right Wall

  meshColors[7] = color(220, 255, 150);// Deprecated. Should be deleted. Interior wall
  meshColors[8] = color(45, 40, 40);// Roof
}

public void drawInfo() {
  fill(255);
  stroke(255);
  text("(m)ruination mode: " + (isExplosive ? "Explode" : "Collapse"), 0,
  0);
}

public void mousePressed() {
  if (exploded)
    return;
  physics.addBehavior(new GravityBehavior(new Vec3D(0, 0.1f, 0)));
  if (isExplosive) {
    jumpcam = 4;
    int curMeshStartId = 0;
    for (int i = 0; i < meshes.length; i++) {
      explode(meshes[i], new Vec3D(0, houseBounds.getExtent().y, 0),
      1.5f, curMeshStartId);
      curMeshStartId += meshes[i].getNumVertices();
    }
  }
  sm = new Smoke(0, new PVector(0, houseBounds.getExtent().y, 0), 10, 10);
  float er = 30 * (isExplosive ? 2 : 1);
  for (float i = 0; i < TWO_PI; i += PI / er)
    sm.addParticle(new Particle(
    new PVector(random(er) * sin(i), random(houseBounds
      .getExtent().y
      - er / (isExplosive ? 2 : 4), houseBounds
      .getExtent().y), random(er) * cos(i))));
  exploded = true;
}

public void keyPressed() {

  switch (key) {
  case 'c':
    isCol = !isCol;
    break;
  case 'm':
    if (!exploded)
      isExplosive = !isExplosive;
    break;
  case 'r':// restart
    initMeshes();
    initPhysics();
    exploded = false;
    break;
  }
}


