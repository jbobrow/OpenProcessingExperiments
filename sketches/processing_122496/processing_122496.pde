
ArrayList<Circles> poop = new ArrayList();
;
void setup() {
  size(400, 400, P3D);
  for (int i =0 ;i <50; i++) {
    Circles C = new Circles();
    poop.add(C);
  }
}

void draw() {
 // background(-1);
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
  translate(width/2, height/2);
  for (int i=0;i<poop.size(); i++) {
    Circles C = (Circles) poop.get(i);
    C.display();
    C.update();
  }
}


class Circles {
  float r;
  int i=0;
  float c1, c2, c3;
  color c;
  Circles() {
    r = random(10, 200);
    c1 = radians(random(0, 360));
    c2 = radians(random(0, 360));
    c3 = radians(random(0, 360));
    c = (color) random(#000000);
  }

  void display() {
    pushMatrix();
    rotateZ(c1);
    rotateX(c2);
    rotateY(c3);
    noFill();
    stroke(c);
    strokeWeight(r);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  void update() {
    c1 = radians(random(i++));
    c2 = radians(random(i++));
    c3 = radians(random(i++));
  }
}

