
import java.util.Iterator;
ArrayList <Particle> particleArray;
int total;
color c1;
color c2;
int b;
int bX;
color cl1 = #00ff66;
color cr1 = #000000;
color cl2 = #8C8B89;
color cr2 = #ff69b4;
color cl3 = #0067AC;
color cr3 = #FFF4A0;
void setup() {
  size(800, 400);
  total = 100;
  frameRate(30);
  particleArray = new ArrayList<Particle>();
  c1 = cl1;
  c2 = cr1;
  b = 10;
}
void draw() {
  background(#ffffff);
  rect(0, 0, width, height);
  fill(cl1);
  rect(20, 20, b, b);
  fill(cr1);
  rect(30, 20, b, b);
  fill(cl2);
  rect(20, 40, b, b);
  fill(cr2);
  rect(30, 40, b, b);
  fill(cl3);
  rect(20, 60, b, b);
  fill(cr3);
  rect(30, 60, b, b);
  noStroke();
  Iterator<Particle> it = particleArray.iterator();
  while (it.hasNext ()) {
    Particle p = it.next();
    if (p.pSize < 1.01) {
      it.remove();
    }
    p.run(c1, c2);
  }
  drawCursor();
}
void mousePressed() {
  float mX = mouseX;
  float mY = mouseY;
  if (mX > 20 && mX < 40 && (mY>20)&& (mY<30)) {
    c1 = cl1;
    c2 = cr1;
  }
  if (mX > 20 && mX < 40 && (mY>40)&& (mY<50)) {
    c1 = cl2;
    c2 = cr2;
  }
  if (mX > 20 && mX < 40 && (mY>60)&& (mY<70)) {
    c1 = cl3;
    c2 = cr3;
  }
}
void drawCursor() {
  fill(255);
  noStroke();
  if (mousePressed) {
    for (int i = 0; i < total; i++) {
      particleArray.add(new Particle());
    }
  }
}
class Particle {
  PVector l;
  PVector v;
  PVector a;
  float tS;
  float lSpan;
  float pSize;
  color rColor;
  Particle() {
    l = new PVector(mouseX, mouseY);
    v = new PVector(random(-2, 2), random(-2, 2));
    a = new PVector(random(1), random(-1, 1));
    lSpan = 255;
    tS = 5;
    pSize = random(20);
  }
  void updateParticle() {
    v.add(a);
    v.limit(tS);
    l.add(v);
    pSize -=1;
  }
  void displayParticle(color c1, color c2) {
    if (l.x > width/2) {
      fill(c2, lSpan);
      ellipse(l.x, l.y, pSize, pSize);
    }
    else {
      fill(c1, lSpan);
      ellipse(l.x, l.y, pSize, pSize);
    }
  } 
  void run(color c1, color c2) {
    updateParticle();
    displayParticle(c1, c2);
  }
}
