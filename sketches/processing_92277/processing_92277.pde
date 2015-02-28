
ArrayList <ball> list = new ArrayList <ball> ();
void setup() {
  size(500, 500);
}
void draw() {
  for(int i = 0; i < list.size(); i++) {
    list.get(i).drawball();
    if(list.get(i).s - 5 < 1 && list.get(i).get) {
      list.remove(i);
    }
  }
}
void mouseClicked() {
  list.add(new ball(mouseX, mouseY, random(15, 50), PI));
}
class ball {
  float x, y, s, ix, iy, d;
  boolean get;
  ball(float ixv, float iyv, float sv, float dv) {
    ix=ixv;
    iy=iyv;
    s=sv;
    x=ix;
    y=iy;
    d=dv;
  }
  void drawball() {
    ellipse(x, y, s, s);
    x+=sin(d)*3;
    y+=cos(d)*3;
    get = dist(ix, iy, x, y) > 50;
    if(get && s-random(0.25, 1) > 0) {
      list.add(new ball(x, y, s-10, random(PI/2, PI*1.5)));
      s-=random(0.5, 1);
    }
  }
}
