
size(800,800);
background(255,255,255);

int a = 800;
while (a > 0) {
  line(0, a, 800, a);
  line(0, a-1, 800, a+1);
  line(a, 0, a, 800);
  line(a-1, 0, a+1, 800);
  a = a - 3;
}
