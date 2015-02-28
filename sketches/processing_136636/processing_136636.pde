
size(600,600);

//color
float color1=random(0, 255);
float color2=random(0, 255);
float color3=random(0,255);
float opacity=random(150, 200);

background(color1, color2, color2, opacity);

int x = 10;
while (x <= 600) {
  noStroke();
  fill(color1, color2, color3, opacity);
  ellipse(10, x, x, 20);
  x = x + 50;
}

int a = 10;
while (a <= 600) {
  noStroke();
  fill(color1, color2, color3, opacity);
  ellipse(a, a, 10, 20);
  a = a + 50;
}

int d = 10;
while (d <= 600) {
  noStroke();
  fill(color1/8, color2/8, color3/8, opacity);
  ellipse(d, 300, 10, d);
  d = d + 50;
}

int c = 10;
while (c <= 600) {
  noStroke();
  fill(color1/2, color2/2, color3/2, opacity);
  ellipse(c, sin(c)*100, 5, c);
  c = c + 100;
}

int z = 10;
while (z <= 600) {
  noStroke();
  fill(color1/2, color2/2, color3/2, opacity);
  ellipse(500+sin(z)*100, 500+sin(z)*100, 5, z);
  z = z + 100;
}

int k = 10;
while (k <= 500) {
  noStroke();
  fill(color1, color2, color3, opacity);
  ellipse(500, k, k, 20);
  k = k + 50;
}


