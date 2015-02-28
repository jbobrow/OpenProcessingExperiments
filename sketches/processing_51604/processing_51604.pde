

size(200, 200);
int a = 0;
for(int i = -10; i < 200; i += 35) {
  a = (i < 0) ? 0 : 255;
  stroke(a);
  line(i, 0, i, 200);
}

int b = 0;
for (int i = 5; i < 200; i += 35) {
  b = (i < 0) ? 0 : 255;
  stroke(b);
  line(0, i, 200, i);
}






