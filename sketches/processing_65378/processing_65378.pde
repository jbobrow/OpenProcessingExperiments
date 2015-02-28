
void setup() {
  size(800, 600);
  smooth();
  stroke(255,20);
  noFill();
  noLoop();
}

void keyPressed() { redraw(); }

void mousePressed() {
  if (mouseX < 100 && mouseY < 25) redraw();
}

void draw() {
  background(0);
  
  fill(0);
  rect(4, 0, 44, 19);
  fill(255);
  text("new one", 5, 16);

  PVector p1 = new PVector( random(width), random(height) );
  PVector p2 = new PVector( random(width), random(height) );
  PVector q1 = new PVector( random(width), random(height) );
  PVector q2 = new PVector( random(width), random(height) );

  int n = (int) (2 * dist(p1.x, p1.y, p2.x, p2.y) + 2 * dist(q1.x, q1.y, q2.x, q2.y));
  float marginx = random(40,80);
  float marginy = random(40,80);

  for (int i = 0; i < n; i++) {
    float t = (float) i / n;    
    PVector p = new PVector( lerp(p1.x, p2.x, t), lerp(p1.y, p2.y, t) );
    PVector q = new PVector( lerp(q1.x, q2.x, t), lerp(q1.y, q2.y, t) );
    p.x += marginx * noise(0.015 * i     );
    p.y += marginy * noise(0.012 * i +  5);
    q.x += marginx * noise(0.011 * i + 10);
    q.y += marginy * noise(0.013 * i + 15);  
    line(p.x, p.y, q.x, q.y);
  }
}

