
//import processing.opengl.*;
import feuille.physics.*;

ParticleSystem ps;
ArrayList sp;
ArrayList at;
double deltaTime;
int pNr = 1;
int deep = 300;
int horizon = 0;
int vertical = 0;
double mass = 1.0e2;
double radius = 10.0;
double springLength = 0.0;
double springK = 5.0e3;
double springD = 1.0e2;
double attractF = -1.0e6;
boolean dv = false, da = false, df = false;
double margin = 20.0f;
PFont fontA;

void setup() {
  //size(500, 500, OPENGL);
  size(500, 500, P3D);
  ellipseMode(CENTER);
  frameRate(2000);
  background(255);
  sp = new ArrayList();
  at = new ArrayList();
  ps = new ParticleSystem(0, 500);
  ps.turnOnCollision();
  ps.turnOnReaction();
  
  first();

  render();

  fontA = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  textFont(fontA, 12);

}
void keyPressed() {
  if (key == '-') {
    int atNr = ps.attractionNr() - 1;
    for (int i = 0; i < ps.particleNr()-1; i++) {
      at.remove(atNr - i);
    }
    int spNr = ps.springNr() - 1;
    for (int i = 0; i < ps.particleNr()-1; i++) {
      sp.remove(spNr - i);
    }
    if (ps.particleNr() > 1) ps.removeParticle(ps.particleNr()-1);
  }
  if (key == 'c' || key == 'C') {
    ps.clear();
    sp.clear();
    at.clear();
    springK = 1.0e4;
    attractF = -1.0e6;
    pNr = 1;
    first();
  }
  if (key == ' ') {
    addParticle();
  }
  if (key == 'f' || key == 'F') {
    df = df ? false : true;
  }
  if (key == 'a' || key == 'A') {
    da = da ? false : true;
  }
  if (key == 'v' || key == 'V') {
    dv = dv ? false : true;
  }
  if (key == 'h' || key == 'H') {
    attractF /= 10;
    for (int i = 0; i < at.size(); i++) {
      Attraction a = (Attraction) at.get(i);
      a.setAttractionConstant(attractF);
    }
  }
  if (key == 'j' || key == 'J') {
    attractF *= 10;
    for (int i = 0; i < at.size(); i++) {
      Attraction a = (Attraction) at.get(i);
      a.setAttractionConstant(attractF);
    }
  }
  if (key == 'y' || key == 'Y') {
    springK /= 10;
    for (int i = 0; i < sp.size(); i++) {
      Spring s = (Spring) sp.get(i);
      s.setSpringConstant(springK);
    }
  }
  if (key == 'u' || key == 'U') {
    springK *= 10;
    for (int i = 0; i < sp.size(); i++) {
      Spring s = (Spring) sp.get(i);
      s.setSpringConstant(springK);
    }
  }
  if (key == 't' || key == 'T') {
    attractF *= -1.0;
    for (int i = 0; i < at.size(); i++) {
      Attraction a = (Attraction) at.get(i);
      a.setAttractionConstant(attractF);
    }
  }
  if (key == 'o' || key == 'O') {
    ps.turnOnCollision();
  }
  if (key == 'n' || key == 'N') {
    ps.turnOffCollision();
  }
}

void draw() {
  camera(horizon, vertical, deep, horizon, vertical, 0, 0, 1,0);
  deltaTime = (double) 1.0f/frameRate;
  background(0);
  ps.run(deltaTime);
  render();
  fill(255);
  text(ps.particleNr(), (float)ps.getParticle(0).position().x(), (float)ps.getParticle(0).position().y()+3, (float)ps.getParticle(0).position().z());
}

void first() {
  for (int i = 0; i < pNr; i++) {
    Particle p = ps.addParticle(
          mass,
          radius,
          new DVector((double)random(-width, width), (double)random(-height, height), 0.0),
          new DVector());
    p.setElasticity(0.5);
  }
  ps.getParticle(0).setPosition(0,0,0);
}

void addParticle() {
  DVector v = new DVector((double)random(-10, 10), (double)random(-10,10),0);
  pNr = ps.particleNr();
  Particle p = ps.addParticle(mass, radius, v, new DVector());
  p.setElasticity(0.5);
  for (int i = 0; i < ps.particleNr()-1; i++) {
    Spring s = ps.addSpring(ps.getParticle(i), p, springLength, springK, springD);
    Attraction a = ps.addAttraction(ps.getParticle(i), p, attractF, 2.0*radius);
    sp.add(s);
    at.add(a);
  }
}

void render() {
  double maxX, maxY, minX, minY;
  for (int i = 0; i < sp.size(); i++) {
    Spring s = (Spring) sp.get(i);
    stroke(color(255, 255, 255, 31));
    strokeWeight(1);
    line((float)s.p1().position().x(), (float)s.p1().position().y(), (float)s.p2().position().x(), (float)s.p2().position().y());
  }

  maxX = ps.getParticle(0).position().x();
  minX = ps.getParticle(0).position().x();
  maxY = ps.getParticle(0).position().y();
  minY = ps.getParticle(0).position().y();
  for (int i = 0; i < ps.particleNr(); i++) {
    maxX = maxX < ps.getParticle(i).position().x() ? ps.getParticle(i).position().x() : maxX;
    minX = minX > ps.getParticle(i).position().x() ? ps.getParticle(i).position().x() : minX;
    maxY = maxY < ps.getParticle(i).position().y() ? ps.getParticle(i).position().y() : maxY;
    minY = minY > ps.getParticle(i).position().y() ? ps.getParticle(i).position().y() : minY;

    strokeWeight(1);
    if (dv) drawVector(ps.getParticle(i).position(), ps.getParticle(i).velocity(), color(255, 255, 0, 255));
    if (da) drawVector(ps.getParticle(i).position(), ps.getParticle(i).currentAcceleration(), color(255, 0, 255, 255));
    if (df) drawVector(ps.getParticle(i).position(), DVector.div(ps.getParticle(i).dynamicForce(), ps.getParticle(i).mass()), color(255, 0, 0, 255));
    if (df) drawVector(ps.getParticle(i).position(), DVector.div(ps.getParticle(i).reactionForce(), ps.getParticle(i).mass()), color(255, 0, 255, 255));

    stroke(0xFF000000);
    strokeWeight(2);
    if (i == 0) {
      fill(color(255, 0, 0, 127));
    } else {
      fill(color(255, 255, 255, 168));
    }
    ellipse((float) ps.getParticle(i).position().x(), (float) ps.getParticle(i).position().y(), 2.0f*(float)ps.getParticle(i).radius(), 2.0f*(float)ps.getParticle(i).radius());
  }

  double w = maxX - minX + 2.0*radius + 2.0*margin;
  double h = maxY - minY + 2.0*radius + 2.0*margin;
  horizon = (int)(0.5*(maxX + minX));
  vertical = (int)(0.5*(maxY + minY));
  deep = (int)( (w > h ? w : h) * 0.5 / tan(PI/6));
  deep = deep < 300 ? 300 : deep;
  deep = deep > 4000 ? 4000 : deep;
}

