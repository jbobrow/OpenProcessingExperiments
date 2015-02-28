
PShape s;
PShape t;
PShape u;
PShape v;
PShape w;

void setup() {
  size(500, 500, P2D);
  smooth();

  s = createShape(); // make shape
  s.beginShape(); // start shape info
  s.fill(232, 105, 86); // shape colour
  s.noStroke(); // no line

    s.vertex(-100, 100);
  s.vertex(-200, 0);
  s.vertex(-100, 0);
  s.vertex(-100, -100);
  s.vertex(0, -200);
  s.vertex(0, -100);
  s.vertex(100, -100);
  s.vertex(200, 0);
  s.vertex(100, 0);
  s.vertex(100, 100);
  s.vertex(0, 200);
  s.vertex(0, 100);

  s.endShape(CLOSE);

  t = createShape(); // make shape
  t.beginShape(); // start shape info
  t.fill(198, 55, 33); // shape colour
  t.noStroke(); // no line

    t.vertex(0, 0);
  t.vertex(100, 0);
  t.vertex(100, 100);

  t.endShape(CLOSE);
  
  u = createShape(); // make shape
  u.beginShape(); // start shape info
  u.fill(198, 55, 33); // shape colour
  u.noStroke(); // no line

    u.vertex(0, 0);
  u.vertex(-100, 0);
  u.vertex(-100, -100);

  u.endShape(CLOSE);
  
  v = createShape(); // make shape
  v.beginShape(); // start shape info
  v.fill(198, 55, 33); // shape colour
  v.noStroke(); // no line

    v.vertex(0, 0);
  v.vertex(0, -100);
  v.vertex(100, -100);

  v.endShape(CLOSE);
  
  w = createShape(); // make shape
  w.beginShape(); // start shape info
  w.fill(198, 55, 33); // shape colour
  w.noStroke(); // no line

    w.vertex(0, 0);
  w.vertex(0, 100);
  w.vertex(-100, 100);

  w.endShape(CLOSE);
}

void draw() {
  background(52);

  translate(width/2, height/2);

  s.rotate(0.02);
  shape(s);
  t.rotate(0.02);
  shape(t);
  u.rotate(0.02);
  shape(u);
  v.rotate(0.02);
  shape(v);
  w.rotate(0.02);
  shape(w);
  
  
}



