
size(400, 400);
background(0);
colorMode(RGB);

for (int a = 0; a < height; a += 1) {
  for (int b = 0; b <width; b += 1) {
    stroke(a, b, b);
    point(b, a);
  }
}

colorMode(HSB, 360, 100, 100, 100);
noStroke();

for (int i=0; i < 20; i++)
{
  int Xpos = int(random(0, 400));
  int Ypos = int(random(0, 400));
  int c = int(random(0, 360));
  int size =  int(random(40, 100));
  int size2 = int(size/5);

  fill(c, 100, 100, 10);

  for (int ia=0; ia<16; ia++) {
    ellipse(Xpos, Ypos, size, size);
    size = size  - 10;
  }
}


