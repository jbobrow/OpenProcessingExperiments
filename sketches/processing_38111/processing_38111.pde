
class Boundary {

  float x;
  float y;
  float w;
  float h;

  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    float box2dW = box2d.scaleScreenToWorld(w/2);
    float box2dH = box2d.scaleScreenToWorld(h/2);
    Vec2 center = new Vec2(x,y);

    PolygonDef sd = new PolygonDef();
    sd.setAsBox(box2dW, box2dH);
    sd.density = 0;    // No density means it won't move!
    sd.friction = 0.3f;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.screenToWorld(center));
    b = box2d.createBody(bd);
    b.createShape(sd);
  }

  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}



