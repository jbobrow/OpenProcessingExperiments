
float x1, y1, x2, y2;

void setup() {
  size(200, 200);
  smooth();
  x1 = width / 4.0;
  y1 = x1;
  x2 = width - x1;
  y2 = x2;
}

void draw() {
  background(0);
  x1 += random(-0.8, 0.8);
  y1 += random(-0.8, 0.8);
  noStroke();
  
  fill(random(255), 0, random(100));
  rect (x1, y1, 40+x1, 40+y1);
  fill(0, random(255), random(200));
  ellipse (x1 + 20, y1 + 50, 25+x1, 25+y1);
  fill(random(255));
  triangle (x1-20, y1-20, x1+10, y1+20, x1+40, y1-20);
}


