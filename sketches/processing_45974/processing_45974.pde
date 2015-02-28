
import geomerative.*;
RFont f;
RShape grp;
RPoint[] points;
Particle[] particles;
 
void setup () {
  size(500, 500);
  smooth();
  noStroke();
  frameRate(15);
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
  fill(0,12);
  rect(0, 0, width, height);
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
  float m = map(minute(), 0, 3, 0, 100);
  //move particles
 
  if ((1.2*m) > m) {
    for (int i = 0; i < particles.length; i++) {
      particles [i].move();
    }
  }
  else {
    for (int i = 0; i > m; i++) {
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
 
  Particle(float x, float y, float diameter) {
    xpos = x;
    ypos = y;
    dia = diameter;
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


