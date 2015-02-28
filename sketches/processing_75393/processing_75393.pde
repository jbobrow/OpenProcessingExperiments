
//Jeffrey C. CP1 Hundred Shapes 10/12/12
// URL: http://www.openprocessing.org/user/21148
size(500, 500, P3D);
background(0);
for (int n=0;(n<1001);n++) {
  int x = int(random(0, 500));
  int y = int(random(0, 500));
  int z = int(random(-1500, -1000));
  fill(int(random(100, 255)), int(random(100, 255)), int(random(100, 255)), int(random(100, 255)));
  translate(x, y, z);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  box(int(random(100, 500)));
}
