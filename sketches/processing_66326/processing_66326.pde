
PVector l;
PVector v;
PVector g;

void setup() {
  size(800, 800);
  smooth();
  float a = random(0, width/2);
  l = new PVector(a, height-a);
  v = new PVector(1.5, 1.5);
  g = new PVector(0.05, 0.1);
}

void draw() {
  background (33);
  l.add(v);
  v.add(g);
  if (l.x >= width-50) {
    v.x = (v.x * -1)/1.5;
    g.x = g.x * -1;
    l.x = width-50;
  }
//  if (l.x >= width/2-75) {
//    if (l.y >= height/2-75 && l.y <= height/2+75) {
//      v.x = (v.x * -1)/1.5;
//      g.x = g.x * -1;
//      l.x = width/2-75;
//    }
//  }
  if (l.x <= 50) {
    v.x = (v.x * -1)/1.5;
    g.x = g.x * -1;
    l.x = 50;
  }
//  if (l.x <= width/2+75) {
//    if (l.y >= height/2-75 && l.y <= height/2+75) {
//      v.x = (v.x * -1)/1.5;
//      g.x = g.x * -1;
//      l.x = width/2+75;
//    }
//  }
  if (l.y >= height-50) {
    v.y = (v.y * -1)/1.5;
    g.y = g.y * -1;
    l.y = height-50;
  }
  //    if (l.y >= height/2-75) {
  //      if (l.x >= (width/2-75) && l.x <= width/2+75) {
  //        v.y = (v.y * -1)/1.5;
  //        g.y = g.y * -1;
  //        l.y = height/2-75;
  //      }
  //    }
  if (l.y <= 50) {
    v.y = (v.y * -1)/1.5;
    g.y = g.y * -1;
    l.y = 50;
  }
  //    if (l.y <= height/2+75) {
  //      if (l.x >= width/2-75 && l.x <= width/2+75) {
  //        v.y = (v.y * -1)/1.5;
  //        g.y = g.y * -1;
  //        l.y = height/2+75;
  //      }
  //}
fill(255);
rectMode(CENTER);
//rect(width/2, height/2, 100, 100);
ellipse(l.x, l.y, 100, 100);
}

