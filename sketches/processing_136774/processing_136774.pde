
ArrayList<Points> poop = new ArrayList();
void setup() {
  size(500, 200);
}

void draw() {
  background(-1);
  noFill();
  stroke(0);
  beginShape();
  for (int i=0;i<poop.size();i++) {
    Points P = (Points)poop.get(i);
    vertex(P.x, P.y);
    if (P.x<0)poop.remove(i);
    P.x--;
  }
  endShape();
}

void keyPressed() {
  float t = random(0, height-20);
  Points P = new Points(width, t );
  poop.add(P);
}

class Points {
  float x, y;
  Points(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

