
size (200, 200);
background(255);
noFill();

float a = random (100);
float c = random (100, 255);

strokeWeight (a/10);
stroke (a, c);

for (int i= 10; i < c; i+=a/10) {
  ellipse (i, a, c, c);
  rect (i, i, c, c);
}
