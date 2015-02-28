
float angle, radius, lx, ly, sz = 5;
int num = 40;
PVector[] dots = new PVector[num];
PVector[] endPos = new PVector[num];

void setup() {
  size(500, 500);
  background(20);
  fill(#FFA41A);
  noFill();
  stroke(#FFA41A);
  strokeWeight(2);
  strokeJoin(ROUND);
  radius = width*.4;

  for (int i=0; i<num; i++) {
    float x = random(width*.33, width*.66);
    float y = random(height*.33, height*.66);
    dots[i]= new PVector(x, y);
  }

  for (int i=0; i<num; i++) {
    float px = width/2 + sin(angle)*radius;
    float py = height/2 + cos(angle)*radius;
    endPos[i]= new PVector(px, py);
    angle+=TWO_PI/num;
  }
}

void draw() {
  background(20);
  beginShape();
  for (int i=0; i<num; i++) {
    dots[i].x = lerp(dots[i].x, endPos[i].x, 0.02);
    dots[i].y = lerp(dots[i].y, endPos[i].y, 0.02);
    if (i==0) vertex(dots[i].x, dots[i].y);
    vertex(dots[i].x, dots[i].y);
    if (i==num-1) vertex(dots[i].x, dots[i].y);
  }
  endShape(CLOSE);
  
  if (frameCount%241==0) {
    for (int i=0; i<num; i++) {
    float x = random(width*.33, width*.66);
    float y = random(height*.33, height*.66);
    dots[i]= new PVector(x, y);
  }
  
  
  }
}
