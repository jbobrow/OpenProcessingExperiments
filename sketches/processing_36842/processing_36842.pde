
//copyright Eric Mackie, Sept. 2011
void setup () {
  size(400, 400);
}

void draw () {
  background(0);
  float rx = map(mouseX, 0, width, width/2, random(0, width));
  float ry = map(mouseX, 0, width, height/2, random(0, height));
  float rd = map(mouseX, 0, width, 10, random(5, 80));
  float fr = map(mouseX, 0, width, 1, 60);
  float cfr = map(mouseX, 0, width, 255, random(256));
  float cfg = map(mouseX, 0, width, 255, random(256));
  float cfb = map(mouseX, 0, width, 255, random(256));
  float csr = map(mouseX, 0, width, 255, random(256));
  float csg = map(mouseX, 0, width, 255, random(256));
  float csb = map(mouseX, 0, width, 255, random(256));

  frameRate(fr);

  fill(cfr, cfg, cfb);
  stroke(csr, csg, csb);
  ellipse(rx, ry, rd, rd);
}

