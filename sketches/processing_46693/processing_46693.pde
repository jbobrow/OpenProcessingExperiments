
import geomerative.*;
RFont f;
RShape grp;
RPoint[] points;
Particle[] particles;

void setup () {
  size(500, 500);
  smooth();
  noStroke();
  frameRate(55);
  //vex += random(1, 8);
  //vey += random(-5, -1);
  RG.init(this);
  grp = RG.getText("Dissonance", "vigilanc.ttf", 120, CENTER);

  RG.setPolygonizer(RG.ADAPTATIVE);
  //grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(2);
  points = grp.getPoints();

  particles = new Particle[points.length];

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(points[i].x, points[i].y, 4);
  }
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
  //move particles

  if (millis() % 6000 < 3000) {
    for (int i = 0; i < particles.length; i++) {
      particles [i].move();
    }
  }
  else {
    for (int i = 0; i < particles.length; i++) {
      particles [i].moveTo(points[i].x, points[i].y);
    }
  }

  //draw particles
  for (int i = 0; i < particles.length; i++) {
    particles [i].display();
  }
  popMatrix();
}

class Particle {
  float xpos;
  float ypos;
  float dia;
  //float vx;
  //float vy;

  Particle(float x, float y, float diameter) {
    xpos = x;
    ypos = y;
    dia = diameter;
    //vx = veX;
    //vy = veY;
  }

  void display() {
    ellipse(xpos, ypos, dia, dia);
  }

  void move() {
    xpos += random(-2, 2);
    ypos += random(-2, 2);
  }

  void moveTo(float x, float y) {
    xpos += (x-xpos)/16;
    ypos += (y-ypos)/16;
  }
}


