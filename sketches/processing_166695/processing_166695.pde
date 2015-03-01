
float scl = 1.0;
color a = color(255,255, 0);
color b = color(0, 0, 255);
color t = color(0, 0, 0);

void setup () {
  size(640,480);
  background(64);
  smooth();
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  pushMatrix();
  scale(scl);
  fill(a);
  beginShape();
    vertex(0,126);
    vertex(44,126);
    vertex(44,-24);
    vertex(104,-24);
    vertex(104,-100);
    vertex(0,-100);
  endShape(CLOSE);
 
  fill(b);
  beginShape();
    vertex(0,126);
    vertex(-44,126);
    vertex(-44,-24);
    vertex(-104,-24);
    vertex(-104,-100);
    vertex(0,-100);
  endShape(CLOSE);
  popMatrix();
  if (scl < 6.0) {
    scl += 0.1;
  } else {
    scl = 1.0;
    t = a;
    a = b;
    b = t;
  }
}
