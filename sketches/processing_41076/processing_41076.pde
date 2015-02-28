
void setup() {
  size(400, 400, P3D);
  smooth();
}

void draw() {
  background(255);
  
  strokeWeight(1);
  stroke(0, 100);
  rotateX(PI/4);
  ellipse(mouseX, mouseY, 90, 120);
  noStroke();
  fill(0);
  ellipse(mouseY, mouseX, 90, 120);

  if (mousePressed && (mouseButton == LEFT)) {
    for (int i=0; i<10; i++) {
      float n = random(-700, 1700);
      float o = random(-700, 1700);
      float p = random(-700, 1700);
      float q = random(-700, 1700);
      float r = random(256);
      float r1 = random(256);
      float r2 = random(256);
      float s = random(-700, 1700);
      float t = random(10);
      float u = random(-20, 20);
      float v = random(-700, 1700);
      noFill();
      stroke(int(r), int(r1), int(r2));
      strokeWeight(int(t));
      translate(s, v, u);
      ellipse(s, v, s, s);
      sphere(t);
      line(s, v, v, s);
      triangle(p, q, q, p, n, o);
    }
  }
}


