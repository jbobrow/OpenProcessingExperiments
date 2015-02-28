
void setup() {
  size(400, 400);
  background(850);
  fill(350, 250, 0);
  smooth();
  ellipse(width/2, height/2, 350, 350);



  polygon((width/2), (height/2), int(9), (PI/2), (150));
}

void  polygon(float originX, float originY, int sides, float theta, float radius) {
  float x = 0;
  float y = 0;
  beginShape();
  fill(0, 0, 100);
  for (int i=0; i<sides; i++) {
    x = originX + cos(theta)*radius;
    y = originY + sin(theta)*radius;
    vertex(x, y);
    theta += TWO_PI/sides;
  }
  endShape(CLOSE);

  {
    fill(0, 200, 0);
    smooth();
    ellipse(width/2, height/2, 100, 100);
  }

  fill(250, 0, 0);
  myPoly(width/2, height/2, 6, 109);
}

void myPoly(int x, int y, int points, float radius) {
  float px=0, py=0;
  float angle = 6.5*PI;
  beginShape();

  for (int i=0; i<points; i++) {
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(px, py);
    angle+=360/points;
  }
  endShape(CLOSE);

  {
    fill(100);
    smooth();
    ellipse(width/2, height/2, 110, 110);
  }

  fill(565, 0, 275);
  makePoly2(width/2, height/2, 6, 55);
}

void makePoly2(int x, int y, int points, float radius) {
  float px=0, py=0;
  float angle = 9.5*PI;
  beginShape();

  for (int i=0; i<points; i++) {
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(px, py);
    angle+=360/points;
  }
  endShape(CLOSE);

  strokeWeight(0);
  line(width/2, 27, width/2, 80);

  strokeWeight(0);
  line(290, 150, 300, 100);

  strokeWeight(0);
  line(290, 150, 300, 100);

  strokeWeight(0);
  line(width/2, 311, width/2, 373);

  strokeWeight(0);
  line(105, 255, 50, 286);

  strokeWeight(0);
  line(105, 145, 50, 112);

  fill(100, 750, 8);
  stroke(241, 250, 8);
  ellipse(width/2, height/2, 60, 60);

  fill(0, 190, 0);
  stroke(241, 250, 8);
  ellipse(width/2, height/2, 30, 30);



  fill(0);
  ellipse(0, 0, 10, 10);
}


