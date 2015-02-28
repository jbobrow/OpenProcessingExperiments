
//import processing.opengl.*;
import feuille.physics.*;

ParticleSystem ps;
ArrayList sp;
ArrayList at;
double mass = 1.0e1;
double radius = 20.0;
int deep = 300;
int horizon = 0;
int vertical = 0;
int pNr = 1;
double springLength = 0.0;
double springK = 4.0e4;
double attractF = -4.0e7;
boolean dv = false, da = false, df = false;
double margin = 20.0f;
int drawNr;

void setup() {
  size(500, 500, P3D);
  smooth();
  background (0);
  ps = new ParticleSystem(0, 50);
  ps.turnOnCollision();
  ps.turnOnReaction();
  sp = new ArrayList();
  at = new ArrayList();
  Particle p = ps.addParticle(mass, radius, new DVector(), new DVector());
  p.setElasticity(0.5);
  int c = 0x00FFFFFF;
  p.setColor(c);
}

void draw() {
  background(0);
  double dt = (double)(1.0/frameRate);
  camera(horizon, vertical, deep, horizon, vertical, 0, 0, 1,0);
  ps.run(dt);
  render();
}

void keyPressed() {
  if (key == '-') {
    if (ps.particleNr() > 1) ps.removeParticle(ps.particleNr()-1);
    if (sp.size() > 1) sp.remove(sp.size()-1);
  }
  if (key == 'c' || key == 'C') {
    ps.clear();
    sp.clear();
    at.clear();
    springK = 4.0e4;
    attractF = -4.0e7;
    setup();
  }
  if (key == ' ') {
    addParticle();
  }
  if (key == 'h' || key == 'H') {
    attractF /= 2;
    for (int i = 0; i < at.size(); i++) {
      Attraction a = (Attraction) at.get(i);
      a.setAttractionConstant(attractF);
    }
  }
  if (key == 'j' || key == 'J') {
    attractF *= 2;
    for (int i = 0; i < at.size(); i++) {
      Attraction a = (Attraction) at.get(i);
      a.setAttractionConstant(attractF);
    }
  }
  if (key == 'y' || key == 'Y') {
    springK /= 2;
    for (int i = 0; i < sp.size(); i++) {
      Spring s = (Spring) sp.get(i);
      s.setSpringConstant(springK);
    }
  }
  if (key == 'u' || key == 'U') {
    springK *= 2;
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
  if (key == 'r' || key == 'r') {
    ps.turnOnReaction();
  }
  if (key == 'e' || key == 'E') {
    ps.turnOffReaction();
  }
}


void addParticle() {
  DVector v = new DVector(random(0,1),random(0,1),0);
  v.normalize();
  pNr = ps.particleNr();
  int pn = (int)random(0, pNr);
  Particle p = ps.addParticle(mass, radius, DVector.add(ps.getParticle(pn).position(),v), new DVector());
  p.setElasticity(0.5);
  Spring s = ps.addSpring(ps.getParticle(pn), p, springLength, springK, springK/100.0f);
  for (int i = 0; i < ps.particleNr()-1; i++) {
    Attraction a = ps.addAttraction(ps.getParticle(i), p, attractF, 2.0*radius);
    at.add(a);
  }
  sp.add(s);
  int c = 0x00FFFFFF;
  p.setColor(c);
}

void render() {
  double maxX, maxY, minX, minY;
  for (int i = 0; i < sp.size(); i++) {
    Spring s = (Spring) sp.get(i);
    stroke(color(255, 0, 0, 63));
    strokeWeight(10);
    line((float)s.p1().position().x(), (float)s.p1().position().y(), (float)s.p2().position().x(), (float)s.p2().position().y());
  }
  maxX = ps.getParticle(0).position().x();
  minX = ps.getParticle(0).position().x();
  maxY = ps.getParticle(0).position().y();
  minY = ps.getParticle(0).position().y();

  for (int i = 0; i < ps.particleNr(); i++) {
    stroke(color(255, 0, 0, 127));
    strokeWeight(2);
    fill(ps.getParticle(i).myColor());
    ellipse((float)ps.getParticle(i).position().x(), (float)ps.getParticle(i).position().y(), (float)(2.0*radius), (float)(2.0*radius));
    
    maxX = maxX < ps.getParticle(i).position().x() ? ps.getParticle(i).position().x() : maxX;
    minX = minX > ps.getParticle(i).position().x() ? ps.getParticle(i).position().x() : minX;
    maxY = maxY < ps.getParticle(i).position().y() ? ps.getParticle(i).position().y() : maxY;
    minY = minY > ps.getParticle(i).position().y() ? ps.getParticle(i).position().y() : minY;
    
  }

  double w = maxX - minX + 2.0*radius + 2.0*margin;
  double h = maxY - minY + 2.0*radius + 2.0*margin;
  horizon = (int)(0.5*(maxX + minX));
  vertical = (int)(0.5*(maxY + minY));
  deep = (int)( (w > h ? w : h) * 0.5 / tan(PI/6));
  deep = deep < 300 ? 300 : deep;
  deep = deep > 4000 ? 4000 : deep;
}

