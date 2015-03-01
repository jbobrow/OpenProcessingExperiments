
ArrayList spots = new ArrayList();

void setup() {
  size(640, 640);
  for (int i = 0; i < 60; i++) {
    spots.add(new Spot());
  }
}

void draw() {
  background(0);
  for (int i = 0; i < spots.size (); i++) {
    Spot s = (Spot) spots.get(i);
    s.draw();
    s.boundaries();
  }
}

class Spot {
  PVector loc;
  PVector vel;
  int s = (int)random(30, 70);
  float s2 = s-s/3;
  PGraphics pg = createGraphics(s*2, s*2);

  Spot() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-1, 1), random(-1, 1));
    vel.mult(4);

    pg.beginDraw();

    float r = random(0, 255);
    float g = random(0, 255);

    for (int i = 0; i <= 360; i+=10) {

      float angleX = sin(radians(i));
      float angleY = cos(radians(i));


      float angleX2 = sin(radians(i+10));
      float angleY2 = cos(radians(i+10));
      

      pg.noFill();
      pg.stroke(r, g, 255);
      pg.beginShape();
      pg.vertex(s+angleX*s, s+angleY*s);
      pg.vertex(s+angleX2*s2, s+angleY2*s2);
      pg.vertex(s+angleX2*s, s+angleY2*s);
      pg.endShape();

      pg.line(s+angleX*s, s+angleY*s, s+angleX2*s, s+angleY2*s);
      pg.line(s+angleX2*s2, s+angleY2*s2, s+angleX*s2, s+angleY*s2);
    }

    pg.noStroke();
    pg.fill(r, g, 255);
    pg.ellipse(s, s, s, s);

    pg.endDraw();
  }

  void draw() {
    loc.add(vel);
    float angle = sin(radians(frameCount*s/10)) * s/3;
    image(pg, loc.x-s/2-angle/2, loc.y-s/2-angle/2, s+angle, s+angle);
  }

  void boundaries() {
    if (loc.x < 0)      vel.x *= -1;
    if (loc.x > width)  vel.x *= -1;
    if (loc.y < 0)      vel.y *= -1;
    if (loc.y > height) vel.y *= -1;
  }
}



