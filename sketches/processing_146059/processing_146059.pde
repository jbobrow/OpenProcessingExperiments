
ArrayList<PVector> poop = new ArrayList();
void setup() {
  size(800, 400);
  for (int i=0;i<1000;i++) {
    PVector P = new PVector(random(2*width), random(2*height));
    poop.add(P);
  }
}

void draw() {
  background(0);
  noStroke();
  fill(-1);
  for (int i=0;i<poop.size();i++) {
    PVector P = poop.get(i);
    PVector M = new PVector(pmouseX-mouseX, pmouseY-mouseY);
    P.add(M);
    float d = dist(P.x, P.y, width/2, height/2);
    d = map(d, 0, width/2, 0, 3);
    ellipse(P.x, P.y, d, d);
  }
}

