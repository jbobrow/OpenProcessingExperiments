
int n = 5;
PVector[] real = new PVector[maxPoint + 1];
PVector[] base = new PVector[maxPoint + 1];
void real(){
  real[0] = new PVector(25, 400);
  real[1] = new PVector(275, 400);
  real[2] = new PVector(400, - 125 * sqrt(3)+ 400);
  real[3] = new PVector(525, 400);
  real[4] = new PVector(775, 400);
}
void base(){
  PVector p1 = real[0];
  base[0] = new PVector(0, 0);
  PVector p2 = real[n - 1];
  base[n - 1] = new PVector(1, 0);
  float l0 = p2.dist(p1);
  for (int i = 1; i < n - 1; i ++){
    float l = real[i].dist(p1);
    float a = atan2 (real[i].y - p1.y, real[i].x - p1.x) - atan2(p2.y - p1.y, p2.x - p1.x);
    base[i] = new PVector(cos(a) * l / l0, sin(a) * l / l0);
  }
}

