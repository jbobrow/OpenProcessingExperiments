
void setup() {
  size(600, 600);
  background(5, 5, 5);
  smooth();

  stroke(2, 52, 19);
  strokeWeight(10);
  fill(2, 103, 36);
  smooth();
  ellipse(300, 300, 500, 500);

  fill(255, 11, 3);
  noStroke();

  curveTightness(-.1);
  float sides = 10;
  float angle = 360;
  float px = 0, py = 0;
  float cx = 0, cy = 0;
  float ang = 360/(sides+sides/8);
  float ang2 = ang/8;
  float rad1 = 270;
  float rad2 = rad1*2;
  int x = width/2;
  int y = height/2;

  beginShape();
  for (int i=0; i<sides; i++) {
    cx = x+cos(radians(angle))*rad2;
    cy = y+sin(radians(angle))*rad2;
    curveVertex(cx, cy);
    px = x+cos(radians(angle))*rad1;
    py = y+sin(radians(angle))*rad1;
    curveVertex(px, py);
    angle+=ang;
    px = x+cos(radians(angle))*rad1;
    py = y+sin(radians(angle))*rad1;
    curveVertex(px, py);
    cx = x+cos(radians(angle))*rad2;
    cy = y+sin(radians(angle))*rad2;
    curveVertex(cx, cy);
    px = x+cos(radians(angle))*rad1;
    py = y+sin(radians(angle))*rad1;
    vertex(px, py);
    angle+=ang2;
    px = x+cos(radians(angle))*rad1;
    py = y+sin(radians(angle))*rad1;
    vertex(px, py);
  }
  endShape(CLOSE);

  stroke(241, 250, 8);
  strokeWeight(1);

  //poly
  int counter = 0; 
  while (counter < 50) {
    fill(250, random(200), random(100));
    createPoly(round(6), 250-counter*6, width/2, height/2);
    counter = counter +1;
  }

  stroke(241, 250, 8);
  fill(255, 11, 3);
  smooth();

  ellipse(300, 300, 100, 100);

  //star 
  while (counter < 100) {
    noFill();
    createStar(round(10), 100-counter, 250-counter, width/2, height/2);
    counter = counter +1;
  }
}


