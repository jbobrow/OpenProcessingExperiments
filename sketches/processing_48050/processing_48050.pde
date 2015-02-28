
import geomerative.*;
import processing.video.*;

PImage img;
RFont f;
RShape grp;
RPoint[] points;
Particle[] particles;
MovieMaker mm;
int thresh = -200;

void setup () {
  size(320, 240);
  img = loadImage("particle_texture.gif");

  smooth();
  noStroke();
  frameRate(55);
  mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.ANIMATION, MovieMaker.HIGH);
  RG.init(this);
  grp = RG.getText("Explosion", "vigilanc.ttf", 70, CENTER);

  RG.setPolygonizer(RG.ADAPTATIVE);
  //grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(5);
  points = grp.getPoints();

  particles = new Particle[points.length];

  for (int i = 0; i < particles.length; i++) {
    float veX = random(-3, 3);
    float veY = random(-3, 3);
    particles[i] = new Particle(points[i].x, points[i].y, 8, veX, veY);
  }
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
  mm.addFrame();
  //move particles

  if (millis() % 12000 < 8000) {
    thresh++;
    for (int i = 0; i < particles.length; i++) {
      particles [i].threshMove(thresh);
    }
  }
  else {
    thresh=-200;
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
  float veX;
  float veY;

  Particle(float x, float y, float diameter, float vx, float vy) {
    xpos = x;
    ypos = y;
    dia = diameter;
    veX = vx;
    veY = vy;
  }

  void display() {
    image(img, xpos, ypos, dia, dia);
  }

  void move() {
    xpos += random(-2, 2);
    ypos += random(-2, 2);
  }

  void moveTo(float x, float y) {
    xpos += (x-xpos)/16;
    ypos += (y-ypos)/16;
  }

  void velMove() {
    xpos += veX;
    ypos += veY;
  }

  void threshMove(int xt) {
    if (8<xt) {
      xpos += veX;
      ypos += veY;
    }
  }
  void keyPressed() {
    if (key == ' ') {
      mm.finish();
    }
  }
}


