
int choice;

void setup() {
  size(800, 500);
  background(255); 
  choice = 1;
}

void draw() {
  if (mousePressed) {
    mark(new PVector(mouseX, mouseY), sqrt(sq(pmouseX - mouseX) + sq(pmouseY - mouseY)));
  }
}

void hanging_vine(PVector loc, float scale) {
  float angle = random(2 * PI/5, 3 * PI/5);
  float c_angle = random(PI/9, PI/7);
  float w = 8.0;
  PVector axis1 = new PVector(cos(angle), sin(angle));
  axis1.mult(scale * random(1.5, 2));
  PVector l = PVector.add(loc, axis1);
  PVector l2 = new PVector(loc.x - random(1) * scale/20, loc.y + random(-1, 1) * scale/20);
  loc.add(new PVector(random(1) * scale/20, random(-1, 1) * scale/20));
  
  float tilt = abs(PI/2 - angle) / 2;  
  float angle_l = (angle > PI/2) ? tilt + c_angle : c_angle - 2 * tilt;
  float angle_r = (angle > PI/2) ? c_angle - 2 * tilt : tilt + c_angle;
  
  PVector loc_left = new PVector(cos(PI), sin(PI));
  loc_left.mult(w * random(1));
  loc_left.add(loc);
  PVector l_left = new PVector(cos(PI + angle - angle_l), sin(PI + angle - angle_l));
  l_left.mult(w * random(1));
  l_left.add(l);
  PVector loc_right = new PVector(cos(0), sin(0));
  loc_right.mult(w * random(1));
  loc_right.add(loc);
  PVector l_right = new PVector(cos(PI + angle + angle_r), sin(PI + angle + angle_r));
  l_right.mult(w * random(1));
  l_right.add(l);
  
  PVector[] controls = {loc_right, l_right, l_left, loc_left};

  sharp_stroke(loc, l, l2, controls);
}

void grass(PVector loc, float scale) {
  for (int i = 0; i < random(1, 4); i++) {
  float angle = -1 * random(2 * PI/5, 3 * PI/5);
  float c_angle = -1 * random(3 * PI/7, 4 * PI/7);

  PVector axis1 = new PVector(cos(angle), sin(angle));
  axis1.mult(scale * random(1.5, 2));
  PVector l = PVector.add(loc, axis1);
  float w = 0.1 * scale;

  PVector l2 = new PVector(loc.x - random(1) * scale/20, loc.y + random(-1, 1) * scale/20);
  loc.add(new PVector(random(1) * scale/20, random(-1, 1) * scale/20));
  
  float tilt = abs(PI/2 - angle) / 2;  
  float angle_l = (angle > PI/2) ? tilt + c_angle : c_angle - 2 * tilt;
  float angle_r = (angle > PI/2) ? c_angle - 2 * tilt : tilt + c_angle;
  
  PVector loc_left = new PVector(cos(PI), sin(PI));
  loc_left.mult(w * random(1));
  loc_left.add(loc);
  PVector l_left = new PVector(cos(PI + angle - angle_l), sin(PI + angle - angle_l));
  l_left.mult(w * random(1));
  l_left.add(l);
  PVector loc_right = new PVector(cos(0), sin(0));
  loc_right.mult(w * random(1));
  loc_right.add(loc);
  PVector l_right = new PVector(cos(PI + angle + angle_r), sin(PI + angle + angle_r));
  l_right.mult(w * random(1));
  l_right.add(l);
  
  PVector[] controls = {loc_right, l_left, l_right, loc_left};
  sharp_stroke(loc, l, l2, controls);
  loc.add(new PVector(random(4, 10), random(-5, 5)));
  }
}

void sharp_stroke(PVector loc, PVector l, PVector l2, PVector[] c) {
  beginShape();
  vertex(loc.x, loc.y);
  bezierVertex(c[0].x, c[0].y, c[1].x, c[1].y, l.x, l.y);
  bezierVertex(c[2].x, c[2].y, c[3].x, c[3].y, l2.x, l2.y);
  endShape();
}

void leaf_stroke(PVector loc, PVector l, PVector[] c) {
  beginShape();
  vertex(loc.x, loc.y);
  bezierVertex(c[0].x, c[0].y, c[1].x, c[1].y, l.x, l.y);
  bezierVertex(c[2].x, c[2].y, c[3].x, c[3].y, loc.x, loc.y);
  endShape();
}

void chieh_leaf(PVector oldloc, float scale, float angle, float c_angle, float w) {
  PVector loc = new PVector(oldloc.x, oldloc.y);
  PVector axis1 = new PVector(cos(angle), sin(angle));
  loc.add(PVector.mult(axis1, scale / 10));
  axis1.mult(scale);
  PVector l = PVector.add(loc, axis1);
  
  float tilt = abs(PI/2 - angle) / 2;  
  float angle_l = (angle > PI/2) ? tilt + c_angle : c_angle - 2 * tilt;
  float angle_r = (angle > PI/2) ? c_angle - 2 * tilt : tilt + c_angle;
  
  PVector loc_left = new PVector(cos(angle + angle_l), sin(angle + angle_l));
  loc_left.mult(w);
  loc_left.add(loc);
  PVector l_left = new PVector(cos(PI + angle - angle_l), sin(PI + angle - angle_l));
  l_left.mult(w);
  l_left.add(l);
  PVector loc_right = new PVector(cos(angle - angle_r), sin(angle - angle_r));
  loc_right.mult(w);
  loc_right.add(loc);
  PVector l_right = new PVector(cos(PI + angle + angle_r), sin(PI + angle + angle_r));
  l_right.mult(w);
  l_right.add(l);
  
  PVector[] controls = {loc_right, l_right, l_left, loc_left};
  leaf_stroke(loc, l, controls);
}

void chieh(PVector loc, float scale) {
  int n = int(random(3, 5));
  for (int i = 0; i < n; i++) {
    float angle = random(2 * PI);
    float c_angle = random(PI/3, PI/2);
    float w = random(1.0/3, 1.0/2) * scale;
    chieh_leaf(loc, scale, angle, c_angle, w);
  }
}

void speckle(PVector loc, float scale) {
 stroke(0);
 noFill();
 float w = random(scale);
 if (w < scale/2) fill(0);
 float num = random(6, 10);
 float angle = 0;
 PVector curr = loc;
 PVector first;
 float inc = 2 * PI / num;
 beginShape();
 for (int i = 0; i < num; i++) {
   angle = i * inc + random(inc);
   curr = PVector.add(loc, PVector.mult(new PVector(cos(angle), sin(angle)), random(w * .75, w)));
   if (i == 0) {
      first = curr;
      vertex(first.x, first.y);
   }
   curveVertex(curr.x, curr.y);
 }
 vertex(first.x, first.y);
 endShape(CLOSE);
}

void keyPressed() {
 if (key == ' ') background(255);
 else if (key == '1') choice = 1;
 else if (key == '2') choice = 2;
 else if (key == '3') choice = 3;
 else choice = 4;
}

void mark(PVector loc, float scale) {
  fill(0);
  noStroke();
  if (choice == 1) chieh(loc, scale);
  else if (choice == 2) hanging_vine(loc, scale);
  else if (choice == 3) grass(loc, scale);
  else speckle(loc, scale);
}

