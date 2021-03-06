
import geomerative.*;
RFont f;
RShape grp;
RPoint[] points;
Particle[] particles;
int thresh = -200;

void setup () {
  size(500, 500);
  smooth();
  noStroke();
  frameRate(55);

  RG.init(this);
  grp = RG.getText("Dust", "vigilanc.ttf", 120, CENTER);

  RG.setPolygonizer(RG.ADAPTATIVE);
  //grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(2);
  points = grp.getPoints();

  particles = new Particle[points.length];

  for (int i = 0; i < particles.length; i++) {
    float veX = random(2, 3);
    float veY = random(0, 3);
    particles[i] = new Particle(points[i].x, points[i].y, 4, veX, veY);
  }
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
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
    veX = vx + 1;
    veY = vy - 3;
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

  void velMove() {
    xpos += veX;
    ypos += veY;
  }

  void threshMove(int xt) {
    if (ypos<xt) {
      xpos += veX;
      ypos += veY;
    }
  }
}


