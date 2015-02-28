
Arcs a;

int num = 150;
int rotmax = 90;

void setup() {
  size(600, 600, P3D);

  a = new Arcs(num);
}

void draw() {

  background(255);
  lights();

  translate(width / 2, height / 2);

  float rot = radians(frameCount * 0.5f);
  rotateY(rot);

  a.run();
}

class Arc {

  PVector[] rot;
  float[] r;
  float[] siz;
  float dir, dirD;
  float sw;
  float sm;
  float eas;
  int col;
  int num=4;

  Arc() {

    rot = new PVector[num-2];
    siz = new float[num-2];
    r = new float[num];

    for (int i = 0; i<num; i++){
      if(i<2) {
        rot[i] = new PVector(random(width), random(height), random(width));
        siz[i] = random(50, 500);
        r[i] = random(rotmax);
      } else {
        r[i] = random(rotmax);
      }
    }
    dir = random(rotmax);
    dirD = random(-1, 1);
    sw = random(1, 4);
    sm = 0.0f;
    eas = 0.05f;

    float prob = random(100);
    if (prob < 50)
    // col = random(0,128);
    col = color(0, random(255), 255);
    // col = color(0, random(255));
    if (prob > 50)
    // col = random(128,255);
    col = color(255, random(255), 0);
    // col = color(random(128, 255), 0, 0);
  }

  void render() {
    update();
    lines();
    plane();
  }

  void update() {
    dir += dirD;
  }

  void lines() {
    pushMatrix();

    rotateX(rot[0].x);
    rotateY(rot[0].y);
    rotateZ(rot[0].z);

    noFill();
    strokeWeight(sw);
    stroke(col);

    arc(0, 0, siz[0], siz[0], radians(r[0] + dir), radians(r[1] + dir));

    popMatrix();
  }

  void plane() {
    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    noStroke();
    fill(col);

    arc(0, 0, siz[1], siz[1], radians(r[2] + dir), radians(r[3] + dir));

    popMatrix();
  }
}

class Arcs {

  ArrayList<Arc> arcol;

  Arcs(int num) {
    arcol = new ArrayList<Arc>();
    for (int i = 0; i < num; i++) {
      arcol.add(new Arc());
    }
  }

  void run() {
    for (int i = 0; i < arcol.size(); i++) {
      Arc af = (Arc) arcol.get(i);
      af.render();
    }
  }
}
