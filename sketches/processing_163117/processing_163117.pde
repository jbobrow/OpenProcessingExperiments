
ArrayList<ComeUpNear> cuns;

void setup() {
  size(640, 480);
  cuns = new ArrayList<ComeUpNear>();

  for (int i=0; i<50; i++) {
    cuns.add(new ComeUpNear());
  }
}

void draw() {
  background(90);
  int len = cuns.size();
  for (int i=0; i<len; i++) {
    ComeUpNear c = cuns.get(i);
    c.setOthers(cuns);
    c.draw();
  }
}

class ComeUpNear {
  float x, y;
  float rad, speed;
  float tx, ty, trad;
  int age, life;
  ComeUpNear() {
    x = int(random(0, width));
    y = int(random(0, height));
    rad = PI;//random(0, PI*2);
    speed = random(0.8, 1.5);
  }

  void setOthers(ArrayList<ComeUpNear> _cuns) {
    if (_cuns.size() != 0) {
      ComeUpNear near = null;
      float minDist = 9999;
      int len = _cuns.size();
      for (int i=0; i<len; i++) {
        ComeUpNear c = _cuns.get(i);
        if (c != this) {
          float cDist = dist(x, y, c.x, c.y);
          if (cDist < minDist) {
            minDist = cDist;
            near = c;
          }
        }
      }
      if(near != null) {
        setTargetPt(near.x, near.y);
      }
    }
  }

  void setTargetPt(float _tx, float _ty) {
    tx = _tx;
    ty = _ty;
    trad = atan2((ty-y), (tx-x));
  }

  void draw() {
    //rad += (trad-rad) / 10;
    float distRad = trad - rad;
    if (distRad > 0.05) {
      rad += 0.05;
    }
    else if (distRad < -0.05) {
      rad -= 0.05;
    }
    else {
      rad = trad;
    }

    float addX = cos(rad)*speed;
    float addY = sin(rad)*speed;

    x += addX;
    y += addY;

    if (x > width) {
      x = width - x;
    }
    if (y > height) {
      y = height - y;
    }

    pushMatrix();
    translate(x, y);
    rotate(rad+PI/2);

    noStroke();
    fill(255, 100);
    beginShape();
    vertex(0, 0);
    vertex(10, 10);
    vertex(0, -15);
    vertex(-10, 10);
    endShape(CLOSE);

    popMatrix();
  }
}



