
PVector mid, v, m;
void setup() {
  size(640, 480);
  mid = new PVector(0, 0);
  v = new PVector(-100, 100);
}
void draw() {
  background(255);
  translate(width*0.5, height*0.5);
  ellipse(0, 0, 10, 10);
  m = new PVector(mouseX - width*0.5, mouseY - height*0.5);
  line(mid.x, mid.y, v.x, v.y);
  line(mid.x, mid.y, m.x, m.y);
  fill(0);
  text("angleBetween: " + nf(degrees(PVector.angleBetween(PVector.sub(mid, v), PVector.sub(mid, m))),2,2), 20-width*0.5, 20-height*0.5, 200, 200);
  text("vAtan2cent: " + nf(degrees(vAtan2cent(mid, m, v)),2,2), 20-width*0.5, 40-height*0.5, 200, 200);
  text("vAtan2cent180: " + nf(degrees(vAtan2cent180(mid, m, v)),2,2), 20-width*0.5, 60-height*0.5, 200, 200);
  text("vAtan2cent360: " + nf(degrees(vAtan2cent360(mid, m, v)),2,2), 20-width*0.5, 80-height*0.5, 200, 200);
}
float vAtan2(PVector v1, PVector v2) {
  return atan2(v1.x, v1.y) - atan2(v2.x, v2.y);
}
float vAtan2cent(PVector cent, PVector v2, PVector v1) {
  v1.sub(cent);
  v2.sub(cent);
  v2.mult(-1);
  float ang = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  return ang;
}
float vAtan2cent180(PVector cent, PVector v2, PVector v1) {
  v1.sub(cent);
  v2.sub(cent);
  v2.mult(-1);
  float ang = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  if(ang < 0) ang = TWO_PI + ang ;
  ang -=PI;
  return ang;
}
float vAtan2cent360(PVector cent, PVector v2, PVector v1) {
  v1.sub(cent);
  v2.sub(cent);
  float ang = atan2(v2.y, v2.x) - atan2(v1.y, v1.x);
  if(ang < 0) ang = TWO_PI + ang ;
  return ang;
}
