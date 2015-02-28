
size(500, 200);
smooth();
background(0);

int space=20;
int bigness=30;

for (int y=space; y<height-space; y+=bigness) {
  pushMatrix();
  translate(0, bigness+120);

  for (int x=space; x<width-space; x+=bigness) {
    translate(bigness, 0);

    pushMatrix();
    rotate(radians(random(360)));
    stroke(x, width, width);
    line(0, 0, (bigness-5)/2, 0);
    popMatrix();
  }
  popMatrix();
}


